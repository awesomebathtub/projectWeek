import ddf.minim.*;

Minim minim;
Minim bulletMinim;
AudioPlayer music;
AudioPlayer bulletSound;

Player player;
ArrayList bullets;
Monster[] monsters = new Monster[10];
Monster temp;
Wall[] walls = new Wall[10];

Lifebar playerLifebar;
Lifebar[] monsterLifebar = new Lifebar[monsters.length];

Expbar playerXP;

void setup(){
  minim = new Minim(this);
  bulletMinim = new Minim(this);
  
  music = minim.loadFile("opening_theme.mp3");
  music.play();
  
  bullets = new ArrayList(0);
  size(600,600);
  player = new Player(300,300,4);
  playerLifebar = new Lifebar((width/2)-50,height-30,(width/2)+50,(height-40));
  
  playerXP = new Expbar((width/2)-50,height-20,(width/2)-50,(height-10));
  
  for (int i = 0; i < walls.length; i++){
    walls[i] = new Wall (200,200,240,210,#000000);
  }
  
  for (int i = 0; i < 10; i++){    
    monsters[i] = new Monster (3, 32);    
  }
  for(int i = 0; i < monsters.length; i++){
    monsterLifebar[i] = new Lifebar(monsters[i].xPos-10, monsters[i].yPos-15, monsters[i].xPos+42, monsters[i].yPos-5);
  }
  
  temp = new Monster (3, 32);
  
}//end of setup


