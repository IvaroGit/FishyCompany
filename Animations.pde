




void seaWeedSprites() {

  currentf=(currentf+random(0.04, 0.1))%8;

  seaWeedMovement = new PImage[1][8];
  seaWeedSpritesheet = loadImage("seaWeedSpriteSheet.png");
  for (int i=0; i<8; i++) {
    seaWeedMovement[0][i] = seaWeedSpritesheet.get(60*i, 0, 56, 90);
  }
  image(seaWeedMovement[0][int(currentf)], 1245, height-69);
  image(seaWeedMovement[0][int(currentf)], 200, height-49-90, 60, 200);
  image(seaWeedMovement[0][int(currentf)], 900, height-69-100, 80, 220);
  image(seaWeedMovement[0][int(currentf)], 240, height-40);
  image(seaWeedMovement[0][int(currentf)], 76, height-69);
  image(seaWeedMovement[0][int(currentf)], 90, height-69);
  image(seaWeedMovement[0][int(currentf)], 12, height-69);
  image(seaWeedMovement[0][int(currentf)], 173, height-40);
  image(seaWeedMovement[0][int(currentf)], 1245, height-69);
  image(seaWeedMovement[0][int(currentf)], 1100, height-49-90, 60, 200);
  image(seaWeedMovement[0][int(currentf)], 800, height-69, 20, 100);
}

class bubble {

  float X;
  float Y;
  float W;
  boolean remove=false;

  bubble(float startX, float startY) {

    X=startX;
    Y=startY;
    W=random(10, 60);
  }
  void update() {
    Y-=random(1, W/5);
    X+=random(-1, 1);

    if (Y<=400) {
      remove=true;
    }
  }
  void display() {
    tint(255, 255);
    image(bubble, X, Y, W, W);
  }
}
class bird {
  float X;
  float Y;
  float W;
  boolean remove=false;

  bird(float startX, float startY) {

    X=startX;
    Y=startY;
  }
  void update() {
    X-=30;
    if (X<=-150) {
      remove=true;
    }
  }
  void display() {
    tint(255, 255);
    image(bird, X, Y,80,50);
  }
}
