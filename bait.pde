boolean baitSkinForest=false;
boolean baitSkinGold=false;
boolean baitSkinRedBlue=false;
boolean baitSkinIce=false;
boolean baitSkinFire=false;
boolean baitSkinFlower=false;
boolean baitSkinCandy=false;
boolean baitSkinRainbow=false;
boolean baitSkinWave=false;
boolean baitSkinCarrot=false;
boolean baitSkinBase=true;

boolean tangled=false;

PVector baitPos;
PVector mousePos;

float baitX;
float baitY;

float speed;
float resistance;
float baseResistance; // Basresistansen som påverkas av resistanceUpgradeLvl
float depthResistance; // Djupresistansen som påverkas av depthResistanceLvl
float tangleChance = 800;
float tangleX;
float tangleChanceIncrease = 0;

float resistanceUpgrade = 0;
float depthResistanceLvl = 0;
float baseTangleChance=200;
float resistanceUpgradeLvl = 0;
float sizeUpgradeLvl;
float weightUpgradeLvl = 0;
float tangleUpgradeLvl;

void bait() {

  // Beräkna basresistans och djupresistans
  baseResistance = 80 - resistanceUpgradeLvl*2*6.5;
  depthResistance = 80 - weightUpgradeLvl*2* baitPos.y/100;
  if (baseResistance < 1) {
    baseResistance = 1;
  }
  if (depthResistance < 1) {
    depthResistance = 1;
  }


  resistance = baseResistance + depthResistance;

  speed = dist(mouseX, mouseY, baitPos.x, baitPos.y) / resistance;
  if (speed < 1) {
    speed = 1;
  }

  // Rörelseberäkning
  mousePos = new PVector(mouseX, mouseY);
  PVector direction = PVector.sub(mousePos, baitPos);
  direction.setMag(speed);
  if (!tangled) {
    baitPos.add(direction);
  }
  speed = dist(mouseX, mouseY, baitPos.x, baitPos.y);
  tangles();








  for (int i = numCircles - 1; i > 0; i--) {
    trailX[i] = trailX[i - 1];
    trailY[i] = trailY[i - 1];
  }
  trailX[0] = baitPos.x;
  trailY[0] = baitPos.y;

  for (int i = 1; i < numCircles; i++) {

    color baitColor = lerpColor(color(baitColor1), color(baitColor2), map(i, 0, numCircles - 1, 0, 1));
    if (baitSkinRainbow) {
       baitColor = lerpColor(color(random(255), random(0), random(255)), color(random(0), random(255), random(255)), map(i, 0, numCircles - 1, 0, 1));
    }
    float alpha = map(i, 0, numCircles - 1, 150, 0)+minimumOpacity; //räknar ut opacity för cirklarna
    fill(baitColor, alpha);

    float circleSize = baitSize * map(i, 0, numCircles - 1, 1, minTrailSize / baitSize); //räknar ut hur stor cirklarna ska vara
    float x1 = trailX[i - 1];
    float y1 = trailY[i - 1];
    float x2 = trailX[i];
    float y2 = trailY[i];

    float lineWidth = circleSize * 1;

    if (!pause) {
      if (baitPos.y>=400) { //Under ytan
        stroke(baitColor, alpha);
        strokeWeight(lineWidth);
        line(x1, y1, x2, y2);
        noStroke();
      }
    }
  }
}
void tangles() {
  println(speed);
  tangleX=int(random(int(tangleChance+1)));
  if (baitPos.y<=600) {

    tangleChance=baseTangleChance+tangleUpgradeLvl*50-10;
  } else
    if (baitPos.y<=700) {

      tangleChance=baseTangleChance+tangleUpgradeLvl*50-30;
    } else
      if (baitPos.y<=800) {

        tangleChance=baseTangleChance+tangleUpgradeLvl*50-50;
      } else {
        tangleChance=baseTangleChance+tangleUpgradeLvl-50;
      }
  if (tangleX==tangleChance) {
    tangled=true;
  }
  if (tangled) {
    fill(255, 0, 0, 200);
    textSize(15);
    text("TANGLED!", baitPos.x-20, baitPos.y-20);
    PVector direction = PVector.sub(mousePos, baitPos);
    direction.setMag(speed/500);
    baitPos.add(direction);

    if (speed>700) {
      tangled=false;
    }
  }
}
void baitSkins() {


  if (baitSkinForest) {
    baitColor1 = #58BC17;
    baitColor2 = #214807;
  }
  if (baitSkinGold) {
    baitColor1 = #FAF19F;
    baitColor2 = #B2A212;
  }
  if (baitSkinRedBlue) {
    baitColor1 = #F50509;
    baitColor2 = #0556F5;
  }
  if (baitSkinIce) {
    baitColor1 = #0D92FC;
    baitColor2 = #A4BEF2;
  }
  if (baitSkinFire) {
    baitColor1 = #F70004;
    baitColor2 = #FCA90D;
  }
  if (baitSkinFlower) {
    baitColor1 = #F7EC00;
    baitColor2 = #9300F7;
  }
  if (baitSkinCandy) {
    baitColor1 = #FAA7FF;
    baitColor2 = #F374FA;
  }
  if (baitSkinWave) {
    baitColor1 = #837CF5;
    baitColor2 = #0D076A;
  }
  if (baitSkinCarrot) {
    baitColor1 = #00FC01;
    baitColor2 = #F59014;

  }
  if (baitSkinBase) {
    baitColor1 = #FFFFFF;
    baitColor2 = #6F6A6A;
  }
}
