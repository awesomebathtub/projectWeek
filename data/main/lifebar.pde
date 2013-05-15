class Lifebar {
  
  float xPos;
  float yPos;
  float xLen;
  float yLen;
  float health = 100;
  
  Lifebar(float xPos_, float yPos_, float xLen_, float yLen_ ){
    
    xPos=xPos_;
    yPos=yPos_;
    xLen=xLen_;
    yLen=yLen_;
    
  }
  
  void display(){
    
    stroke(0);
    fill(0,200,0);
    rectMode (CORNER);
    rect(xPos,yPos,xLen*(100/health),yLen);
    text (health,xPos,yPos);
    
  }//end display
  
}//end lifebar
