class Bullet {
  
  float xPos;
  float yPos;
  float speed;
  float xSpeed;
  float ySpeed;
  float ang;
  
  Bullet(float speed_) {
    
    xPos = player.xPos;
    yPos = player.yPos;
    speed = speed_;
    ang = atan2((mouseY-player.yPos),(mouseX-player.xPos));//sets the angle of the bullet's path
    xSpeed = cos(ang)*speed;//sets xSpeed based on angle to cursor
    ySpeed = sin(ang)*speed;//sets ySpeed based on angle to cursor
    
  }//end of constructor
  
  void display() {
    
    fill (0,0,255);
    ellipse(xPos, yPos,2,2);
    
  }//end of display
  
  void shoot() {
    
    xPos += xSpeed;
    yPos += ySpeed;
    //BEGIN BULLET/MONSTER HIT DETECTION
    for(int i = 0; i < monsters.length; i++){
      
      if(xPos <= monsters[i].xPos+monsters[i].size && xPos >= monsters[i].xPos && 
        yPos <= monsters[i].yPos+monsters[i].size && monsters[i].yPos >= monsters[i].yPos ){
          monsterLifebar[i].health -= 10;
          monsters[i].sighted = true;
      }//end if
    }//end for
  }//end shoot
}//end of bullet class
         
