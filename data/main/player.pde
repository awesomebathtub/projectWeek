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
  Player(float xPos_, float yPos_, float speed_, int ammo_) {
    
    xPos = xPos_;
    yPos = yPos_;
    speed = speed_;
    ammo = ammo_;
    
  }//end of constructor
  
  void display() {
    
    rectMode (CORNER);
    fill(0,255,255);
    rect(xPos,yPos,size,size);
    
  }//end display
  
  void move() {
   
      if(up == true && yPos > 0){
        //translate (0,4);
        yPos -= speed;  
      }
      if(left == true && xPos > 0){
        //translate (4,0);  
        xPos -= speed;
      }        
      if(dn == true && yPos < height - size){
        //translate (0,-4);
        yPos += speed;
      }
      if(right == true && xPos < width - size){
        //translate (-4,0);
        xPos += speed;
      }
      
      
      if (xPos > width - size){
        xPos = width - size;
      }
      if (xPos < 0){
        xPos = 0;
      }
      if (yPos > height - size){
        yPos = height - size;
      }
      if (yPos < 0){
        yPos = 0;
      }
        
  }//end of move function
  
}//end of player class


