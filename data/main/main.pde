import ddf.minim.*;
PImage loadScreen;

Minim minim;
Minim bulletMinim;
Minim noShootMinim;

AudioPlayer music;
AudioPlayer bulletSound;
AudioPlayer noShootSound;

Player player;
ArrayList bullets;
Monster[] monsters = new Monster[10];
Monster temp;
Wall[] walls = new Wall[10];

Lifebar playerLifebar;
Lifebar[] monsterLifebar = new Lifebar[monsters.length];

Expbar playerXP;
Level playerLevel;

boolean gameRunning = false;

void setup(){

  loadScreen = loadImage("loadScreen.jpg");
  frameRate(60);
  
  minim = new Minim(this);
  bulletMinim = new Minim(this);
  noShootMinim = new Minim(this);
  
  music = minim.loadFile("opening_theme.mp3");
  
  bullets = new ArrayList(0);
  size(600,600);
  
  player = new Player(300,300,4,2);
  playerLifebar = new Lifebar(player.xPos-50, player.yPos+250, player.xPos+50, player.yPos-250, 100,100);
  playerXP = new Expbar();
  playerLevel = new Level(1);
    
  for (int i = 0; i < walls.length; i++){
    walls[i] = new Wall (200,200,240,210,#000000);
  }
  
  for (int i = 0; i < 10; i++){    
    monsters[i] = new Monster (3, 32);    
  }
  for (int i = 0; i < monsters.length; i++){
    monsterLifebar[i] = new Lifebar(monsters[i].xPos-10, monsters[i].yPos-15, monsters[i].xPos+10, monsters[i].yPos-5,75,75);
  }
  
  temp = new Monster (3, 32);
  
}//end of setup


