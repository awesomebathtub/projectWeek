class Lifebar {
  
  float xPos;
  float yPos;
  float xLen;
  float yLen;
  
  Lifebar(float xPos_, float yPos_, float xLen_, float yLen_ ){
    
    xPos=xPos_;
    yPos=yPos_;
    xLen=xLen_;
    yLen=yLen_;
    
  }
  
  void display(){
    
    stroke(0);
    fill(0,200,0);
    rect(xPos,yPos,xLen,yLen);
    
  }//end display
  
}//end lifebar
