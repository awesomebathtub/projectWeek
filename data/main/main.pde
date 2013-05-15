import dff.minim.*;

AudioPlayer player;
minim minim;

Player player;
ArrayList bullets;
Monster[] monsters = new Monster[10];
Wall[] walls = new Wall[10];
Lifebar playerLifebar;
Lifebar[] monsterLifebar = new Lifebar[monsters.length];

void setup(){
  minim = new Minim(this);
  player = minim.loadFile("opening_theme.mp3");
  player.play();
  
  bullets = new ArrayList(0);
  size(600,600);
  player = new Player(300,300,4);
  playerLifebar = new Lifebar((width/2)-50,height-30,(width/2)+50,(height-40));
  
  for (int i = 0; i < walls.length; i++){
    walls[i] = new Wall (200,200,240,210,#000000);
  }
  
  for (int i = 0; i < 10; i++){    
    monsters[i] = new Monster (3, 32);    
  }
  for(int i = 0; i < monsters.length; i++){
    monsterLifebar[i] = new Lifebar(monsters[i].xPos-10, monsters[i].yPos-15, monsters[i].xPos+42, monsters[i].yPos-5);
  }
  
}


