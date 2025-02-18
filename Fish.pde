
float salmonPriceBase=300;
float bassPriceBase=300;
float codPriceBase=300;
float carpPriceBase=300;
float californiasheepheadPriceBase=400;
float crabPriceBase=400;
float sharkPriceBase=800;
float rayPriceBase=800;
float swordfishPriceBase=800;
float wahooPriceBase=800;
float blueWhalePriceBase=1200;
float orcaPriceBase=1200;
float legendaryPriceBase=10000;

float salmonPrice=300;
float bassPrice=300;
float codPrice=300;
float carpPrice=300;
float californiasheepheadPrice=400;
float crabPrice=400;
float sharkPrice=800;
float rayPrice=800;
float swordfishPrice=800;
float wahooPrice=800;
float blueWhalePrice=1200;
float orcaPrice=1200;
float legendaryPrice=10000;

float salmonPriceMultiplier=1;
float bassPriceMultiplier=1;
float codPriceMultiplier=1;
float carpPriceMultiplier=1;
float californiasheepheadPriceMultiplier=1;
float crabPriceMultiplier=1;
float sharkPriceMultiplier=1;
float rayPriceMultiplier=1;
float swordfishPriceMultiplier=1;
float wahooPriceMultiplier=1;
float blueWhalePriceMultiplier=1;
float orcaPriceMultiplier=1;
float legendaryPriceMultiplier=1;


class fish {

  float x;
  float y;

  float w;
  float h;

  float speed;
  boolean spawnLeft;
  boolean spawnRight;
  boolean movingRight;
  boolean movingLeft;
  boolean remove = false;
  boolean salmon;
  PImage Salmon;
  boolean bass;
  PImage Bass;
  boolean cod;
  PImage Cod;
  boolean carp;
  PImage Carp;
  boolean californiaSheephead;
  PImage CaliforniaSheephead;
  boolean crab;
  PImage Crab;
  boolean shark;
  PImage Shark;
  boolean ray;
  PImage Ray;
  boolean swordfish;
  PImage Swordfish;
  boolean wahoo;
  PImage Wahoo;
  boolean blueWhale;
  PImage BlueWhale;
  boolean orca;
  PImage Orca;
  boolean legendary;
  PImage Legendary;
  
  
  
  

  int fishChance;
  float totalWeight;
  color fishColor = #050203;

  fish() {
    totalWeight = 975; // Adjust as needed for total weight of all fish rarities
    fishChance = int(random(0, totalWeight));

    w = random(30, 40);
    h = random(10, 30);
    y = random(470, height - 70);
    speed = random(3, 6);
    if (fishChance%2==0) {
      spawnLeft=true;
    } else {
      spawnRight=true;
    }
    Crab = loadImage("crab.png");
    if (spawnLeft) {
      x = random(-500 / 2, 0);
      Salmon=loadImage("salmonRight.png");
      Bass=loadImage("bassRight.png");
      Cod=loadImage("codRight.png");
      Carp=loadImage("carpRight.png");
      CaliforniaSheephead=loadImage("californiaSheepheadRight.png");
      Shark=loadImage("sharkRight.png");
      Ray=loadImage("rayRight.png");
      Swordfish=loadImage("swordfishRight.png");
      Wahoo=loadImage("wahooRight.png");
      BlueWhale=loadImage("blueWhaleRight.png");
      Orca=loadImage("orcaRight.png");
      Legendary=loadImage("legendaryRight.png");
    } else {
      x = random(width, width + 500);
      Bass=loadImage("bassLeft.png");
      Salmon=loadImage("salmonLeft.png");
      Cod=loadImage("codLeft.png");
      Carp=loadImage("carpLeft.png");
      CaliforniaSheephead=loadImage("californiaSheepheadLeft.png");
      Shark=loadImage("sharkLeft.png");
      Ray=loadImage("rayLeft.png");
      Swordfish=loadImage("swordfishLeft.png");
      Wahoo=loadImage("wahooLeft.png");
      BlueWhale=loadImage("blueWhaleLeft.png");
      Orca=loadImage("orcaLeft.png");
      Legendary=loadImage("legendaryLeft.png");
    }

    movingRight = x <= width / 2;
    movingLeft = !movingRight;

    fishType(); // Call the method to determine fish type

    if (bass) {
      speed=random(3,6);
      w=random(50, 150);
    }
    if (cod) {
       speed=random(3,6);
      w=random(20, 200);
    }
    if (carp) {
       speed=random(3,6);
      w=random(100, 250);
    }
    if (californiaSheephead) {
       speed=random(5,6);
      w=random(70, 200);
    }
    if (crab) {
       speed=random(6,6);
      w=random(30, 150);
    }
    if (ray) {
       speed=random(5,6);
      w=random(30, 150);
    }
    if (shark) {
       speed=random(3,6);
      w=random(150, 250);
    }
    if (swordfish) {
       speed=random(5,7);
      w=random(150, 250);
    }
    if (wahoo) {
       speed=random(8);
      w=random(200, 250);
    }
    if (blueWhale) {
      speed=2;
      w=random(450, 600);
    }
    if (orca) {
      w=random(250, 350);
    }
    if (legendary) {
       speed=(10);
      w=200;
      h=200;
    }
  }

  void fishType() {
    // Common = 120, Uncommon = 140, Rare = 120, Very Rare = 90, Extremely Rare = 10, Legendary = 5
    if (fishChance < 120) {
      salmon = true;
    } else if (fishChance < 240) {
      bass = true;
    } else if (fishChance < 360) {
      cod = true;
    } else if (fishChance < 480) {
      carp = true;
    } else if (fishChance < 620) {
      californiaSheephead = true;
    } else if (fishChance < 760) {
      crab = true;
    } else if (fishChance < 800) {
      ray = true;
    } else if (fishChance < 850) {
      shark = true;
    } else if (fishChance < 880) {
      swordfish = true;
    } else if (fishChance < 910) {
      wahoo = true;
    } else if (fishChance < 950) {
      blueWhale = true; // Very rare
    } else if (fishChance < 970) {
      orca = true; // Very rare
    } else if (fishChance < 975) {
      legendary = true; // Legendary fish
    }
  }

  void display() {
    ellipseMode(CORNER);
    if (salmon) {
      h=34;
      w=100;
      if(LDM){
        fill(#EA93AF);
        ellipse(x,y,w,h);
        fill(0);
        textSize(w/2);
        text("Salmon",x-50,y+10);
      }else{
      image(Salmon, x, y, 100, 34);
      }
    } else if (bass) {
      h=w/1.2;
       if(LDM){
        fill(#187E36);
        ellipse(x,y,w,h);
        fill(0);
        textSize(w/2);
        text("bass",x-50,y+10);
       }else{
      image(Bass, x, y, w, h);
       }
    } else if (cod) {
      h=w/2.5;
      if(LDM){
        fill(#676553);
        ellipse(x,y,w,h);
        fill(0);
        textSize(w/2);
        text("cod",x-50,y+10);
       }else{
      image(Cod, x, y, w, h);
       }
      
    } else if (carp) {
      h=(w/3)*2;
      if(LDM){
        fill(#868251);
        ellipse(x,y,w,h);
        fill(0);
        textSize(w/2);
        text("carp",x-50,y+10);
       }else{
      image(Carp, x, y, w, h);
       }
    } else if (californiaSheephead) {
      h=w/2.5;
      if(LDM){
        fill(#517486);
        ellipse(x,y,w,h);
        fill(0);
        textSize(20);
        text("CaliforniaSheephead",x-50,y+10);
       }else{
      image(CaliforniaSheephead, x, y, w, h);
       }
    } else if (crab) {
      h=w/1.25;
       if(LDM){
        fill(#F0B133);
        ellipse(x,y,w,h);
        fill(0);
        textSize(w/2);
        text("crab",x-50,y+10);
       }else{
      image(Crab, x, y, w, h);
       }
    } else if (shark) {
      h=w/1.6;
      if(LDM){
        fill(#33DBF0);
        ellipse(x,y,w,h);
        fill(0);
        textSize(w/2);
        text("shark",x-50,y+10);
       }else{
      image(Shark, x, y, w, h);
       }
    } else if (ray) {
      h=w/1.4;
      if(LDM){
        fill(#A26821);
        ellipse(x,y,w,h);
        fill(0);
        textSize(w/2);
        text("ray",x-50,y+10);
       }else{
      image(Ray, x, y, w, h);
       }
    } else if (swordfish) {
      h=w/2;
      if(LDM){
        fill(#B2D1E5);
        ellipse(x,y,w,h);
        fill(0);
        textSize(w/2);
        text("swordfish",x-50,y+10);
       }else{
      image(Swordfish, x, y, w, h);
       }
    } else if (wahoo) {
      h=w/2.8;
        if(LDM){
        fill(#DEECF5);
        ellipse(x,y,w,h);
        fill(0);
        textSize(w/2);
        text("wahoo",x-50,y+10);
       }else{
      image(Wahoo, x, y, w, h);
       }
    } else if (blueWhale) {
      h=w/2.3;
       if(LDM){
        fill(#0A3048);
        ellipse(x,y,w,h);
        fill(0);
        textSize(w/2);
        text("blueWhale",x-50,y+10);
       }else{
      image(BlueWhale, x, y, w, h);
       }
       
    } else if (orca) {
      h=w/1.7;
      if(LDM){
        fill(#010508);
        ellipse(x,y,w,h);
        fill(0);
        textSize(w/2);
        text("orca",x-50,y+10);
       }else{
      image(Orca, x, y, w, h);
       }
    } else if (legendary) {
      if(LDM){
        fill(#010508);
        ellipse(x,y,w,h);
        fill(0);
        textSize(30);
        text("orca",x-50,y+10);
       }else{
      image(Legendary,x,y,100,100);
       }
    }
  }

  void update() {
    if (movingRight) {
      x += speed;
    } else {
      x -= speed;
    }

    if (spawnRight && x < 0 - 100 ) {
      remove=true;
    }
    if (spawnLeft && x > width + 100) {
      remove = true;
    }
    
  }
}
