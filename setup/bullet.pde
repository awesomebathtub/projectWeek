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
    if(eqWep == "tomahawk"){
      image(tomahawkGif,xPos,yPos);
    }
    if(eqWep == "sword"){
      image(swordGif,xPos,yPos);
    }
    if(eqWep == "hammer"){
      image(hammerGif,xPos,yPos);
    }
    if(eqWep == "harpoon"){
      image(harpoonGif,xPos,yPos);
    }
    if(eqWep == "spear"){
      image(spearGif,xPos,yPos);
    }
    if(eqWep == "axe"){
      image(axeGif,xPos,yPos);
    }
    if(eqWep == "mace"){
      image(maceGif,xPos,yPos);
    }
  }//end of display
  
  void shoot() {
    
    xPos += xSpeed;
    yPos += ySpeed;
    
    //BEGIN BULLET/MONSTER HIT DETECTION
    for(int i = 0; i < monsters.length; i++){
      
      if(xPos <= monsters[i].xPos + 32 && xPos >= monsters[i].xPos && yPos <= monsters[i].yPos + 32 && yPos >= monsters[i].yPos ){
          if(eqWep == "tomahawk"){
            monsterLifebar[i].health -= tomahawk.damage;
            monsters[i].sighted = true;
            hit = true;
          }
          if(eqWep == "sword"){
            monsterLifebar[i].health -= sword.damage;
            monsters[i].sighted = true;
            hit = true;
          }
          if(eqWep == "hammer"){
            monsterLifebar[i].health -= hammer.damage;
            monsters[i].sighted = true;
            hit = true;
          }
          if(eqWep == "harpoon"){
            monsterLifebar[i].health -= harpoon.damage;
            monsters[i].sighted = true;
            hit = true;
          }
          if(eqWep == "spear"){
            monsterLifebar[i].health -= spear.damage;
            monsters[i].sighted = true;
            hit = true;
          }
          if(eqWep == "axe"){
            monsterLifebar[i].health -= axe.damage;
            monsters[i].sighted = true;
            hit = true;
          }
          if(eqWep == "mace"){
            monsterLifebar[i].health -= mace.damage;
            monsters[i].sighted = true;
            hit = true;
          }
            
          
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
