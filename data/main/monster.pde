class Monster
{
  float xPos;
  float yPos;
  float speed;
  float xSpeed;
  float ySpeed;
  float size;
  float ang;
  boolean sighted = false;
  boolean living = true;
  
  //inputs are monster speed, patrol box x, patrol box y, patrol box width, patrol box height, monster size
  Monster(float speed_, float size_) {
    
    speed = speed_;
    xSpeed = speed;
    ySpeed = 0;
    size = size_;
    xPos = width+size+1;
    yPos = height+size+1;

    
  }//end of constructor
  
  void display() {
    
    rectMode (CORNER);
    fill(255,0,0);
    rect(xPos,yPos,size,size);
    
  }//end display
  
  void patrol(float pX, float pY, float pW, float pH) {//a patrol function. inputs are x,y,width,height
        
    if (sighted == false){ 
      
      if (xPos + size > pX + pW){        
        xSpeed = 0;
        ySpeed = speed; 
        xPos = (pX + pW) - size;
      }
      
      if (yPos + size > pY + pH){
       xSpeed = -speed;
       ySpeed = 0;
       yPos = (pY + pH) - size;
      } 
      
      if (xPos < pX){
        xSpeed = 0;
        ySpeed = -speed;
        xPos = pX;
      }
      
      if (yPos < pY){
        xSpeed = speed;
        ySpeed = 0;
        yPos = pY;
      }
      
    }//end if sighted == false
    
    else {
      
      ang = atan2 (player.yPos - yPos, player.xPos - xPos);
      xSpeed = speed*cos(ang);
      ySpeed = speed*sin(ang);
      
    }//end else
    
    if (dist (player.xPos,player.yPos,xPos,yPos) < 200){
      
      sighted = true;
            
    }//end sight detect
    
    
    
    xPos += xSpeed;
    yPos += ySpeed;
            
  }//end patrol
  
  void hit (){
    
    for (int i = 0; i < walls.length; i++){
    
      //BEGIN MONSTER/WALL HIT DETECT
      if (yPos < walls[i].y2 && yPos > walls[i].y2-speed-1 && xPos < walls[i].x2 && xPos+size > walls[i].x1){
        yPos = walls[i].y2;
      }//end bottom edge
      
      if (yPos+size > walls[i].y1 && yPos+size < walls[i].y1+speed+1 && xPos < walls[i].x2 && xPos + size > walls[i].x1){
        yPos = walls[i].y1 - size;
      }//end top edge
      
      if (xPos < walls[i].x2 && xPos > walls[i].x2-speed-1 && yPos < walls[i].y2 && yPos+size > walls[i].y1){
        xPos = walls[i].x2;
      }//end right edge
      
      if (xPos+size > walls[i].x1 && xPos+size < walls[i].x1+speed+1 && yPos < walls[i].y2 && yPos + size > walls[i].y1){
        xPos = walls[i].x1 - size;
      }//end left edge
      //END MONSTER/WALL HIT
      
      //BEGIN PLAYER/MONSTER HIT DETECT
      if (player.yPos < yPos+size && player.yPos > yPos+size-player.speed-1 && player.xPos < xPos+size && player.xPos+player.size > xPos){
        player.yPos += speed*20;
        playerLifebar.health -= 10; 
      }//end bottom edge
      
      if (player.yPos+player.size > yPos && player.yPos+player.size < yPos+player.speed+1 && player.xPos < xPos+size && player.xPos + player.size > xPos){
        player.yPos -= speed*20;
        playerLifebar.health -= 10;
      }//end top edge
      
      if (player.xPos < xPos+size && player.xPos > xPos+size-player.speed-1 && player.yPos < yPos+size && player.yPos+player.size > yPos){
        player.xPos += speed*20;
        playerLifebar.health -= 10;
      }//end right edge
      
      if (player.xPos+player.size > xPos && player.xPos+player.size < xPos+player.speed+1 && player.yPos < yPos+size && player.yPos + player.size > yPos){
        player.xPos -= speed*20;
        playerLifebar.health -= 10;
      }//end left edge
      //END PLAYER/MONSTER HIT
      
      
    }//end for loop
    
  }
  
  void death (int i){
    
    if (living == true){
      
      playerXP.XP +=20;
      
    }
    living = false;
    monsters[i] = monsters[monsters.length-1];
    shorten(monsters);
        
  }
  
}//end monsterOne class

