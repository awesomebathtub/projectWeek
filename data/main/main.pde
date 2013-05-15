Player player;
ArrayList bullets;
Monster[] monsters = new Monster[10];
Wall[] walls = new Wall[10];
Lifebar playerLifebar;

void setup(){
  
  bullets = new ArrayList(0);
  size(600,600);
  player = new Player(300,300,4);
  playerLifebar = new Lifebar();
  
  for (int i = 0; i < walls.length; i++){
    walls[i] = new Wall (200,200,240,210,#000000);
  }
  
  for (int i = 0; i < 10; i++){    
    monsters[i] = new Monster (3, 32);    
  }
  
}


