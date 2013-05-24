class Bullet {
  
  float xPos;
  float yPos;
  float speed;
  float xSpeed;
  float ySpeed;
  float ang;
  boolean hit;
  
  Bullet(float speed_) {
    
    xPos = player.xPos;
    yPos = player.yPos;
    speed = speed_;
    xSpeed = -(speed*(player.xPos - (mouseX-player.countX)))/dist(player.xPos,player.yPos,mouseX-player.countX,mouseY-player.countY);
    ySpeed = -(speed*(player.yPos - (mouseY-player.countY)))/dist(player.xPos,player.yPos,mouseX-player.countX,mouseY-player.countY);
    
  }//end of constructor
  
  void display() {
    
    println (xSpeed);
    fill (0,0,255);
    ellipse(xPos, yPos,2,2);
    
  }//end of display
  
  void shoot() {
    
    xPos += xSpeed;
    yPos += ySpeed;
    
    //BEGIN BULLET/MONSTER HIT DETECTION
    for(int i = 0; i < monsters.length; i++){
      
      if(xPos <= monsters[i].xPos+monsters[i].size && xPos >= monsters[i].xPos && yPos <= monsters[i].yPos+monsters[i].size && monsters[i].yPos >= monsters[i].yPos ){
        
          monsterLifebar[i].health -= 10;
          monsters[i].sighted = true;
          hit = true;
          
      }//end if
      
    }//end for
    
  }//end shoot
  
}//end of bullet class
