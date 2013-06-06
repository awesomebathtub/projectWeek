boolean up;
boolean right;
boolean dn;
boolean left;

class Player {
  
  float xPos;
  float yPos;
  float speed;
  float size = 32;
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
    
    rectMode(CORNER);
    noStroke();
    fill(0,255,255,0);
    rect(xPos,yPos,size,size);//player size is 32x32
    fill(0);
    text(ammo,xPos+250,yPos+250);
    
  }//end display
  
  void move() {
   
    tempX = xPos;
    tempY = yPos;
    
    if(up == true /* && yPos > 0*/){
      yPos -= speed;  
    }
    if(left == true /* && xPos > 0*/){
      xPos -= speed;
    }        
    if(dn == true /* &&  yPos  < height - size*/){
      yPos += speed;
    }
    if(right == true /* && xPos < width - size*/){
      xPos += speed;
    }
    
    countX += tempX - xPos;
    countY += tempY - yPos;
              
  }//end of move function
  
  void follow() {//function for the "camera" to follow the player
    
    translate (countX, countY);
    
  }
  
}//end of player class


