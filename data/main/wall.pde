class Wall {
  
  float x1;
  float y1;
  float x2;
  float y2;
  color c;
  
  Wall (float x1_, float y1_, float x2_, float y2_, color c_){
    
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
    c = c_;
    
  }
  
  void display (){
    
    rectMode (CORNERS);
    fill (c);
    rect (x1,y1,x2,y2);
    
  }
  
  void hit (){
    
    //BEGIN PLAYER HIT DETECT
    
    //when you hit the bottom of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && up == true){
      player.yPos = y2;
      player.countY -= player.speed;// so the camera doesn't move when you hit the wall
    }//end bottom edge
    
    //when you hit the top of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && dn == true){
      player.yPos = y1 - player.size;
      player.countY += player.speed;// so the camera doesn't move when you hit the wall
    }//end top edge
    
    //when you hit the right side of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && left == true){
      player.xPos = x2;
      player.countX -= player.speed;// so the camera doesn't move when you hit the wall
    }//end right edge
    
    //when you hit the left side of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && right == true){
      player.xPos = x1 - player.size;
      player.countX += player.speed;// so the camera doesn't move when you hit the wall

    }//end left edge

  }//end hit
  
}
