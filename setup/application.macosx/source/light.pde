class Light{
  float xPos;
  float yPos;
  float size;//determines how much area the light lights up
  float c; //determines starting color
  //constructor
  
  Light(float xPos_, float yPos_, float size_, float c_ ){
    xPos=xPos_;
    yPos=yPos_;
    size=size_;
    c=c_;
  }
  
  void on(){
   for(float i = size; i>1; i=i-50){
   fill(255,255,255,1);
   noStroke();
   ellipse(xPos,yPos,i*2,i*2);
    }//end for
  }//end on
}//end light
