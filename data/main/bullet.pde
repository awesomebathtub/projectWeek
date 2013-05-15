class Bullet {
  
  float xPos;
  float yPos;
  float speed;
  float xSpeed;
  float ySpeed;
  float ang;
  
  Bullet(float xPos_, float yPos_, float speed_) {
    
    xPos = xPos_;
    yPos = yPos_;
    speed = speed_;
    ang = atan2((mouseY-player.yPos),(mouseX-player.xPos));
    xSpeed = cos(ang)*speed;
    ySpeed = sin(ang)*speed;
    
  }//end of constructor
  
  void display() {
    
    fill (0,0,255);
    ellipse(xPos, yPos,2,2);
    
  }//end of display
  
  void shoot() {
    
    xPos += xSpeed;
    yPos += ySpeed;
    
  }//end shoot
  
}//end of bullet class
         
