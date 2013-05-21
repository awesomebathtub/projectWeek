class Level {
  
  int level;
  
  Level(int level_){
    level=level_;
  }
  
  void display(){
    textSize(18);
    text(level,player.xPos-275, player.yPos+275);
    
  }//end display
  
}//end Expbar
