ArrayList<baitSkins> baitSkinsUnlocked;
ArrayList<baitSkins> baitSkinsLocked;
skinManager skinManager;


class baitSkins {
  String skinName;
  boolean selected=false;
  baitSkins(String name) {
    this.skinName=name;
  }
}
class skinManager {

  boolean isSkinUnlocked(String name) {
    for ( baitSkins baitSkins : baitSkinsUnlocked) {
      if (baitSkins.skinName.equals(name)) {
        return true;
      }
    }
    return false;
  }

  ArrayList<baitSkins> baitSkinsUnlocked;
  ArrayList<baitSkins> baitSkinsLocked;
  skinManager() {
    baitSkinsUnlocked = new ArrayList<baitSkins>();
    baitSkinsLocked = new ArrayList<baitSkins>();
  }
  void addSkin(String name) {
    baitSkinsLocked.add(new baitSkins(name));
  }
  void skinChance() {
    if (!baitSkinsLocked.isEmpty()) {
      int chance = int(random(101));

      if (chance<10) {
        unlockSkin("Gold");
      } else
        if (chance<20) {
          unlockSkin("RedBlue");
        } else
          if (chance<30) {
            unlockSkin("Ice");
          } else
            if (chance<40) {
              unlockSkin("Fire");
            } else
              if (chance<50) {
                unlockSkin("Wave");
              } else
                if (chance<60) {
                  unlockSkin("Carrot");
                } else
                  if (chance<70) {
                    unlockSkin("Candy");
                  } else if (chance<80) {
                    unlockSkin("Flower");
                  } else
                    if (chance<90) {
                      unlockSkin("Forest");
                    } else
                      if (chance<100) {
                        unlockSkin("Rainbow");
                      }
    }
  }
  void unlockSkin(String name) {
    if (isSkinUnlocked(name)) {
      println("You already unlocked "+name);
    }
    if (!isSkinUnlocked(name)) {
      for (int i=0; i<baitSkinsLocked.size(); i++) {
        if (baitSkinsLocked.get(i).skinName.equals(name)) {
          println("You got "+name);
          baitSkinsUnlocked.add(baitSkinsLocked.get(i));
          baitSkinsLocked.remove(i);
          return;
        }
      }
    }
  }
  void checkSelectedSkins(String name) {
    if (name.equals("Gold")) {
      baitSkinGold=true;
    }
    if (name.equals("RedBlue")) {
      baitSkinRedBlue=true;
    }
    if (name.equals("Forest")) {
      baitSkinForest=true;
    }
    if (name.equals("Ice")) {
      baitSkinIce=true;
    }
    if (name.equals("Fire")) {
      baitSkinFire=true;
    }
    if (name.equals("Flower")) {
      baitSkinFlower=true;
    }
    if (name.equals("Rainbow")) {
      baitSkinRainbow=true;
    }
    if (name.equals("Candy")) {
      baitSkinCandy=true;
    }
    if (name.equals("Carrot")) {
      baitSkinCarrot=true;
    }
    if (name.equals("Wave")) {
      baitSkinWave=true;
    }
  }
}
