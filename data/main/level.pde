class Level {
  
  float level;
  
  Level(float level_){
    level=level_;
  }
  
  void display(){
    textSize(18);
    text(level,width-580, height-20);
    
  }//end display
  
}//end Expbar
