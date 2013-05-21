class Level {
  
  int level;
  
  Level(int level_){
    level=level_;
  }
  
  void display(){
    textSize(24);
    text(level, player.xPos - 270, player.yPos+270);
    
  }//end display
  
}//end Expbar
