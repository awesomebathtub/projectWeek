class Lifebar {
  
  float health = 100;
  
  Lifebar(){
    
  }
  
  void display(){
    
    stroke(0);
    fill(256,0,0);
    rectMode (CENTER);
    rect (width/2,height-30,100,20);
    rectMode (CORNER);
    fill (0,256,0);
    rect((width/2)-50,height-40,health,20);
    text (health,width-50,height-30);
    
  }//end display
  
}//end lifebar
