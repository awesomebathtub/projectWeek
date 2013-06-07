class Tree{
  float xPos;
  float yPos;
  
  Tree(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }//end tree constructor
  
  void display(){
    image(tree_1, xPos, yPos);
  }//end display
}//end tree
class Rock{
  float xPos;
  float yPos;
  
  Rock(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }//end flower constructor
  
  void display(){
    image(rock_1, xPos, yPos);
  }//end display
}//end Flower

class Flower{
  float xPos;
  float yPos;
  
  Flower(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }//end flower constructor
  
  void display(){
    image(flower_1, xPos, yPos);
  }//end display
}//end Flower

class Fence{
  float xPos;
  float yPos;
  
  Fence(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }//end fence constructor
  
  void display(){
    image(fence_1, xPos, yPos);
  }//end display
}//end Fence

class Cloud{
  float xPos;
  float yPos;
  float speed;
  
  Cloud(float xPos_, float yPos_, float speed_){
    xPos = xPos_;
    yPos = yPos_;
    speed=speed_;
  }
  
  void display(){
    tint(255,255,255,150);
    image(cloud_1, xPos, yPos);
    noTint();
  }//end display
}//end Cloud

class CloudShadow{
  float xPos;
  float yPos;
  float speed;
  
   CloudShadow(float xPos_, float yPos_, float speed_){
    xPos = xPos_;
    yPos = yPos_;
    speed=speed_;
   }
   
   void display(){
     fill(0,0,0,50);
     ellipse(xPos,yPos, 90,20);
   }
}//end CloudShadow
  
class Reticle{
  float xPos;
  float yPos;
  
  Reticle(){
    xPos = mouseX +16;
    yPos = mouseY +16;
  }
  
  void display(){
    image(reticleImg, xPos, yPos);
  }
}//end Reticle
  
class FlowerShadow{
  float xPos;
  float yPos;
  
  FlowerShadow(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }
  void display(){
    fill(0,0,0,50);
    noStroke();
    ellipse(xPos, yPos, 20, 10);
  }//end flowerdisplay
}//end flowershadow

class WeaponBox{
  boolean pickedUp = false;
  float xPos;
  float yPos;
  
  WeaponBox(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }  
  
  void display(){
    if(pickedUp == false){
    image(weaponBox, xPos, yPos);
    }
  }//end display
  boolean d = false;
  void pickUp(){ 
    if(player.xPos+16 >= xPos && player.xPos+16 <= xPos + 32 && player.yPos+16 >= yPos && player.yPos+16 <= yPos+32 && d == false){
      d = true;
      pickedUp = true;
      int which = int(random(1370));
      if(which <= 500){
        eqWep = "Tomahawk";
        player.ammo = tomahawk.ammo;
      }
      if(which >=501 && which <=600){
        eqWep = "Sword";
        player.ammo = sword.ammo;
      }
      if(which >=601 && which <=750){
        eqWep = "Hammer";
        player.ammo = hammer.ammo;
      }
      if(which >= 751 && which <= 800){
        eqWep = "Harpoon";
        player.ammo = harpoon.ammo;
      }
      if(which >=801 && which < 1000){
        eqWep = "Spear";
        player.ammo = spear.ammo;
      }
      if(which >=1001 && which < 1170){
        eqWep = "Axe";
        player.ammo = axe.ammo;
      }
      if(which >= 1171 && which < 1370){
        eqWep = "Mace";
        player.ammo = mace.ammo;
      }
    }
  }//end pickUp
}//end WeaponBox

class HealthBoost{
  boolean pickedUp = false;
  float xPos;
  float yPos;
  
  HealthBoost(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }
  
  void display(){
    if(pickedUp == false){
    image(healthBoostGif, xPos,yPos);
    }
  }//end display
  
  boolean d = false;
  void pickUp(){ 
    if(player.xPos+16 >= xPos && player.xPos+16 <= xPos + 32 && player.yPos+16 >= yPos && player.yPos+16 <= yPos+32 && d == false){
      d = true;
      pickedUp = true;
      playerLifebar.health = playerLifebar.maxHP;
    }//end if
  }//end pickup
}//end healthboost

class Pond{
  float xPos;
  float yPos;
  
  Pond(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }
  
  void display(){
    image(pond_1, xPos,yPos);
    
  }//end display
}//end healthboost
  
  
  
  
