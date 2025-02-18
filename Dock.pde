boolean inShop;
boolean dockConfirmation=false;
boolean dockAnimation=false;
boolean sailConfirmation=false;
boolean sailAnimation=false;
boolean LDM=false;
boolean showFPS=true;
boolean deadLine=false;
int fadeT=0;
int fadeT2=0;
PImage boat1;
PImage dock;
PImage dockFloor;
PImage baitIcon;
float boatx=200;
boolean lootBoxConfirmation=false;
boolean customizeMenu=false;

void dockButton() {
  textFont(main);
  if (!docked) {
    button(20, 90, 80, 80);
    image(gear, 29, 93, 55, 55);

    if (mousePressed && mouseX>=20 && mouseX<=100 && mouseY>=90 && mouseY<=170) {
      settings=true;
    }

    if (settings) {
      button(105, 105, 300, 350);
      fill(#835F01);
      textSize(30);
      text("X", 360, 135);
      if (mousePressed && mouseX>=360 && mouseX<=390 && mouseY>=105 && mouseY <= 135) {
        settings=false;
      }

      if (!LDM && mousePressed && mouseX>=300 && mouseX<=330 && mouseY>=155 && mouseY <= 185) {
        LDM=true;
      }
      if ( LDM  && mousePressed && mouseX>=350 && mouseX<=380 && mouseY>=155 && mouseY <= 185) {
        LDM=false;
      }
      fill(0);
      textSize(20);
      text("Low detail mode", 120, 175);

      if (LDM) {
        fill(#60C45F);
        textSize(20);
        text("ON", 350, 175);
      } else {
        fill(#F01F31);
        textSize(20);
        text("OFF", 300, 175);
      }
      fill(0);
      text("Show FPS", 120, 225);
      if (!showFPS && mousePressed && mouseX>=250 && mouseX<=290 && mouseY>=205 && mouseY <= 245) {
        showFPS=true;
      }
      if ( showFPS  && mousePressed && mouseX>=300 && mouseX<=340 && mouseY>=205 && mouseY <= 245) {
        showFPS=false;
      }

      if (showFPS) {
        fill(#60C45F);
        textSize(20);
        text("ON", 300, 225);
      } else {
        fill(#F01F31);
        textSize(20);
        text("OFF", 250, 225);
      }
    }

    if (showFPS) {
      fill(0);
      textSize(30);
      text(round(frameRate), width-50, 30);
    }

    button(20, 20, 100, 50);
    textSize(50);
    textFont(main);
    fill(#835F01);
    text("Dock", 25, 50);
  }

  if (mousePressed && mouseX<=120 && mouseX>=20 && mouseY >= 20 && mouseY<=70) {
    pause=true;
    dockConfirmation=true;
  }
  if ( dockConfirmation) {

    if (!docked) {
      button(width/2-150, height/2-100, 300, 200);
      textSize(50);
      textFont(main);
      fill(#835F01);
      text("Go to dock?", width/2-100, height/2-30);
      button(width/2-130, height/2+10, 100, 50);
      fill(#835F01);
      textSize(40);
      text("No", width/2-120, height/2+40);
      button(width/2+30, height/2+10, 100, 50);
      fill(#835F01);
      text("Yes", width/2+40, height/2+40);
    }
    if ( mousePressed && mouseX>=width/2-130 && mouseX<=width/2-130+100 && mouseY>=height/2+10 && mouseY<=height/2+10+50) {
      dockConfirmation=false;
      pause=false;
    }
    if ( mousePressed && mouseX>=width/2+30 && mouseX<=width/2+30+100 && mouseY>=height/2+10 && mouseY<=height/2+10+50) {
      dockConfirmation=false;
      pause=false;
      dockAnimation=true;
      fishInventory=false;
      settings=false;
      prices();
    }
  }
  if (dockAnimation) {
    if (!docked) {
      fadeT+=7;
    }
    fill(0, fadeT);
    rect(0, 0, width, height);
    if (fadeT>=250) {
      docked=true;
      boatx=width;
    }
    if (docked) {
      fadeT-=7;
      boatx-=4;
      if (fadeT<=0 && boatx <= 200) {
        fadeT=0;
        dockAnimation=false;
      }
    }
  }
}
void dock() {

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

  if (bubblelist.size()<3) {
    bubblelist.add(new bubble(random(width), random(height+100, height+500)));
  }
  if (birdlist.size()<2) {
    birdlist.add(new bird(random(width+2900, width+8000), random(0, 100)));
  }
  fill(0);

  if (boatDOWN && !boatUP) {
    boaty+=0.07;
    if (boaty>=300) {
      boatDOWN=false;
      boatUP=true;
    }
  }
  if (boatUP && !boatDOWN) {
    boaty-=0.07;
    if (boaty<=295) {
      boatDOWN=true;
      boatUP=false;
    }
  }

  image(dock, 0, 60);
  textSize(30);
  fill(#2631A2);
  image(boat1, boatx, boaty);
  fill(#3753A0);
  rect(0, 400, width, height-200);
  fill(#161B71);
  rect(0, 500, width, height-300);
  fill(#0F1355);
  rect(0, 600, width, height-400);
  fill(#0F1134);
  rect(0, 700, width, height-300);

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
  image(dockFloor, 0, 400-44);
  button(20, 90, 80, 80);
  image(gear, 29, 93, 55, 55);
  if (mousePressed && mouseX>=20 && mouseX<=100 && mouseY>=90 && mouseY<=170) {
    settings=true;
  }
  if (settings) {
    button(105, 105, 300, 350);
    fill(#835F01);
    textSize(30);
    text("X", 360, 135);
    if (mousePressed && mouseX>=360 && mouseX<=390 && mouseY>=105 && mouseY <= 135) {
      settings=false;
    }
    if (!LDM && mousePressed && mouseX>=300 && mouseX<=330 && mouseY>=155 && mouseY <= 185) {
      LDM=true;
    }
    if ( LDM  && mousePressed && mouseX>=350 && mouseX<=380 && mouseY>=155 && mouseY <= 185) {
      LDM=false;
    }
    fill(0);
    textSize(20);
    text("Low detail mode", 120, 175);

    if (LDM) {
      fill(#60C45F);
      textSize(20);
      text("ON", 350, 175);
    } else {
      fill(#F01F31);
      textSize(20);
      text("OFF", 300, 175);
    }
    fill(0);
    text("Show FPS", 120, 225);
    if (!showFPS && mousePressed && mouseX>=250 && mouseX<=290 && mouseY>=205 && mouseY <= 245) {
      showFPS=true;
    }
    if ( showFPS  && mousePressed && mouseX>=300 && mouseX<=340 && mouseY>=205 && mouseY <= 245) {
      showFPS=false;
    }

    if (showFPS) {
      fill(#60C45F);
      textSize(20);
      text("ON", 300, 225);
    } else {
      fill(#F01F31);
      textSize(20);
      text("OFF", 250, 225);
    }
  }

  if (showFPS) {
    fill(0);
    textSize(30);
    text(round(frameRate), width-50, 30);
  }

  button(280, 30, 100, 60);
  textSize(30);
  text("Shop", 285, 60);
  button(100, 30, 180, 60);
  textSize(30);
  text("Customize", 105, 60);

  if (mousePressed && mouseX>=280 && mouseX<=380 && mouseY >= 30 && mouseY<=90) {
    inShop=true;
  }

  if (day!=5) {
    button(width-150, 60, 100, 100);
    image(baitIcon, width-140, 65, 70, 70);
  }

  if (day==5) {
    button(width-150, 60, 100, 100);
    fill(0);
    text("End", width-140, 100);
    text("week", width-145, 120);
    if (!dockAnimation && mousePressed && mouseX>=width-140 && mouseX<=width-140+70 && mouseY >= 60 && mouseY<=160) {
      deadLine=true;
    }
  }

  if (day!=5 && !dockAnimation && mousePressed && mouseX>=width-140 && mouseX<=width-140+70 && mouseY >= 60 && mouseY<=160) {
    sailConfirmation=true;
  }
  if (sailConfirmation) {
    button(width/2-150, height/2-100, 300, 200);
    textSize(50);
    textFont(main);
    fill(#835F01);
    text("Go fish?", width/2-100, height/2-30);
    button(width/2-130, height/2+10, 100, 50);
    fill(#835F01);
    textSize(40);
    text("No", width/2-120, height/2+40);
    button(width/2+30, height/2+10, 100, 50);
    fill(#835F01);
    text("Yes", width/2+40, height/2+40);

    if ( mousePressed && mouseX>=width/2-130 && mouseX<=width/2-130+100 && mouseY>=height/2+10 && mouseY<=height/2+10+50) {
      sailConfirmation=false;
    }
    if ( mousePressed && mouseX>=width/2+30 && mouseX<=width/2+30+100 && mouseY>=height/2+10 && mouseY<=height/2+10+50) {
      sailConfirmation=false;
      day++;
      settings=false;
      sailAnimation=true;
      seconds=0;
      startTime=millis();
    }
  }


  pushMatrix();
  translate(0, 110);
  button(width-150, 60, 100, 100);
  image(fishBucketIcon, width-140, 65, 70, 70);
  if (mousePressed && mouseX>=width-140 && mouseX<=width-140+70 && mouseY >= 170 && mouseY<=270) {
    pause=true;
    fishInventory=true;
  }
  if (fishInventory) {
    button(width-650, 60, 500, 500);

    textSize(30);
    textMode(CENTER);
    text("X", width-640, 90);
    if (mousePressed && mouseX>=width-645 && mouseX<=width-645+30 && mouseY >= 175 && mouseY<=65+30+110) {
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
  popMatrix();
  textSize(20);
  textMode(CENTER);
  if (!market && !upgrades) {
    button(width/2-120, 0, 100, 80);
    button(width/2-20, 0, 140, 80);
    buttonShadeless(width/2-120, 0, 240, 40);
    fill(0);


    textMode(CORNER);
    text(int(money), width/2-100, 25);
    textMode(CENTER);
    text("kr", width/2+85, 25);
    textSize(20);
    text("Day "+ day, 495, 55);
    textSize(14);
    text(int((money/quota)*100)+" % of quota", 585, 55);
  }

  customize();

  // MÅSTE VARA LÄNGST FRAM
  if (sailAnimation&&boatx<=200) {
    fadeT2+=7;
    fill(0, fadeT2);
    rect(0, 0, width, height);
  }
  if (fadeT2>=250) {
    fadeT2=0;
    docked=false;
    sailAnimation=false;
  }
}
void customize() {
  if (customizeMenu) {
    button(20, 20, 800, 400);
    button(50, 50, 200, 200);
    image(chestIcon, 60, 50, 170, 170);
    textSize(40);
    textAlign(CENTER, CENTER);
    fill(0);
    text("Loot box", 30, 230, 230, 100);
    if(payChecks<=0){
  fill(255,0,0);
  textSize(15);
  text("(No payChecks)",30,280,230,100);
  fill(0);
}
    textAlign(CORNER, CORNER);
    textSize(30);
    text("X", 780, 50);

    for (int i=0; i<5; i++) button(300+i*100, 100, 70, 70);

    // Candy
    if (skinManager.isSkinUnlocked("Candy")) {
      fill(0);
      textSize(20);
      textAlign(CENTER, BOTTOM);
      text("Candy", 330, 80);
      for (int i = 0; i < 60; i++) {
        fill(lerpColor(color(255, 20, 147), color(255, 105, 180), i / 59.0));
        rect(300 + i, 100, 1, 60);
      }
    } else {
      fill(200);
      rect(300, 100, 60, 60);
      image(lock, 300, 100, 60, 60);
    }

    // Forest
    if (skinManager.isSkinUnlocked("Forest")) {
      fill(0);
      textSize(20);
      textAlign(CENTER, BOTTOM);
      text("Forest", 430, 80);
      for (int i = 0; i < 60; i++) {
        fill(lerpColor(color(#23740D), color(#58BC3D), i / 59.0));
        rect(400 + i, 100, 1, 60);
      }
    } else {
      fill(200);
      rect(400, 100, 60, 60);
      image(lock, 400, 100, 60, 60);
    }

    // Carrot
    if (skinManager.isSkinUnlocked("Carrot")) {
      fill(0);
      textSize(20);
      textAlign(CENTER, BOTTOM);
      text("Carrot", 530, 80);
      for (int i = 0; i < 60; i++) {
        fill(lerpColor(color(#FFAF00), color(#27B907), i / 59.0));
        rect(500 + i, 100, 1, 60);
      }
    } else {
      fill(200);
      rect(500, 100, 60, 60);
      image(lock, 500, 100, 60, 60);
    }

    // Fire
    if (skinManager.isSkinUnlocked("Fire")) {
      fill(0);
      textSize(20);
      textAlign(CENTER, BOTTOM);
      text("Fire", 630, 80);
      for (int i = 0; i < 60; i++) {
        fill(lerpColor(color(#FF7C00), color(#FFCD00), i / 59.0));
        rect(600 + i, 100, 1, 60);
      }
    } else {
      fill(200);
      rect(600, 100, 60, 60);
      image(lock, 600, 100, 60, 60);
    }

    // Ice
    if (skinManager.isSkinUnlocked("Ice")) {
      fill(0);
      textSize(20);
      textAlign(CENTER, BOTTOM);
      text("Ice", 730, 80);
      for (int i = 0; i < 60; i++) {
        fill(lerpColor(color(#009FFF), color(#00ECFF), i / 59.0));
        rect(700 + i, 100, 1, 60);
      }
    } else {
      fill(200);
      rect(700, 100, 60, 60);
      image(lock, 700, 100, 60, 60);
    }

    for (int i = 0; i < 5; i++) button(300+i*100, 200, 70, 70);

    // RedBlue
    if (skinManager.isSkinUnlocked("RedBlue")) {
      fill(0);
      textSize(20);
      textAlign(CENTER, BOTTOM);
      text("RedBlue", 330, 190);
      for (int i = 0; i < 60; i++) {
        fill(lerpColor(color(255, 0, 0), color(0, 0, 255), i / 59.0));
        rect(300 + i, 200, 1, 60);
      }
    } else {
      fill(200);
      rect(300, 200, 60, 60);
      image(lock, 300, 200, 60, 60);
    }

    // Gold
    if (skinManager.isSkinUnlocked("Gold")) {
      fill(0);
      textSize(20);
      textAlign(CENTER, BOTTOM);
      text("Gold", 430, 190);
      for (int i = 0; i < 60; i++) {
        fill(lerpColor(color(255, 223, 0), color(255, 204, 0), i / 59.0));
        rect(400 + i, 200, 1, 60);
      }
    } else {
      fill(200);
      rect(400, 200, 60, 60);
      image(lock, 400, 200, 60, 60);
    }

    // Wave
    if (skinManager.isSkinUnlocked("Wave")) {
      fill(0);
      textSize(20);
      textAlign(CENTER, BOTTOM);
      text("Wave", 530, 190);
      for (int i = 0; i < 60; i++) {
        fill(lerpColor(color(0, 100, 255), color(64, 224, 208), i / 59.0));  // Darkened Wave colors
        rect(500 + i, 200, 1, 60);
      }
    } else {
      fill(200);
      rect(500, 200, 60, 60);
      image(lock, 500, 200, 60, 60);
    }

    // Flower
    if (skinManager.isSkinUnlocked("Flower")) {
      fill(0);
      textSize(20);
      textAlign(CENTER, BOTTOM);
      text("Flower", 630, 190);
      for (int i = 0; i < 60; i++) {
        fill(lerpColor(color(#BA00FF), color(#F1F207), i / 59.0));
        rect(600 + i, 200, 1, 60);
      }
    } else {
      fill(200);
      rect(600, 200, 60, 60);
      image(lock, 600, 200, 60, 60);
    }

    // Rainbow
    if (skinManager.isSkinUnlocked("Rainbow")) {
      fill(0);
      textSize(20);
      textAlign(CENTER, BOTTOM);
      text("Rainbow", 730, 190);
      color[] rainbowColors = {
        color(255, 0, 0), // Red
        color(255, 165, 0), // Orange
        color(255, 255, 0), // Yellow
        color(0, 255, 0), // Green
        color(0, 0, 255), // Blue
        color(75, 0, 130), // Indigo
        color(238, 130, 238) // Violet
      };
      for (int i = 0; i < 60; i++) {
        float t = map(i, 0, 59, 0, rainbowColors.length - 1);
        int index = int(t);
        float blend = t - index;
        if (index < rainbowColors.length - 1) {
          fill(lerpColor(rainbowColors[index], rainbowColors[index + 1], blend));
        } else {
          fill(rainbowColors[index]);
        }
        rect(700 + i, 200, 1, 60);
      }
    } else {
      fill(200);
      rect(700, 200, 60, 60);
      image(lock, 700, 200, 60, 60);
    }
    textAlign(CORNER, CORNER);

    if (lootBoxConfirmation) {
      pushMatrix();
      translate(200, 0);
      button(50, 50, 200, 200);
      fill(0);
      textSize(20);
      text("Open 1 lootBox?", 58, 80);
      text("-1 paycheck", 58, 105);
      button(60, 150, 80, 50);
      textSize(25);
      fill(0);
      text("Yes", 75, 175);
      button(160, 150, 80, 50);
      fill(0);
      text("No", 175, 175);
      popMatrix();
    }
    if(baitSkinCandy){
      image(check,320,120,60,60);
    }
    if(baitSkinForest){
      image(check,420,120,60,60);
    }
    if(baitSkinCarrot){
      image(check,520,120,60,60);
    }
    if(baitSkinFire){
      image(check,620,120,60,60);
    }
    if(baitSkinIce){
      image(check,720,120,60,60);
    }
    if(baitSkinRedBlue){
      image(check,320,220,60,60);
    }
      if(baitSkinGold){
      image(check,420,220,60,60);
    }
      if(baitSkinWave){
      image(check,520,220,60,60);
    }
      if(baitSkinFlower){
      image(check,620,220,60,60);
    }
      if(baitSkinRainbow){
      image(check,720,220,60,60);
    }
  }
}

void mousePressed() {
  if (customizeMenu) {
    if (payChecks>=1&&mouseX > 50 && mouseX < 250 && mouseY >= 50 && mouseY <= 250) {
      lootBoxConfirmation = true;
    }
    if (lootBoxConfirmation && mouseX >= 260 && mouseX < 260 + 80 && mouseY >= 150 && mouseY <= 150 + 50) {
      lootBoxConfirmation = false;
      payChecks=payChecks-1;
      skinManager.skinChance();
    }
    if (lootBoxConfirmation && mouseX >= 360 && mouseX < 360 + 80 && mouseY >= 150 && mouseY <= 150 + 50) {
      lootBoxConfirmation = false;
    }
    if (mouseX > 775 && mouseX < 775 + 30 && mouseY >= 25 && mouseY <= 55) {
      customizeMenu = false;
    }
    if (skinManager.isSkinUnlocked("Candy")&&mouseX>=300&&mouseX<=370&&mouseY>100&&mouseY<=170) {
      baitSkinCandy=true;
      baitSkinForest=false;
      baitSkinGold=false;
      baitSkinRedBlue=false;
      baitSkinIce=false;
      baitSkinFire=false;
      baitSkinFlower=false;
      baitSkinRainbow=false;
      baitSkinWave=false;
      baitSkinCarrot=false;
      baitSkinBase=false;
    }
     if (skinManager.isSkinUnlocked("Forest")&&mouseX>=400&&mouseX<=470&&mouseY>100&&mouseY<=170) {
      baitSkinCandy=false;
      baitSkinForest=true;
      baitSkinGold=false;
      baitSkinRedBlue=false;
      baitSkinIce=false;
      baitSkinFire=false;
      baitSkinFlower=false;
      baitSkinCandy=false;
      baitSkinRainbow=false;
      baitSkinBase=false;
      baitSkinWave=false;
      baitSkinCarrot=false;
    }
    if (skinManager.isSkinUnlocked("Carrot") && mouseX >= 500 && mouseX <= 570 && mouseY > 100 && mouseY <= 170) {
  baitSkinCandy = false;
  baitSkinForest = false;
  baitSkinGold = false;
  baitSkinBase=false;
  baitSkinRedBlue = false;
  baitSkinIce = false;
  baitSkinFire = false;
  baitSkinFlower = false;
  baitSkinRainbow = false;
  baitSkinWave = false;
  baitSkinCarrot = true;
}
   if (skinManager.isSkinUnlocked("Fire") && mouseX >= 600 && mouseX <= 670 && mouseY > 100 && mouseY <= 170) {
  baitSkinCandy = false;
  baitSkinForest = false;
  baitSkinGold = false;
  baitSkinRedBlue = false;
  baitSkinIce = false;
  baitSkinFire = true;
  baitSkinFlower = false;
  baitSkinRainbow = false;
  baitSkinBase=false;
  baitSkinWave = false;
  baitSkinCarrot = false;
}
   if (skinManager.isSkinUnlocked("Ice") && mouseX >= 700 && mouseX <= 770 && mouseY > 100 && mouseY <= 170) {
  baitSkinCandy = false;
  baitSkinForest = false;
  baitSkinGold = false;
  baitSkinRedBlue = false;
  baitSkinBase=false;
  baitSkinIce = true;
  baitSkinFire = false;
  baitSkinFlower = false;
  baitSkinRainbow = false;
  baitSkinWave = false;
  baitSkinCarrot = false;
}
 if (skinManager.isSkinUnlocked("RedBlue") && mouseX >= 300 && mouseX <= 370 && mouseY > 200 && mouseY <= 270) {
  baitSkinCandy = false;
  baitSkinForest = false;
  baitSkinGold = false;
  baitSkinRedBlue = true;
  baitSkinIce = false;
  baitSkinFire = false;
  baitSkinBase=false;
  baitSkinFlower = false;
  baitSkinRainbow = false;
  baitSkinWave = false;
  baitSkinCarrot = false;
}
 if (skinManager.isSkinUnlocked("Gold") && mouseX >= 400 && mouseX <= 470 && mouseY > 200 && mouseY <= 270) {
  baitSkinCandy = false;
  baitSkinForest = false;
  baitSkinGold = true;
  baitSkinRedBlue = false;
  baitSkinIce = false;
  baitSkinBase=false;
  baitSkinFire = false;
  baitSkinFlower = false;
  baitSkinRainbow = false;
  baitSkinWave = false;
  baitSkinCarrot = false;
}
 if (skinManager.isSkinUnlocked("Wave") && mouseX >=500 && mouseX <= 570 && mouseY > 200 && mouseY <= 270) {
  baitSkinCandy = false;
  baitSkinBase=false;
  baitSkinForest = false;
  baitSkinGold = false;
  baitSkinRedBlue = false;
  baitSkinIce = false;
  baitSkinFire = false;
  baitSkinFlower = false;
  baitSkinRainbow = false;
  baitSkinWave = true;
  baitSkinCarrot = false;
}
 if (skinManager.isSkinUnlocked("Flower") && mouseX >= 600 && mouseX <= 670 && mouseY > 200 && mouseY <= 270) {
  baitSkinCandy = false;
  baitSkinForest = false;
  baitSkinGold = false;
  baitSkinRedBlue = false;
  baitSkinIce = false;
  baitSkinFire = false;
  baitSkinFlower = true;
  baitSkinRainbow = false;
  baitSkinWave = false;
  baitSkinBase=false;
  baitSkinCarrot = false;
}
 if (skinManager.isSkinUnlocked("Rainbow") && mouseX >= 700 && mouseX <= 770 && mouseY > 200 && mouseY <= 270) {
  baitSkinCandy = false;
  baitSkinForest = false;
  baitSkinGold = false;
  baitSkinRedBlue = false;
  baitSkinIce = false;
  baitSkinFire = false;
  baitSkinFlower = false;
  baitSkinRainbow = true;
  baitSkinBase=false;
  baitSkinWave = false;
  baitSkinCarrot = false;
}
//redblue gold wave flower rainbow
  }
  if (!customizeMenu && docked) {
    if (mouseX >= 100 && mouseX <= 100 + 180 && mouseY >= 30 && mouseY <= 30 + 60) {
      customizeMenu = true;
    }
  }
}
