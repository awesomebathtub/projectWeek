class Expbar {
  
  float XP = 0;
  Expbar(){
    
  }
  
  void display(){
    //WHITE SECTION OF XP BAR, BACKGROUND
    stroke(1);
    fill(255);
    rectMode (CORNERS);
    rect(player.xPos-10, player.yPos-15, player.xPos+10, player.yPos-12);
    //from -10, -10, to +10, -7
    
    //PURPLE SECTION OF XP BAR, WHEN XP INCREASES
    fill (160,0,180);
    rect(player.xPos-10, player.yPos-15, player.xPos-10+XP, player.yPos-12);
    //from -10, -15 to -10+xp, -12
    
  }//end display
  
}//end Expbar
