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
      player.yPos = y2;
      
    }//end bottom edge
    
    //when you hit the top of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && dn == true){
      player.yPos = y1 - player.size;
    }//end top edge
    
    //when you hit the right side of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && left == true){
      player.xPos = x2;
    }//end right edge
    
    //when you hit the left side of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && right == true){
      player.xPos = x1 - player.size;

    }//end left edge

  }//end hit
  
}
