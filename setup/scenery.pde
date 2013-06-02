class Tree{
  float xPos;
  float yPos;
  
  Tree(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }//end tree constructor
  
  void display(){
    image(tree_1, xPos, yPos);
  }//end display
}//end tree

class Flower{
  float xPos;
  float yPos;
  
  Flower(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }//end flower constructor
  
  void display(){
    image(flower_1, xPos, yPos);
  }//end display
}//end Flower

class Fence{
  float xPos;
  float yPos;
  
  Fence(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }//end fence constructor
  
  void display(){
    image(fence_1, xPos, yPos);
  }//end display
}//end Fence
