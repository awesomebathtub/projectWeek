//IMPORT********************
import ddf.minim.*;
import gifAnimation.*;

//IMAGE DECLARE*************
PImage loadScreen;

PImage monster_1;

PImage fence_1;
PImage reticleImg;
PImage tree_1;

PImage[] noMoreTomahawks_PImage;
PImage[] titleScreen_PImage;
PImage[] tomahawk_PImage;
PImage[] flower_1PImage;
PImage[] cloud_1PImage;
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

Gif tomahawk;
Gif cloud_1;
Gif flower_1;

Gif noMoreTomahawks;

Gif titleScreen;
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

Reticle reticle;

ArrayList bullets;

Monster[] monsters = new Monster[50];

Monster temp;

Lifebar playerLifebar;

Lifebar[] monsterLifebar = new Lifebar[monsters.length];

Tree[] trees = new Tree[50];

Flower[] flowers = new Flower[50];
FlowerShadow[] flowershadows = new FlowerShadow[flowers.length];

Wall[] walls = new Wall[100];

Fence[] fences = new Fence[50];

Cloud[] clouds = new Cloud[10];
CloudShadow [] cloudshadows = new CloudShadow[clouds.length];

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
  loadScreen = loadImage("gfx/textures/loadScreen.gif");
  
  monster_1 = loadImage("gfx/enemy/monster_1.gif");
  
  fence_1 = loadImage("gfx/textures/fence_1.gif");
  
  tree_1 = loadImage("gfx/textures/tree_1.gif");
  
  reticleImg = loadImage("gfx/textures/reticle.gif");
  
  cloud_1 = new Gif(this, "gfx/textures/cloud_1.gif");
  cloud_1.loop();
  cloud_1PImage = Gif.getPImages(this, "gfx/textures/cloud_1.gif");
   
  flower_1 = new Gif(this, "gfx/textures/flower_1.gif");
  flower_1.loop();
  flower_1PImage = Gif.getPImages(this, "gfx/textures/flower_1.gif");
  
  tomahawk = new Gif(this, "gfx/textures/tomahawk.gif");
  tomahawk.loop();
  tomahawk_PImage = Gif.getPImages(this, "gfx/textures/tomahawk.gif");
  
  noMoreTomahawks = new Gif(this, "gfx/textures/nomo.gif");
  noMoreTomahawks.loop();
  tomahawk_PImage = Gif.getPImages(this, "gfx/textures/nomo.gif");
  
  titleScreen = new Gif(this, "gfx/textures/tomahawk_tosser_title.gif");
  //*****************************END LOAD IMAGES*********************
  
  frameRate(60);
  
  minim = new Minim(this);
  bulletMinim = new Minim(this);
  noShootMinim = new Minim(this);
  
  music = minim.loadFile("sfx/opening_theme.mp3");
  reticle = new Reticle();
  
  bullets = new ArrayList(0);
  size(600,600);
  
  player = new Player(300,300,2,100);
  playerLifebar = new Lifebar(player.xPos-50, player.yPos+250, player.xPos+50, player.yPos-250, 100,100);
  playerXP = new Expbar();
  playerLevel = new Level(1);
  for (int i = 0; i < clouds.length; i++){
    int rand1 = int(random(-1000,1000));
    int rand2 = int(random(-1000,1000));
    float rand3 = random(0,1);
    clouds[i] = new Cloud (rand1,rand2,rand3);
    cloudshadows[i] = new CloudShadow (rand1+50,rand2+100,rand3);
  }
  for (int i = 0; i < fences.length; i++){
    fences[i] = new Fence (0 + (i*32), 0);
    walls[i+50] = new Wall (fences[i].xPos, fences[i].yPos + 10, fences[i].xPos+32, fences[i].yPos + 20);
  }
  for (int i = 0; i < flowers.length; i++){
    int rand1 = int(random(-1000,1000));
    int rand2 = int(random(-1000,1000));
    flowers[i] = new Flower (rand1, rand2);
    flowershadows[i] = new FlowerShadow (rand1+20, rand2+27);
  }
  for (int i = 0; i < trees.length; i++){
    int rand1 = int(random(-1000,1000));
    int rand2 = int(random(-1000,1000));
    trees[i] = new Tree (rand1, rand2);
    walls[i] = new Wall (trees[i].xPos+20, trees[i].yPos+90, trees[i].xPos+100, trees[i].yPos+100);
  }
  for (int i = 0; i < monsters.length; i++){
    int rand1 = int(random(-2000,2000));
    int rand2 = int(random(-2000,2000));
    monsters[i] = new Monster(0.5, 32, rand1, rand2);
  }//end for
  
  for (int i = 0; i < monsters.length; i++){
    monsterLifebar[i] = new Lifebar(monsters[i].xPos-10, monsters[i].yPos-10, monsters[i].xPos+10, monsters[i].yPos-5,50,50);
  }//end for
  
  for (int i = 0; i< lights.length; i++){
    lights[i] = new Light(0,0,200,200);
  }//end for
  
  //temp = new Monster (3, 64);
  
}//end of setup
