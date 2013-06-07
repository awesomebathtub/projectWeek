class Level {
  
  int level;
  
  Level(int level_){
    level=level_;
  }
  
  void display(){
    fill(0,0,0);
    textSize(18);
    text(level, player.xPos-200, player.yPos+250);
    text("Level:", player.xPos-250, player.yPos+250);
    
  }//end display
  
}//end Expbar
