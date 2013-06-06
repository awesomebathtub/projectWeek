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
  
  
  
  
