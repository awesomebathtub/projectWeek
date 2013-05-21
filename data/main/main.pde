import ddf.minim.*;
PImage loadScreen;

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
Level playerLevel;

int gameState = 0;

void setup(){
  //map size
  size(600,600);
  
  //load images
  loadScreen = loadImage("loadScreen.jpg");
  
  //set fps
  frameRate(60);
  
  //load sound
  minim = new Minim(this);
  bulletMinim = new Minim(this);
  music = minim.loadFile("opening_theme.mp3");
  
  //setup bullets
  bullets = new ArrayList(0);
  
  //player setup
  player = new Player(300,300,4,30);
  playerLifebar = new Lifebar(player.xPos-50, player.yPos+250, player.xPos+50, player.yPos-250, 100,100);
  playerXP = new Expbar();
  playerLevel = new Level(1);
  
  //setup walls
  for (int i = 0; i < walls.length; i++){
    walls[i] = new Wall (200,200,240,210,#000000);
  }
  
  //setup monsters
  for (int i = 0; i < 10; i++){    
    monsters[i] = new Monster (3, 32);    
  }
  //setup lifebar
  for (int i = 0; i < monsters.length; i++){
    monsterLifebar[i] = new Lifebar(monsters[i].xPos-10, monsters[i].yPos-15, monsters[i].xPos+10, monsters[i].yPos-5,75,75);
  }
  
  temp = new Monster (3, 32);
  
}//end of setup


