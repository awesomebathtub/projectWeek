boolean up;
boolean right;
boolean dn;
boolean left;

class Player {
  
  float xPos;
  float yPos;
  float speed;
  float size = 16;
  int ammo;
  float countX;
  float countY;
  float tempX;
  float tempY;
  
  Player(float xPos_, float yPos_, float speed_, int ammo_) {
    
    xPos = xPos_;
    yPos = yPos_;
    speed = speed_;
    ammo = ammo_;
    
  }//end of constructor
  
  void display() {
    
    rectMode(CENTER);
    fill(0,255,255);
    rect(xPos,yPos,size,size);
    text(ammo,xPos+250,yPos+250);
    
  }//end display
  
  void move() {
   
      if(up == true && yPos > 0){
        yPos -= speed;  
      }
      if(left == true && xPos > 0){
        xPos -= speed;
      }        
      if(dn == true && yPos < height - size){
        yPos += speed;
      }
      if(right == true && xPos < width - size){
        xPos += speed;
      }
                   
  }//end of move function
  
}//end of player class


