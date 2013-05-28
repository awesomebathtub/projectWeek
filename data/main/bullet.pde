class Bullet {
  
  float xPos;
  float yPos;
  float speed;
  float xSpeed;
  float ySpeed;
  float ang;
  boolean hit;
  
  Bullet(float speed_) {
    
    xPos = player.xPos + player.size/2;
    yPos = player.yPos + player.size/2;
    speed = speed_;
    xSpeed = -(speed*(player.xPos - (mouseX-player.countX)))/dist(player.xPos,player.yPos,mouseX-player.countX,mouseY-player.countY);
    ySpeed = -(speed*(player.yPos - (mouseY-player.countY)))/dist(player.xPos,player.yPos,mouseX-player.countX,mouseY-player.countY);
    
  }//end of constructor
  
  void display() {
    
    fill (255);
    ellipse(xPos, yPos,5,5);
    
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
    
    //BEGIN BULLET/WALL HIT DETECT
    for (int i = 0; i < walls.length; i++){
      
      if (xPos <= walls[i].x2 && xPos >= walls[i].x1 && yPos <= walls[i].y2 && yPos >= walls[i].y1){
        
        hit = true;
        
      }
      
    }//end bullet/wall hit detect
    
  }//end shoot
  
}//end of bullet class
