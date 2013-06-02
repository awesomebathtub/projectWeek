//IMPORT********************
import ddf.minim.*;
import gifAnimation.*;

//IMAGE DECLARE*************
PImage loadScreen;

PImage wall_1;

PImage monsterSprite;

PImage tree_1;
PImage flower_1;
PImage fence_1; 

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

Lifebar playerLifebar;

Lifebar[] monsterLifebar = new Lifebar[monsters.length];

Tree[] trees = new Tree[50];

Flower[] flowers = new Flower[50];

Wall[] walls = new Wall[100];

Fence[] fences = new Fence[50];

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
  
  monsterSprite = loadImage("gfx/enemy/monsterSprite.gif");
 
  tree_1 = loadImage("gfx/textures/tree_1.gif");
  
  flower_1 = loadImage("gfx/textures/flower_1.gif");
  
  fence_1 = loadImage("gfx/textures/fence_1.gif");
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
  for (int i = 0; i < fences.length; i++){
    fences[i] = new Fence (0 + (i*32), 0);
    walls[i+50] = new Wall (fences[i].xPos, fences[i].yPos + 10, fences[i].xPos+32, fences[i].yPos + 20);
  }
  for (int i = 0; i < flowers.length; i++){
    int rand1 = int(random(-1000,1000));
    int rand2 = int(random(-1000,1000));
    flowers[i] = new Flower (rand1, rand2);
  }
  for (int i = 0; i < trees.length; i++){
    int rand1 = int(random(-1000,1000));
    int rand2 = int(random(-1000,1000));
    trees[i] = new Tree (rand1, rand2);
    walls[i] = new Wall (trees[i].xPos+20, trees[i].yPos+90, trees[i].xPos+100, trees[i].yPos+100);
  }
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
