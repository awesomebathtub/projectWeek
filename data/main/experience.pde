
class Expbar {
  
  float XP = 0;
  Expbar(){}
  
  void display(){
    //WHITE SECTION OF XP BAR, BACKGROUND
    stroke(1);
    fill(255);
    rectMode (CORNERS);
    rect(player.xPos-50, player.yPos+270, player.xPos+50, player.yPos+275);
    
    //PURPLE SECTION OF XP BAR, WHEN XP INCREASES
    fill (160,0,180);
    rect(player.xPos-50, player.yPos+270, player.xPos-50+XP, player.yPos+275);

  }//end display
  
}//end Expbar
