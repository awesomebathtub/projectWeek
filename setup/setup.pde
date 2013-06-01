//IMPORT********************
import ddf.minim.*;
import gifAnimation.*;

//IMAGE DECLARE*************
PImage loadScreen;
PImage ground_1;

PImage wall_1;

PImage monsterSprite;


PImage[] playerStopPImage;
PImage[] playerUpPImage;
PImage[] playerLeftPImage;
PImage[] playerDownPImage;
PImage[] playerRightPImage;

//LIGHT DECLARE*************
Light[] lights = new Light[10];

//GIF DECLARE*****
Gif playerStop;
Gif playerUp;
Gif playerLeft;
Gif playerDown;
Gif playerRight;

//MINIM DECLARE*************
Minim minim;
Minim bulletMinim;
Minim noShootMinim;

//AUDIOPLAYER DECLARE*******
AudioPlayer music;
AudioPlayer bulletSound;
AudioPlayer noShootSound;

//PLAYER DECLARE************
Player player;

ArrayList bullets;
Monster[] monsters = new Monster[10];
Monster temp;

BoundingBox[] bounds = new BoundingBox[1];

Lifebar playerLifebar;
Lifebar[] monsterLifebar = new Lifebar[monsters.length];

Expbar playerXP;
Level playerLevel;

boolean gameRunning = false;

int playerMovement = 0;

// 0 = stopped
// 1 = up
// 2 = left
// 3 = down
// 4 = right

void setup(){
  
  //*************************PLAYER MOVE GIFS*******************
  //MOVESTOP
  playerStop = new Gif(this, "gfx/player/moveStop.gif");
  playerStop.loop();
  playerStopPImage = Gif.getPImages(this, "gfx/player/moveStop.gif");
  //END MOVESTOP
  
  //MOVEUP
  playerUp = new Gif(this, "gfx/player/moveUp.gif");
  playerUp.loop();
  playerUpPImage = Gif.getPImages(this, "gfx/player/moveUp.gif");
  //END MOVEUP  
  
  //MOVELEFT
  playerLeft = new Gif(this, "gfx/player/moveLeft.gif");
  playerLeft.loop();
  playerLeftPImage = Gif.getPImages(this, "gfx/player/moveLeft.gif");
  //END MOVELEFT
    
  //MOVEDOWN
  playerDown = new Gif(this, "gfx/player/moveDown.gif");
  playerDown.loop();
  playerDownPImage = Gif.getPImages(this, "gfx/player/moveDown.gif");
  //END MOVEDOWN
    
  //MOVERIGHT
  playerRight = new Gif(this, "gfx/player/moveRight.gif");
  playerRight.loop();
  playerRightPImage = Gif.getPImages(this, "gfx/player/moveRight.gif");
  //END MOVERIGHT
  
  //*************************END PLAYER MOVE GIFS*****************
  
  
  //***************************LOAD IMAGES**************************
  loadScreen = loadImage("gfx/textures/loadScreen.jpg");
  ground_1 = loadImage("gfx/textures/ground_1.jpg");
  
  monsterSprite = loadImage("gfx/enemy/monsterSprite.gif");
  
  
  //*****************************END LOAD IMAGES*********************
  
  frameRate(60);
  
  minim = new Minim(this);
  bulletMinim = new Minim(this);
  noShootMinim = new Minim(this);
  
  music = minim.loadFile("sfx/opening_theme.mp3");
  
  bullets = new ArrayList(0);
  size(600,600);
  
  player = new Player(300,300,2,30);
  playerLifebar = new Lifebar(player.xPos-50, player.yPos+250, player.xPos+50, player.yPos-250, 100,100);
  playerXP = new Expbar();
  playerLevel = new Level(1);
  
  
  for (int i = 0; i< bounds.length; i++){
    bounds[i] = new BoundingBox (0,0,400,400);
  }//end bounds for
  
  for (int i = 0; i < 10; i++){    
    monsters[i] = new Monster (0.5, 64);    
  }//end for
  
  for (int i = 0; i < monsters.length; i++){
    monsterLifebar[i] = new Lifebar(monsters[i].xPos-10, monsters[i].yPos-10, monsters[i].xPos+10, monsters[i].yPos-5,50,50);
  }//end for
  
  for (int i = 0; i< lights.length; i++){
    lights[i] = new Light(0,0,200,200);
  }//end for
  
  //temp = new Monster (3, 64);
  
}//end of setup
