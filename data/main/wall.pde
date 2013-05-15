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
    
    //BEING PLAYER HIT DETECT
    if (player.yPos < y2 && player.yPos > y2-player.speed-1 && player.xPos < x2 && player.xPos+player.size > x1){
      player.yPos = y2;
    }//end bottom edge
    
    if (player.yPos+player.size > y1 && player.yPos+player.size < y1+player.speed+1 && player.xPos < x2 && player.xPos + player.size > x1){
      player.yPos = y1 - player.size;
    }//end top edge
    
    if (player.xPos < x2 && player.xPos > x2-player.speed-1 && player.yPos < y2 && player.yPos+player.size > y1){
      player.xPos = x2;
    }//end right edge
    
    if (player.xPos+player.size > x1 && player.xPos+player.size < x1+player.speed+1 && player.yPos < y2 && player.yPos + player.size > y1){
      player.xPos = x1 - player.size;
    }//end left edge

  }//end hit
  
}
