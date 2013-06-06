class Wall {
  
  float x1;
  float y1;
  float x2;
  float y2;
  
  Wall (float x1_, float y1_, float x2_, float y2_){
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
  }
  
  void display(){
    
    rectMode (CORNERS);
    noStroke();
    fill (0,0,0,0);
    rect (x1, y1, x2, y2);
    
  }
  
  void hit() {
    
    //BEGIN PLAYER HIT DETECT
        //BEGIN PLAYER HIT DETECT
    
    //when you hit the bottom of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && up == true){
      pushMatrix();
      player.yPos = y2;
      player.countY -= player.speed;// so the camera doesn't move when you hit the wall
      popMatrix();
      
    }//end bottom edge
    
    //when you hit the top of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && dn == true){
      pushMatrix();
      player.yPos = y1 - player.size;
      player.countY += player.speed;// so the camera doesn't move when you hit the wall
      popMatrix();
    }//end top edge
    
    //when you hit the right side of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && left == true){
      pushMatrix();
      player.xPos = x2;
      player.countX -= player.speed;// so the camera doesn't move when you hit the wall
      popMatrix();
    }//end right edge
    
    //when you hit the left side of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && right == true){
      pushMatrix();
      player.xPos = x1 - player.size;
      player.countX += player.speed;// so the camera doesn't move when you hit the wall
      popMatrix();

    }//end left edge

  }//end hit
  
}
