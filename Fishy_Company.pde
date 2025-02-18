int numCircles = 5; //<>//
float minimumOpacity=255;
float[] trailX = new float[numCircles];
float[] trailY = new float[numCircles];
float baitSize = 8;
float minTrailSize = 6;
color baitColor = #CBB927;
color baitColor1;
color baitColor2;
int fishAmount = 3;
int fishCatched;
boolean letter=true;
PFont main;
PImage fishBucketIcon;
PImage sea;
PImage sky;
PImage gear;
PImage upgradeIcon;
PImage fishMarket;
PImage scroll;
PImage resistanceIcon;
PImage lock;
boolean testKeys=false;
boolean pause=false;
boolean docked=true;
boolean fishInventory=false;
boolean settings=false;
boolean upgrades=false;
boolean market=false;

boolean spawnLeft;
boolean spawnRight;
boolean movingRight;
boolean movingLeft;
boolean boatUP=false;
boolean boatDOWN=true;
boolean remove = false;
boolean baitUpgrades=false;

int lastFrameTime;
float deltaTime;
PImage fishingRod;
PImage surface;
PImage seaWeedSpritesheet;
PImage [][] seaWeedMovement;
PImage [][] birdMovement;
PImage Salmon;
PImage Bass;
PImage Cod;
PImage Carp;
PImage CaliforniaSheephead;
PImage Crab;
PImage Shark;
PImage Ray;
PImage bigBait;
PImage heavyBait;
PImage Swordfish;
PImage Wahoo;
PImage BlueWhale;
PImage Orca;
PImage Legendary;
PImage fishyCompanyLogo;
PImage circle;
PImage bubble;
PImage bird;
PImage ninjaBait;
PImage chestIcon;
PImage check;
int salmons;
int basses;
int cods;
int carps;
int californiaSheepheads;
int crabs;
int sharks;
int rays;
int swordfishes;
int wahoos;
int blueWhales;
int orcas;
int legendaries;

int totalTime = 120 * 1000; //milliS for one clock cycle
int startHour = 6;
int endHour = 18;
int startTime;

float currentf;
float currentBirdf;
float birdRow;
float boaty=290;

ArrayList<fish> fishlist;
ArrayList<bubble> bubblelist;
ArrayList<bird> birdlist;

void setup() {

  baitPos = new PVector(width/2, height/2);

  startTime=millis();

  skinManager = new skinManager();
  skinManager.addSkin( "Gold"); 
  skinManager.addSkin( "RedBlue"); 
  skinManager.addSkin("Ice"); 
  skinManager.addSkin( "Fire"); 
  skinManager.addSkin( "Flower");
  skinManager.addSkin("Forest");  
  skinManager.addSkin("Wave"); 
  skinManager.addSkin( "Candy"); 
  skinManager.addSkin( "Carrot");
  skinManager.addSkin("Rainbow");  

  size(1200, 900);
  noStroke();
  lock=loadImage("lock.png");
  check=loadImage("check.png");
  chestIcon=loadImage("chestIcon.png");
  ninjaBait=loadImage("ninjaBait.png");
  heavyBait=loadImage("heavyBait.png");
  resistanceIcon=loadImage("baits.png");
  bigBait=loadImage("bigBait.png");
  bubble=loadImage("bubble.png");
  sky=loadImage("sky.jpg");
  dock=loadImage("dock.png");
  dockFloor=loadImage("dockFloor.png");
  boat1=loadImage("boat1.png");
  baitIcon=loadImage("baitIcon.png");
  main = createFont("main.ttf", 30);
  fishBucketIcon=loadImage("fishBucketIcon.png");
  upgradeIcon=loadImage("upgradeIcon.png");
  fishMarket=loadImage("fishMarket.png");
  greenArrow1 = loadImage("greenArrow1.png");
  greenArrow2 = loadImage("greenArrow2.png");
  redArrow1 = loadImage("redArrow1.png");
  redArrow2 = loadImage("redArrow2.png");
  Salmon=loadImage("salmonRight.png");
  fishingRod=loadImage("fishingRod.png");
  Bass=loadImage("bassRight.png");
  Cod=loadImage("codRight.png");
  Carp=loadImage("carpRight.png");
  Crab=loadImage("crab.png");
  circle=loadImage("circle.png");
  scroll=loadImage("scroll.png");
  CaliforniaSheephead=loadImage("californiaSheepheadRight.png");
  Shark=loadImage("sharkRight.png");
  Ray=loadImage("rayRight.png");
  Swordfish=loadImage("swordfishRight.png");
  Wahoo=loadImage("wahooRight.png");
  BlueWhale=loadImage("blueWhaleRight.png");
  Orca=loadImage("orcaRight.png");
  Legendary=loadImage("legendaryRight.png");
  surface=loadImage("surface.png");
  gear=loadImage("gear.png");
  fishyCompanyLogo = loadImage("fishyCompanyLogo.png");
  bird=loadImage("bird.png");
  fishlist = new ArrayList<fish>();
  bubblelist=new ArrayList<bubble>();
  birdlist=new ArrayList<bird>();
  lastFrameTime = millis();
}

void draw() {

  // Upgrade
  baitSize = sizeUpgradeLvl*10+8;
  resistanceUpgrade = 10 + resistanceUpgradeLvl*50;
  minTrailSize = baitSize-2;
  days();

  int currentFrameTime = millis();
  deltaTime = (currentFrameTime - lastFrameTime) / 1000.0; // Convert to seconds
  lastFrameTime = currentFrameTime;



  background(sky);
  if (docked) {
    dock();
  }
  if (!docked) {


    for (int i = 0; i < birdlist.size(); i++) {
      bird abird = birdlist.get(i);
      abird.display();
      if (!pause) {
        abird.update();
      }

      if (abird.remove) {
        birdlist.remove(abird);
      }
    }

    baitSkins();
    UI();
    bait();
    spawnfish();

    for (int i = 0; i < bubblelist.size(); i++) {
      bubble abubble = bubblelist.get(i);
      abubble.display();
      if (!pause) {
        abubble.update();
      }

      if (abubble.remove) {
        bubblelist.remove(abubble);
      }
    }

    for (int i = 0; i < fishlist.size(); i++) {
      fish afish = fishlist.get(i);
      afish.display();
      if (!pause) {
        afish.update();
      }
      afish.fishType();
      if (afish.remove) {
        fishlist.remove(afish);
      }
    }






    if (!pause) {
      catchfish();
    }
  }
  dockButton();

  if (inShop && !market && !upgrades) {
    shop();
  }
  if (upgrades) {
    upgrades();
  }
  if (baitUpgrades) {
    baitUpgrades();
  }
  if (market) {
    market();
  }
  if (letter) {
    letter();
  }

  quota();
}

void spawnfish() {

  if (fishlist.size()<fishAmount) {
    fishlist.add(new fish());
  }
  if (bubblelist.size()<3) {
    bubblelist.add(new bubble(random(width), random(height+100, height+500)));
  }
  if (birdlist.size()<2) {
    birdlist.add(new bird(random(width+2900, width+8000), random(0, 100)));
  }
}

void catchfish() {
  for (fish afish : fishlist) {
    if (baitPos.x>=afish.x-baitSize/2&& baitPos.x<=afish.x+afish.w+baitSize/2 && baitPos.y>=afish.y-baitSize/2 && baitPos.y<=afish.y+afish.h+baitSize/2) {
      fishCatched++;
      if (afish.bass) {
        basses++;
      }
      if (afish.salmon) {
        salmons++;
      }
      if (afish.cod) {
        cods++;
      }
      if (afish.carp) {
        carps++;
      }
      if (afish.californiaSheephead) {
        californiaSheepheads++;
      }
      if (afish.crab) {
        crabs++;
      }
      if (afish.ray) {
        rays++;
      }
      if (afish.shark) {
        sharks++;
      }
      if (afish.swordfish) {
        swordfishes++;
      }
      if (afish.wahoo) {
        wahoos++;
      }
      if (afish.blueWhale) {
        blueWhales++;
      }
      if (afish.orca) {
        orcas++;
      }
      if (afish.legendary) {
        legendaries++;
      }
      afish.remove=true;
    }
  }
}

void UI() {
  boatx=width/2-300;
  image(boat1, boatx, 400-110);
  textSize(30);
  fill(#3753A0);
  rect(0, 400, width, height-200);
  fill(#161B71);
  rect(0, 500, width, height-300);
  fill(#0F1355);
  rect(0, 600, width, height-400);
  fill(#0F1134);
  rect(0, 700, width, height-300);




  tint(255, 255);
  button(width-150, 60, 100, 100);
  image(fishBucketIcon, width-140, 65, 70, 70);
  if (mousePressed && mouseX>=width-140 && mouseX<=width-140+70 && mouseY >= 60 && mouseY<=160) {
    pause=true;
    fishInventory=true;
  }
  if (fishInventory) {
    button(width-650, 60, 500, 500);

    textSize(30);
    textMode(CENTER);
    text("X", width-640, 90);
    if (mousePressed && mouseX>=width-645 && mouseX<=width-645+30 && mouseY >= 65 && mouseY<=65+30) {
      fishInventory=false;
      pause=false;
    }
    fill(0);
    textSize(30);
    image(Salmon, width-640, 120, 100, 33);
    text("X "+salmons, width-640 + 120, 150);
    image(Bass, width-640, 140, 100, 100/1.2);
    text("X "+basses, width-640 + 120, 200);
    image(Cod, width-640, 200, 120, 70);
    text("X "+cods, width-640 + 120, 250);
    image(Carp, width-640, 270, 100, 75);
    text("X "+carps, width-640 + 120, 320);
    image(Crab, width-640, 350, 60, 60);
    text("X "+crabs, width-640 + 120, 390);
    image(Shark, width-640, 400, 110, 75);
    text("X "+sharks, width-640 + 120, 449);
    image(Ray, width-440, 100, 90, 75);
    text("X "+rays, width-400 + 120, 150);
    image(Swordfish, width-440, 160, 140, 75);
    text("X "+swordfishes, width-400 + 120, 210);
    image(Wahoo, width-450, 230, 170, 45);
    text("X "+wahoos, width-400 + 120, 260);
    image(BlueWhale, width-440, 280, 140, 75);
    text("X "+blueWhales, width-400 + 120, 320);
    image(Orca, width-440, 340, 140, 75);
    text("X "+orcas, width-400 + 120, 390);
    image(Legendary, width-400, 420, 90, 75);
    text("X "+legendaries, width-400 + 120, 470);

    text("Inventory", width-470, 90);
  }
  button(width/2-120, 0, 100, 80);
  button(width/2-20, 0, 140, 80);
  buttonShadeless(width/2-120, 0, 240, 40);
  textSize(20);
  fill(0);
  textMode(CORNER);
  text(int(money), width/2-100, 25);
  textMode(CENTER);
  text("kr", width/2+85, 25);
  textSize(20);
  text("Day "+ day, 495, 55);
  textSize(14);
  text(int((money/quota)*100)+" % of quota", 585, 55);

  clock();
  seaWeedSprites();
}
void letter() {
  imageMode(CENTER);
  buttonShadeless(300, 300, 600, 400);
  imageMode(CORNER);
  textSize(20);
  fill(0);
  rect(width/2-250, height/2-40, 400, 5);
  text("This weeks quota is "+ int(quota) +" kr", width/2-250, height/2-50);

  text("You have 5 days to earn enough money", width/2-250, height/2);
  rect(width/2-250, height/2+10, 450, 5);

  text("Sell fish and buy upgrades as necessary", width/2-250, height/2+50);
  rect(width/2-250, height/2+60, 450, 5);
  textSize(10);
  text("Fishy.Company@FishMail.fis", width/2-250, height/2+100);

  textSize(40);

  text("X", width/2+220, height/2-100);
  image(circle, width/2+200, height/2+105, 90, 90);
  image(fishyCompanyLogo, width/2+220, height/2+125, 50, 50);

  if (mousePressed && mouseX>=width/2+220 && mouseX<= width/2+220+40 && mouseY>=height/2-140 && mouseY<=height/2-140+40) {
    letter=false;
  }
}


void button(int x, int y, int w, int h) {
  fill(#835F01);
  rect(x-5, y-5, w, h);
  fill(#F0D48F);
  rect(x, y, w-10, h-10);
  fill(#6C5515);
  rect(x, y+h-10-h/10, w-10, h/10);
}
void buttonShadeless(int x, int y, int w, int h) {
  fill(#835F01);
  rect(x-5, y-5, w, h);
  fill(#F0D48F);
  rect(x, y, w-10, h-10);
}
