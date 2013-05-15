//TESTING

Player player; //creates player
ArrayList bullets; 
Monster[] monsters = new Monster[10];
Wall[] walls = new Wall[10];
Lifebar playerLifebar;//player life bar

void setup(){
  
  bullets = new ArrayList(0);
  size(600,600);//sets screen size
  player = new Player(300,300,4);//player parameters
  playerLifebar = new Lifebar(200, 575, 200,25);//lifebar parameters
  
  for (int i = 0; i < walls.length; i++){
    walls[i] = new Wall (200,200,240,210,#000000);
  }
  
  for (int i = 0; i < 10; i++){    
    monsters[i] = new Monster (3, 32);    
  }
  
}


