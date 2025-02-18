 int seaLevel=1;



void seaLevels() {

  seconds+=deltaTime;
  minutes = seconds/60;
  fishAmount=seaLevel*3;
 
  if (minutes>=3) {
    dockAnimation=true;
    fishInventory=false;
    settings=false;
    prices();
  }
}


void keyReleased() {
  if (!pause) {
    if (keyCode==RIGHT) {

      seaLevel++;
    }
    if (keyCode==LEFT) {
      seaLevel--;
    }
  }
}
