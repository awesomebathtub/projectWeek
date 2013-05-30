class Level {
  
  int level;
  
  Level(int level_){
    level=level_;
  }
  
  void display(){
    textSize(18);
    text(level, player.xPos-200, player.yPos+200);
    
  }//end display
  
}//end Expbar
