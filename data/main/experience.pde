class Expbar {
  
  float XP = 0;
  float xPos1;
  float yPos1;
  float xPos2;
  float yPos2;
  Expbar(float xPos1_, float yPos1_, float xPos2_, float yPos2_){
    xPos1 = xPos1_;
    yPos1 = yPos1_;
    xPos2 = xPos2_;
    yPos2 = yPos2_;
  }
  
  void display(){
    //WHITE SECTION OF XP BAR, BACKGROUND
    stroke(0);
    fill(255);
    rectMode (CORNERS);
    rect (xPos1,yPos1,xPos2,yPos2);
    
    //PURPLE SECTION OF XP BAR, WHEN XP INCREASES
    fill (160,0,180);
    rect (xPos1,yPos1,xPos1+XP,yPos2);
    //text (health,width-50,height-30);
    
  }//end display
  
}//end Expbar
