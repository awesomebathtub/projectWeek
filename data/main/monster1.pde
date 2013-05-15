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
    
      //BEGIN MONSTER HIT DETECT
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
      
    }//end for loop
    
  }//end hit

}//end monsterOne class

