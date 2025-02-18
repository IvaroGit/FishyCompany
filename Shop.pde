float salmonX;
float bassX;
float codX;
float carpX;
float californiasheepheadX;
float crabX;
float sharkX;
float rayX;
float swordfishX;
float wahooX;
float blueWhaleX;
float orcaX;
float legendaryX;


float resistanceUpgradePrice=5000;
float sizeUpgradePrice=5000;
float weightUpgradePrice=5000;
float tangleUpgradePrice=5000;

boolean salmonLow, salmonHigh;
boolean bassLow, bassHigh;
boolean codLow, codHigh;
boolean carpLow, carpHigh;
boolean californiasheepheadLow, californiasheepheadHigh;
boolean crabLow, crabHigh;
boolean sharkLow, sharkHigh;
boolean rayLow, rayHigh;
boolean swordfishLow, swordfishHigh;
boolean wahooLow, wahooHigh;
boolean blueWhaleLow, blueWhaleHigh;
boolean orcaLow, orcaHigh;
boolean legendaryLow, legendaryHigh;

color salmonC, bassC, codC, carpC, californiasheepheadC, crabC, sharkC, rayC;
color swordfishC, wahooC, blueWhaleC, orcaC, legendaryC;

PImage greenArrow1;
PImage greenArrow2;
PImage redArrow1;
PImage redArrow2;




void shop() {
  textSize(30);
  button(230, 210, 505, 400);
  buttonShadeless(250, 300, 220, 220);
  fill(0);
  text("Upgrades", 280, 280);
  text("Rare fish", 530, 250);
  text("market", 530, 280);
  image(upgradeIcon, 260, 310, 200, 200);
  buttonShadeless(500, 300, 220, 220);
  image(fishMarket, 510, 310, 200, 200);
  fill(#835F01);
  text("X", 690, 240);

  textSize(30);
  if (mousePressed && mouseX>=690 && mouseX<=720 && mouseY>=210 && mouseY<= 240) {
    inShop=false;
  }

  if (mousePressed && mouseX>=250 && mouseX<=470 && mouseY>=300 && mouseY<= 520) {
    upgrades=true;
    inShop=false;
  }
  if (mousePressed && mouseX>=500 && mouseX<=720 && mouseY>=300 && mouseY<= 520) {
    market=true;
    inShop=false;
  }
}

void upgrades() {

  button(20, 20, 910, 500);
  textSize(30);
  fill(#835F01);
  text("X", 880, 50);


  button(30, 70, 200, 200);
  fill(0);
  textSize(25);
  text("Bait upgrades", 30, 290);
  image(fishingRod, 60, 90, 130, 130);
  if (mousePressed && mouseX>=20 && mouseX <=230 && mouseY>=70 && mouseY<=270) {
    baitUpgrades=true;
    upgrades=false;
  }
  button(260, 70, 200, 200);
  button(490, 70, 200, 200);
  button(720, 70, 200, 200);



  if (mousePressed && mouseX>=880 && mouseX<=910 && mouseY>=20 && mouseY<= 50) {
    upgrades=false;
  }
}
void baitUpgrades() {

  resistanceUpgradePrice=5000+resistanceUpgradeLvl*2000;
  sizeUpgradePrice=5000+sizeUpgradeLvl*2000;
  weightUpgradePrice=5000+weightUpgradeLvl*2000;
  tangleUpgradePrice=5000+tangleUpgradeLvl*2000;
  
  button(20, 20, 510, 500);

  text("X", 490, 50);
  textSize(30);
  if (mousePressed && mouseX>=490&& mouseX<=520 && mouseY>=20 && mouseY<= 50) {
    baitUpgrades=false;
  }
  button(60, 60, 80, 80);
  fill(0);
  textSize(25);
  image(resistanceIcon, 65, 60, 60, 60);
  text("Resistance reduction", 160, 60);
  button(170, 70, 55, 55);
  fill(0);
  rect(190, 75, 5, 30);
  rect(175, 87, 35, 5);
  text("Lvl "+int(resistanceUpgradeLvl), 240, 100);
  if (money>=resistanceUpgradePrice) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  text(int(resistanceUpgradePrice)+ " Kr", 340, 100);
  button(60, 160, 80, 80);
  image(bigBait, 65, 165, 55, 55);
  fill(0);
  text("Bait size", 160, 160);
  text("Lvl "+int(sizeUpgradeLvl), 240, 200);
  if (money>=sizeUpgradePrice) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  text(int(sizeUpgradePrice)+ " Kr", 340, 200);
  button(170, 170, 55, 55);
  fill(0);
  rect(190, 175, 5, 30);
  rect(175, 187, 35, 5);
  button(60, 260, 80, 80);
  image(heavyBait, 65, 263, 60, 60);
  fill(0);
  text("Bait weight", 160, 260);
  text("Lvl "+int(weightUpgradeLvl), 240, 300);
  if (money>=weightUpgradePrice) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  text(int(weightUpgradePrice)+ " Kr", 340, 300);
  button(170, 270, 55, 55);
  fill(0);
  rect(190, 275, 5, 30);
  rect(175, 287, 35, 5);
  button(60, 360, 80, 80);
  image(ninjaBait, 65, 360, 60, 60);
  fill(0);
  text("Tangle reduction", 160, 360);
  text("Lvl "+int(tangleUpgradeLvl), 240, 400);
  if (money>=tangleUpgradePrice) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  text(int(tangleUpgradePrice)+ " Kr", 340, 400);
  button(170, 370, 55, 55);
  fill(0);
  rect(190, 375, 5, 30);
  rect(175, 387, 35, 5);
}

void market() {
  button(20, 20, 900, 500);
  textSize(30);
  fill(#835F01);
  text("X", 880, 50);
  button(680, 465, 220, 50);
  textMode(CORNER);
  fill(0);
  text(int(money), 690, 493);
  text("kr", 850, 493);
  textMode(CENTER);
  button(500, 465, 150, 50);
  fill(0);
  textSize(20);
  text("Sell all fish", 510, 488);
  if (mousePressed && mouseX>=495 && mouseX <=650 && mouseY >= 460 && mouseY<=515) {
    money = money
      + salmonPrice * salmons
      + bassPrice * basses
      + codPrice * cods
      + carpPrice * carps
      + crabPrice * crabs
      + sharkPrice * sharks
      + californiasheepheadPrice * californiaSheepheads
      + rayPrice * rays
      + swordfishPrice * swordfishes
      + wahooPrice * wahoos
      + blueWhalePrice * blueWhales
      + orcaPrice * orcas
      + legendaryPrice * legendaries;

    salmons = 0;
    basses = 0;
    cods = 0;
    carps = 0;
    crabs = 0;
    sharks = 0;
    californiaSheepheads = 0;
    rays = 0;
    swordfishes = 0;
    wahoos = 0;
    blueWhales = 0;
    orcas = 0;
    legendaries = 0;
    salmons=0;
  }

  pushMatrix();

  translate(-500, -70);
  fill(0);
  textSize(30);
  image(Salmon, width-640, 120, 100, 33);

  image(Bass, width-640, 140, 100, 100/1.2);

  image(Cod, width-640, 200, 120, 70);

  image(Carp, width-640, 270, 100, 75);

  image(Crab, width-640, 350, 60, 60);

  image(Shark, width-640, 400, 110, 75);

  image(CaliforniaSheephead, width-640, 470, 110, 55);

  popMatrix();
  pushMatrix();
  translate(-300, -70);
  image(Ray, width-440, 100, 90, 75);

  image(Swordfish, width-440, 160, 140, 75);

  image(Wahoo, width-450, 230, 170, 45);

  image(BlueWhale, width-440, 280, 140, 75);

  image(Orca, width-440, 340, 140, 75);

  image(Legendary, width-400, 420, 90, 75);

  popMatrix();

  text("Sell", 200, 45);
  text("Price", 330, 45);


  for (int i=0; i<7; i++) {

    buttonShadeless(200, 60*i + 55, 40, 40);
    textSize(25);
    fill(0);
    text("1", 205, 60*i+80);
    buttonShadeless(250, 60*i + 55, 60, 40);
    textSize(25);
    fill(0);
    text("All", 255, 60*i+80);
  }
  for (int i=0; i<6; i++) {
    pushMatrix();
    translate(-35, 0);
    buttonShadeless(650, 65*i + 40, 40, 40);
    textSize(25);
    fill(0);
    text("1", 655, 65*i+65);

    buttonShadeless(700, 65*i + 40, 60, 40);
    textSize(25);
    fill(0);
    text("All", 705, 65*i+65);
    popMatrix();
  }


  if (salmonHigh) {
    salmonC = #20C63D; // Green
  } else if (salmonLow) {
    salmonC = #C62041; // Red
  }

  if (bassHigh) {
    bassC = #20C63D; // Green
  } else if (bassLow) {
    bassC = #C62041; // Red
  }

  if (codHigh) {
    codC = #20C63D; // Green
  } else if (codLow) {
    codC = #C62041; // Red
  }

  if (carpHigh) {
    carpC = #20C63D; // Green
  } else if (carpLow) {
    carpC = #C62041; // Red
  }

  if (californiasheepheadHigh) {
    californiasheepheadC = #20C63D; // Green
  } else if (californiasheepheadLow) {
    californiasheepheadC = #C62041; // Red
  }

  if (crabHigh) {
    crabC = #20C63D; // Green
  } else if (crabLow) {
    crabC = #C62041; // Red
  }

  if (sharkHigh) {
    sharkC = #20C63D; // Green
  } else if (sharkLow) {
    sharkC = #C62041; // Red
  }

  if (rayHigh) {
    rayC = #20C63D; // Green
  } else if (rayLow) {
    rayC = #C62041; // Red
  }

  if (swordfishHigh) {
    swordfishC = #20C63D; // Green
  } else if (swordfishLow) {
    swordfishC = #C62041; // Red
  }

  if (wahooHigh) {
    wahooC = #20C63D; // Green
  } else if (wahooLow) {
    wahooC = #C62041; // Red
  }

  if (blueWhaleHigh) {
    blueWhaleC = #20C63D; // Green
  } else if (blueWhaleLow) {
    blueWhaleC = #C62041; // Red
  }

  if (orcaHigh) {
    orcaC = #20C63D; // Green
  } else if (orcaLow) {
    orcaC = #C62041; // Red
  }

  if (legendaryHigh) {
    legendaryC = #20C63D; // Green
  } else if (legendaryLow) {
    legendaryC = #C62041; // Red
  }

  pushMatrix();
  translate(-30, 0);
  fill(salmonC);
  text(int(salmonPrice), 340, 140-60);
  fill(bassC);
  text(int(bassPrice), 340, 140);
  fill(codC);
  text(int(codPrice), 340, 140+60);
  fill(carpC);
  text(int(carpPrice), 340, 140+120);
  fill(crabC);
  text(int(crabPrice), 340, 140+180);
  fill(sharkC);
  text(int(sharkPrice), 340, 140+240);
  fill(californiasheepheadC);
  text(int(californiasheepheadPrice), 340, 140+240+60);
  popMatrix();
  pushMatrix();
  translate(-35, 0);
  fill(rayC);
  text(int(rayPrice), 770, 65*1);
  fill(swordfishC);
  text(int(swordfishPrice), 770, 65*2);
  fill(wahooC);
  text(int(wahooPrice), 770, 65*3);
  fill(blueWhaleC);
  text(int(blueWhalePrice), 770, 65*4);
  fill(orcaC);
  text(int(orcaPrice), 770, 65*5);
  fill(legendaryC);
  text(int(legendaryPrice), 770, 65*6);
  popMatrix();

  if (salmonPriceMultiplier >= 1 && salmonPriceMultiplier < 8) {
    image(greenArrow1, 410, 55, 35, 35);
  } else if (salmonPriceMultiplier >= 8) {
    image(greenArrow2, 410, 55, 35, 35);
  } else if (salmonPriceMultiplier < 1 && salmonPriceMultiplier > 0.2) {
    image(redArrow1, 410, 55, 35, 35);
  } else if (salmonPriceMultiplier < 0.2) {
    image(redArrow2, 410, 55, 35, 35);
  }

  if (bassPriceMultiplier >= 1 && bassPriceMultiplier < 8) {
    image(greenArrow1, 410, 115, 35, 35);
  } else if (bassPriceMultiplier >= 8) {
    image(greenArrow2, 410, 115, 35, 35);
  } else if (bassPriceMultiplier < 1 && bassPriceMultiplier > 0.2) {
    image(redArrow1, 410, 115, 35, 35);
  } else if (bassPriceMultiplier < 0.2) {
    image(redArrow2, 410, 115, 35, 35);
  }

  if (codPriceMultiplier >= 1 && codPriceMultiplier < 8) {
    image(greenArrow1, 410, 175, 35, 35);
  } else if (codPriceMultiplier >= 8) {
    image(greenArrow2, 410, 175, 35, 35);
  } else if (codPriceMultiplier < 1 && codPriceMultiplier > 0.2) {
    image(redArrow1, 410, 175, 35, 35);
  } else if (codPriceMultiplier < 0.2) {
    image(redArrow2, 410, 175, 35, 35);
  }

  if (carpPriceMultiplier >= 1 && carpPriceMultiplier < 8) {
    image(greenArrow1, 410, 235, 35, 35);
  } else if (carpPriceMultiplier >= 8) {
    image(greenArrow2, 410, 235, 35, 35);
  } else if (carpPriceMultiplier < 1 && carpPriceMultiplier > 0.2) {
    image(redArrow1, 410, 235, 35, 35);
  } else if (carpPriceMultiplier < 0.2) {
    image(redArrow2, 410, 235, 35, 35);
  }

  if (crabPriceMultiplier >= 1 && crabPriceMultiplier < 8) {
    image(greenArrow1, 410, 295, 35, 35);
  } else if (crabPriceMultiplier >= 8) {
    image(greenArrow2, 410, 295, 35, 35);
  } else if (crabPriceMultiplier < 1 && crabPriceMultiplier > 0.2) {
    image(redArrow1, 410, 295, 35, 35);
  } else if (crabPriceMultiplier < 0.2) {
    image(redArrow2, 410, 295, 35, 35);
  }

  if (sharkPriceMultiplier >= 1 && sharkPriceMultiplier < 8) {
    image(greenArrow1, 410, 355, 35, 35);
  } else if (sharkPriceMultiplier >= 8) {
    image(greenArrow2, 410, 355, 35, 35);
  } else if (sharkPriceMultiplier < 1 && sharkPriceMultiplier > 0.2) {
    image(redArrow1, 410, 355, 35, 35);
  } else if (sharkPriceMultiplier < 0.2) {
    image(redArrow2, 410, 355, 35, 35);
  }

  if (californiasheepheadPriceMultiplier >= 1 && californiasheepheadPriceMultiplier < 8) {
    image(greenArrow1, 410, 415, 35, 35);
  } else if (californiasheepheadPriceMultiplier >= 8) {
    image(greenArrow2, 410, 415, 35, 35);
  } else if (californiasheepheadPriceMultiplier < 1 && californiasheepheadPriceMultiplier > 0.2) {
    image(redArrow1, 410, 415, 35, 35);
  } else if (californiasheepheadPriceMultiplier < 0.2) {
    image(redArrow2, 410, 415, 35, 35);
  }
  pushMatrix();
  translate(-25, 0);
  if (rayPriceMultiplier >= 1 && rayPriceMultiplier < 8) {
    image(greenArrow1, 850, 40, 35, 35);
  } else if (rayPriceMultiplier >= 8) {
    image(greenArrow2, 850, 40, 35, 35);
  } else if (rayPriceMultiplier < 1 && rayPriceMultiplier > 0.2) {
    image(redArrow1, 850, 40, 35, 35);
  } else if (rayPriceMultiplier < 0.2) {
    image(redArrow2, 850, 40, 35, 35);
  }

  if (swordfishPriceMultiplier >= 1 && swordfishPriceMultiplier < 8) {
    image(greenArrow1, 850, 105, 35, 35);
  } else if (swordfishPriceMultiplier >= 8) {
    image(greenArrow2, 850, 105, 35, 35);
  } else if (swordfishPriceMultiplier < 1 && swordfishPriceMultiplier > 0.2) {
    image(redArrow1, 850, 105, 35, 35);
  } else if (swordfishPriceMultiplier < 0.2) {
    image(redArrow2, 850, 105, 35, 35);
  }

  // Wahoo
  if (wahooPriceMultiplier >= 1 && wahooPriceMultiplier < 8) {
    image(greenArrow1, 850, 170, 35, 35);
  } else if (wahooPriceMultiplier >= 8) {
    image(greenArrow2, 850, 170, 35, 35);
  } else if (wahooPriceMultiplier < 1 && wahooPriceMultiplier > 0.2) {
    image(redArrow1, 850, 170, 35, 35);
  } else if (wahooPriceMultiplier < 0.2) {
    image(redArrow2, 850, 170, 35, 35);
  }

  // Blue Whale
  if (blueWhalePriceMultiplier >= 1 && blueWhalePriceMultiplier < 8) {
    image(greenArrow1, 850, 235, 35, 35);
  } else if (blueWhalePriceMultiplier >= 8) {
    image(greenArrow2, 850, 235, 35, 35);
  } else if (blueWhalePriceMultiplier < 1 && blueWhalePriceMultiplier > 0.2) {
    image(redArrow1, 850, 235, 35, 35);
  } else if (blueWhalePriceMultiplier < 0.2) {
    image(redArrow2, 850, 235, 35, 35);
  }

  // Orca
  if (orcaPriceMultiplier >= 1 && orcaPriceMultiplier < 8) {
    image(greenArrow1, 850, 300, 35, 35);
  } else if (orcaPriceMultiplier >= 8) {
    image(greenArrow2, 850, 300, 35, 35);
  } else if (orcaPriceMultiplier < 1 && orcaPriceMultiplier > 0.2) {
    image(redArrow1, 850, 300, 35, 35);
  } else if (orcaPriceMultiplier < 0.2) {
    image(redArrow2, 850, 300, 35, 35);
  }

  // Legendary
  if (legendaryPriceMultiplier >= 1 && legendaryPriceMultiplier < 8) {
    image(greenArrow1, 850, 365, 35, 35);
  } else if (legendaryPriceMultiplier >= 8) {
    image(greenArrow2, 850, 365, 35, 35);
  } else if (legendaryPriceMultiplier < 1 && legendaryPriceMultiplier > 0.2) {
    image(redArrow1, 850, 365, 35, 35);
  } else if (legendaryPriceMultiplier < 0.2) {
    image(redArrow2, 850, 365, 35, 35);
  }
  popMatrix();
  if (mousePressed && mouseX>=880 && mouseX<=910 && mouseY>=20 && mouseY<= 50) {
    market=false;
  }
}
void mouseReleased() {
if(baitUpgrades){
  if (mouseX >= 170 && mouseX <= 170 + 55 && mouseY >= 70 && mouseY <= 70 + 55 && money>=resistanceUpgradePrice) {
    resistanceUpgradeLvl++;
    money=money-resistanceUpgradePrice;
  }

  if (mouseX >= 170 && mouseX <= 170 + 55 && mouseY >= 170 && mouseY <= 170 + 55 && money>=sizeUpgradePrice) {
    sizeUpgradeLvl++;
    money=money-sizeUpgradePrice;
  }

  if (mouseX >= 170 && mouseX <= 170 + 55 && mouseY >= 270 && mouseY <= 270 + 55 && money>=weightUpgradePrice) {
    weightUpgradeLvl++;
    money=money-weightUpgradePrice;
  }

  if (mouseX >= 170 && mouseX <= 170 + 55 && mouseY >= 370 && mouseY <= 370 + 55  && money>=tangleUpgradePrice) {
    tangleUpgradeLvl++;
    money=money-tangleUpgradePrice;
  }

}

  if (market) {
    if ( mouseX >= 195 && mouseX <= 240 && mouseY >= 50 && mouseY <= 90) {
      if (salmons > 0) {
        money = money + salmonPrice;
        salmons--;
      }
    }
    if ( mouseX >= 245 && mouseX <= 305 && mouseY >= 50 && mouseY <= 90) {
      if (salmons > 0) {
        money = money + salmonPrice * salmons;
        salmons = 0;
      }
    }

    // Bass
    if ( mouseX >= 195 && mouseX <= 240 && mouseY >= 110 && mouseY <= 150) {
      if (basses > 0) {
        money = money + bassPrice;
        basses--;
      }
    }
    if ( mouseX >= 245 && mouseX <= 305 && mouseY >= 110 && mouseY <= 150) {
      if (basses > 0) {
        money = money + bassPrice * basses;
        basses = 0;
      }
    }

    // Cod
    if ( mouseX >= 195 && mouseX <= 240 && mouseY >= 170 && mouseY <= 210) {
      if (cods > 0) {
        money = money + codPrice;
        cods--;
      }
    }
    if ( mouseX >= 245 && mouseX <= 305 && mouseY >= 170 && mouseY <= 210) {
      if (cods > 0) {
        money = money + codPrice * cods;
        cods = 0;
      }
    }

    // Carp
    if ( mouseX >= 195 && mouseX <= 240 && mouseY >= 230 && mouseY <= 270) {
      if (carps > 0) {
        money = money + carpPrice;
        carps--;
      }
    }
    if ( mouseX >= 245 && mouseX <= 305 && mouseY >= 230 && mouseY <= 270) {
      if (carps > 0) {
        money = money + carpPrice * carps;
        carps = 0;
      }
    }

    // Crab
    if ( mouseX >= 195 && mouseX <= 240 && mouseY >= 290 && mouseY <= 330) {
      if (crabs > 0) {
        money = money + crabPrice;
        crabs--;
      }
    }
    if ( mouseX >= 245 && mouseX <= 305 && mouseY >= 290 && mouseY <= 330) {
      if (crabs > 0) {
        money = money + crabPrice * crabs;
        crabs = 0;
      }
    }

    // Shark
    if ( mouseX >= 195 && mouseX <= 240 && mouseY >= 350 && mouseY <= 390) {
      if (sharks > 0) {
        money = money + sharkPrice;
        sharks--;
      }
    }
    if ( mouseX >= 245 && mouseX <= 305 && mouseY >= 350 && mouseY <= 390) {
      if (sharks > 0) {
        money = money + sharkPrice * sharks;
        sharks = 0;
      }
    }

    // California Sheephead
    if ( mouseX >= 195 && mouseX <= 240 && mouseY >= 410 && mouseY <= 450) {
      if (californiaSheepheads > 0) {
        money = money + californiasheepheadPrice;
        californiaSheepheads--;
      }
    }
    if ( mouseX >= 245 && mouseX <= 305 && mouseY >= 410 && mouseY <= 450) {
      if (californiaSheepheads > 0) {
        money = money + californiasheepheadPrice * californiaSheepheads;
        californiaSheepheads = 0;
      }
    }



    // Ray
    if (mouseX >= 600 && mouseX <= 650 && mouseY >= 40 && mouseY <= 80) {
      if (rays > 0) {
        money = money + rayPrice;
        rays--;
      }
    }
    if (mouseX >= 660 && mouseX <= 720 && mouseY >= 40 && mouseY <= 80) {
      if (rays > 0) {
        money = money + rayPrice * rays;
        rays = 0;
      }
    }

    // Swordfish
    if (mouseX >= 600 && mouseX <= 650 && mouseY >= 100 && mouseY <= 140) {
      if (swordfishes > 0) {
        money = money + swordfishPrice;
        swordfishes--;
      }
    }
    if (mouseX >= 660 && mouseX <= 720 && mouseY >= 100 && mouseY <= 140) {
      if (swordfishes > 0) {
        money = money + swordfishPrice * swordfishes;
        swordfishes = 0;
      }
    }

    // Wahoo
    if (mouseX >= 600 && mouseX <= 650 && mouseY >= 160 && mouseY <= 200) {
      if (wahoos > 0) {
        money = money + wahooPrice;
        wahoos--;
      }
    }
    if (mouseX >= 660 && mouseX <= 720 && mouseY >= 160 && mouseY <= 200) {
      if (wahoos > 0) {
        money = money + wahooPrice * wahoos;
        wahoos = 0;
      }
    }

    // Blue Whale
    if (mouseX >= 600 && mouseX <= 650 && mouseY >= 220 && mouseY <= 260) {
      if (blueWhales > 0) {
        money = money + blueWhalePrice;
        blueWhales--;
      }
    }
    if (mouseX >= 660 && mouseX <= 720 && mouseY >= 220 && mouseY <= 260) {
      if (blueWhales > 0) {
        money = money + blueWhalePrice * blueWhales;
        blueWhales = 0;
      }
    }

    // Orca
    if (mouseX >= 600 && mouseX <= 650 && mouseY >= 280 && mouseY <= 320) {
      if (orcas > 0) {
        money = money + orcaPrice;
        orcas--;
      }
    }
    if (mouseX >= 660 && mouseX <= 720 && mouseY >= 280 && mouseY <= 320) {
      if (orcas > 0) {
        money = money + orcaPrice * orcas;
        orcas = 0;
      }
    }

    // Legendary
    if (mouseX >= 600 && mouseX <= 650 && mouseY >= 340 && mouseY <= 380) {
      if (legendaries > 0) {
        money = money + legendaryPrice;
        legendaries--;
      }
    }
    if (mouseX >= 660 && mouseX <= 720 && mouseY >= 340 && mouseY <= 380) {
      if (legendaries > 0) {
        money = money + legendaryPrice * legendaries;
        legendaries = 0;
      }
    }
  }
}
void prices() {

  salmonX = random (1, 100);
  salmonX = random (1, 100);
  bassX= random (1, 100);
  codX= random (1, 100);
  carpX= random (1, 100);
  californiasheepheadX= random (1, 100);
  crabX= random (1, 100);
  sharkX= random (1, 100);
  rayX= random (1, 100);
  swordfishX= random (1, 100);
  wahooX= random (1, 100);
  blueWhaleX= random (1, 100);
  orcaX= random (1, 100);
  legendaryX= random (1, 100);

  if (salmonX <= 50) {
    salmonLow = true;
    salmonHigh = false;
    salmonPriceMultiplier = random(0.1, 1);
  } else {
    salmonLow = false;
    salmonHigh = true;
    salmonPriceMultiplier = random(1, 50);
  }

  if (bassX <= 50) {
    bassLow = true;
    bassHigh = false;
    bassPriceMultiplier = random(0.1, 1);
  } else {
    bassLow = false;
    bassHigh = true;
    bassPriceMultiplier = random(1, 50);
  }

  if (codX <= 50) {
    codLow = true;
    codHigh = false;
    codPriceMultiplier = random(0.1, 1);
  } else {
    codLow = false;
    codHigh = true;
    codPriceMultiplier = random(1, 50);
  }

  if (carpX <= 50) {
    carpLow = true;
    carpHigh = false;
    carpPriceMultiplier = random(0.1, 1);
  } else {
    carpLow = false;
    carpHigh = true;
    carpPriceMultiplier = random(1, 50);
  }

  if (californiasheepheadX <= 50) {
    californiasheepheadLow = true;
    californiasheepheadHigh = false;
    californiasheepheadPriceMultiplier = random(0.01, 1);
  } else {
    californiasheepheadLow = false;
    californiasheepheadHigh = true;
    californiasheepheadPriceMultiplier = random(1, 10);
  }

  if (crabX <= 50) {
    crabLow = true;
    crabHigh = false;
    crabPriceMultiplier = random(0.01, 1);
  } else {
    crabLow = false;
    crabHigh = true;
    crabPriceMultiplier = random(1, 10);
  }

  if (sharkX <= 50) {
    sharkLow = true;
    sharkHigh = false;
    sharkPriceMultiplier = random(0.01, 1);
  } else {
    sharkLow = false;
    sharkHigh = true;
    sharkPriceMultiplier = random(1, 10);
  }

  if (rayX <= 50) {
    rayLow = true;
    rayHigh = false;
    rayPriceMultiplier = random(0.01, 1);
  } else {
    rayLow = false;
    rayHigh = true;
    rayPriceMultiplier = random(1, 10);
  }

  if (swordfishX <= 50) {
    swordfishLow = true;
    swordfishHigh = false;
    swordfishPriceMultiplier = random(0.01, 1);
  } else {
    swordfishLow = false;
    swordfishHigh = true;
    swordfishPriceMultiplier = random(1, 10);
  }

  if (wahooX <= 50) {
    wahooLow = true;
    wahooHigh = false;
    wahooPriceMultiplier = random(0.01, 1);
  } else {
    wahooLow = false;
    wahooHigh = true;
    wahooPriceMultiplier = random(1, 10);
  }

  if (blueWhaleX <= 50) {
    blueWhaleLow = true;
    blueWhaleHigh = false;
    blueWhalePriceMultiplier = random(0.01, 1);
  } else {
    blueWhaleLow = false;
    blueWhaleHigh = true;
    blueWhalePriceMultiplier = random(1, 10);
  }

  if (orcaX <= 50) {
    orcaLow = true;
    orcaHigh = false;
    orcaPriceMultiplier = random(0.01, 1);
  } else {
    orcaLow = false;
    orcaHigh = true;
    orcaPriceMultiplier = random(1, 10);
  }

  if (legendaryX <= 50) {
    legendaryLow = true;
    legendaryHigh = false;
    legendaryPriceMultiplier = random(0.01, 1);
  } else {
    legendaryLow = false;
    legendaryHigh = true;
    legendaryPriceMultiplier = random(1, 10);
  }

  salmonPrice = salmonPriceBase * salmonPriceMultiplier;
  bassPrice = bassPriceBase * bassPriceMultiplier;
  codPrice = codPriceBase * codPriceMultiplier;
  carpPrice = carpPriceBase * carpPriceMultiplier;
  californiasheepheadPrice = californiasheepheadPriceBase * californiasheepheadPriceMultiplier;
  crabPrice = crabPriceBase * crabPriceMultiplier;
  sharkPrice = sharkPriceBase * sharkPriceMultiplier;
  rayPrice = rayPriceBase * rayPriceMultiplier;
  swordfishPrice = swordfishPriceBase * swordfishPriceMultiplier;
  wahooPrice = wahooPriceBase * wahooPriceMultiplier;
  blueWhalePrice = blueWhalePriceBase * blueWhalePriceMultiplier;
  orcaPrice = orcaPriceBase * orcaPriceMultiplier;
  legendaryPrice = legendaryPriceBase * legendaryPriceMultiplier;
}
