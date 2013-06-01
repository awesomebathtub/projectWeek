class BoundingBox{
  float x1;
  float y1;
  float x2;
  float y2;
  
  BoundingBox(float x1_, float y1_, float x2_, float y2_ ){
    x1=x1_;
    y1=y1_;
    x2=x2_;
    y2=y2_;
  }//end boundingbox constructor
  
  void display(){
  noStroke();
  fill(0,0,0,0);
  rect(x1,y1,x2,y2);
  }//end display
}//end boundingbox class
