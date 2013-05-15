class Lifebar {
  
  float health = 100;
  float xPos1;
  float yPos1;
  float xPos2;
  float yPos2;
  Lifebar(float xPos1_, float yPos1_, float xPos2_, float yPos2_){
    xPos1 = xPos1_;
    yPos1 = yPos1_;
    xPos2 = xPos2_;
    yPos2 = yPos2_;
  }
  
  void display(){
    //RED SECTION OF HEALTH BAR, WHEN HEALTH DEPLETES
    stroke(0);
    fill(255,0,0);
    rectMode (CORNERS);
    rect (xPos1,yPos1,xPos2,yPos2);
    //GREEN SECTION OF HEALTH BAR
    fill (0,255,0);
    rect (xPos1,yPos1,xPos1+health,yPos2);
    //text (health,width-50,height-30);
    
  }//end display
  
}//end lifebar
