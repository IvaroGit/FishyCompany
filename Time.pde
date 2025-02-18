  int day=0;
int week=0;
float seconds;
float minutes;
float quota;
int payChecks=0;
boolean quotaCompleted=false;
boolean quotaFailed=false;
float extraMoney=0;
float money=0;
void days() {

  seconds+=deltaTime;
  minutes=seconds/60;


  if (minutes>=2 && !docked) {

    dockAnimation=true;
    fishInventory=false;
    settings=false;
    prices();
  }
}

void clock() {

  if (!docked) {
    button(width/2+183, -20, 190, 100);
    fill(50);
    rect(width/2+195, 0, 160, 55);
    fill(0);
    rect(width/2+200, 0, 150, 50);
  }

  // Calculate elapsed time
  int elapsedTime = millis() - startTime;

  // Map the elapsed time to the hours between 06 and 18
  int currentHour = int(map(elapsedTime, 0, totalTime, startHour, endHour));

  // Format time as HH with leading zero if needed
  String timeText = nf(currentHour, 2);

  // Display the hour
  fill(255, 0, 0);
  textSize(30);
  text(timeText + " : 00", width / 2 + 215, 35);

  // Reset after reaching the end
  if (elapsedTime >= totalTime + 1) {
    startTime = millis();  // Reset start time to loop again
  }
}

void quota() {

  
  quota = week * week * 200000 + 1000000;
  if (deadLine && !quotaCompleted && !quotaFailed) {
    fadeT+=7;
    fill(0, fadeT);
    rect(0, 0, width, height);
  }
  if (deadLine && fadeT>=255) {
    if (money>=quota) {
      quotaCompleted=true;
      
    } else {
     
      quotaFailed=true;
    }
  }
  if (quotaCompleted) {
    if (fadeT<=0) {
      fadeT=0;
    }
    textSize(100);
    fill(0, fadeT);
    rect(0, 0, width, height);
    fill(255, fadeT);
    text("Quota reached!", width/2-400, height/2-50);
    textSize(50);
    text("+1 Paycheck", width/2-400, height/2+50);
     textSize(50);
    text("Money above quota: "+int((money-quota)), width/2-400, height/2+100);
    fill(255, fadeT);
    rect(width/2-410, height/2+140, 320, 120);
    fill(0, fadeT);
    rect(width/2-400, height/2+150, 300, 100);
    fill(255, fadeT);
    text("Next week", width/2-390, height/2+220);
    if (mousePressed && mouseX>=width/2-410 && mouseX<=width/2-410+320 && mouseY>=height/2+140 && mouseY<=height/2+140+120) {
      quotaCompleted=false;
      day=0;
      payChecks+=1;
      week+=1;
      extraMoney = money - quota;
      money = extraMoney;
      deadLine=false;
      letter=true;
    }
  }
    if (quotaFailed) {
    if (fadeT<=0) {
      fadeT=0;
    }
    textSize(100);
    fill(0, fadeT);
    rect(0, 0, width, height);
    fill(255, fadeT);
    text("Quota failed!", width/2-400, height/2);
    textSize(50);
   text("Weeks completed: "+ week, width/2-400, height/2+80);
    fill(255, fadeT);
    rect(width/2-410, height/2+140, 320, 120);
    fill(0, fadeT);
    rect(width/2-400, height/2+150, 300, 100);
    fill(255, fadeT);
    text("Next week", width/2-390, height/2+220);
    if (mousePressed && mouseX>=width/2-410 && mouseX<=width/2-410+320 && mouseY>=height/2+140 && mouseY<=height/2+140+120) {
      quotaFailed=false;
      day=0;
     week=0;
      deadLine=false;
      letter=true;
    }
  }
}
