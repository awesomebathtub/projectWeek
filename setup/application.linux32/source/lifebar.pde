class Lifebar {
  
  float health;
  float xPos1;
  float yPos1;
  float yPos2;
  float maxHP;
  
  Lifebar(float xPos1_, float yPos1_, float xPos2_, float yPos2_, float health_, float maxHP_ ){
    
    xPos1 = xPos1_;
    yPos1 = yPos1_;
    yPos2 = yPos2_;
    health = health_;
    maxHP = maxHP_;
    
  }
  
  void display(){
    //RED SECTION OF HEALTH BAR, WHEN HEALTH DEPLETES
    stroke(0);
    fill(255,0,0);
    rectMode (CORNERS);
    rect(xPos1,yPos1,xPos1+maxHP,yPos2);
    
    //GREEN SECTION OF HEALTH BAR
    fill(0,255,0);
    rect(xPos1,yPos1,xPos1+health,yPos2);
    //text (health,width-50,height-30);
        
  }//end display
  
}//end lifebar
