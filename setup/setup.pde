//IMPORT********************
import gifAnimation.*;

//IMAGE DECLARE*************
BufferedReader reader;
int monsterKills = 0;
String loaded;

String eqWep = "Tomahawk";

PImage loadScreen;

PImage monster_1;

PImage fence_1;
PImage reticleImg;
PImage tree_1;
PImage weaponBox;
PImage rock_1;
PImage pond_1;

PImage[] noMoreTomahawks_PImage;
PImage[] titleScreen_PImage;

/*********WEAPON PIMAGES*****/
PImage[] tomahawk_PImage;
PImage[] sword_PImage;
PImage[] hammer_PImage;
PImage[] harpoon_PImage;
PImage[] spear_PImage;
PImage[] axe_PImage;
PImage[] mace_PImage;
/****************************/
PImage[] healthBoost_PImage;
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

/********WEAPON GIFS*******/
Gif tomahawkGif;
Gif swordGif;
Gif hammerGif;
Gif harpoonGif;
Gif spearGif;
Gif axeGif;
Gif maceGif;
/**************************/

Gif cloud_1;
Gif flower_1;

Gif noMoreTomahawks;
Gif titleScreen;

Gif healthBoostGif;

//PLAYER DECLARE************
Player player;

ArrayList bullets;

Monster[] monsters = new Monster[200];

Monster temp;

Lifebar playerLifebar;

Lifebar[] monsterLifebar = new Lifebar[monsters.length];

Tree[] trees = new Tree[1000];

Flower[] flowers = new Flower[1000];
FlowerShadow[] flowershadows = new FlowerShadow[flowers.length];

Wall[] walls = new Wall[2050];

Rock[] rocks = new Rock[500];

WeaponBox[] weaponBoxes = new WeaponBox[10];

Fence[] fences = new Fence[500];

Cloud[] clouds = new Cloud[500];
CloudShadow [] cloudshadows = new CloudShadow[clouds.length];

Pond[] ponds = new Pond[50];

HealthBoost[] healthboosts = new HealthBoost[20];

Expbar playerXP;
Level playerLevel;

boolean gameRunning = false;
boolean playerAlive;

int playerMovement = 0;

Weapon tomahawk;
Weapon sword;
Weapon hammer;
Weapon harpoon;
Weapon spear;
Weapon axe;
Weapon mace;

// 0 = stopped
// 1 = up
// 2 = left
// 3 = down
// 4 = right

void setup(){
  size(600,600);
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
  
  rock_1 = loadImage("gfx/textures/rock_1.gif");
  
  pond_1 = loadImage("gfx/textures/pond_1.gif");
  
  weaponBox = loadImage("gfx/textures/weaponBox.gif");
  
  cloud_1 = new Gif(this, "gfx/textures/cloud_1.gif");
  cloud_1.loop();
  cloud_1PImage = Gif.getPImages(this, "gfx/textures/cloud_1.gif");
   
  flower_1 = new Gif(this, "gfx/textures/flower_1.gif");
  flower_1.loop();
  flower_1PImage = Gif.getPImages(this, "gfx/textures/flower_1.gif");
  
  
  /**************************WEAPON GIFS LOAD***********************/
  tomahawkGif = new Gif(this, "gfx/weapons/tomahawk.gif");
  tomahawkGif.loop();
  tomahawk_PImage = Gif.getPImages(this, "gfx/weapons/tomahawk.gif");
  
  swordGif = new Gif(this, "gfx/weapons/sword.gif");
  swordGif.loop();
  sword_PImage = Gif.getPImages(this, "gfx/weapons/sword.gif");
  
  hammerGif = new Gif(this, "gfx/weapons/hammer.gif");
  hammerGif.loop();
  hammer_PImage = Gif.getPImages(this, "gfx/weapons/hammer.gif");
  
  harpoonGif = new Gif(this, "gfx/weapons/harpoon.gif");
  harpoonGif.loop();
  harpoon_PImage = Gif.getPImages(this, "gfx/weapons/harpoon.gif");
  
  spearGif = new Gif(this, "gfx/weapons/spear.gif");
  spearGif.loop();
  spear_PImage = Gif.getPImages(this, "gfx/weapons/spear.gif");
  
  axeGif = new Gif(this, "gfx/weapons/axe.gif");
  axeGif.loop();
  axe_PImage = Gif.getPImages(this, "gfx/weapons/axe.gif");
  
  maceGif = new Gif(this, "gfx/weapons/mace.gif");
  maceGif.loop();
  mace_PImage = Gif.getPImages(this, "gfx/weapons/mace.gif");
  /*****************************************************************/
  
  
  noMoreTomahawks = new Gif(this, "gfx/textures/nomo.gif");
  noMoreTomahawks.loop();
  tomahawk_PImage = Gif.getPImages(this, "gfx/textures/nomo.gif");
  
  healthBoostGif = new Gif(this, "gfx/textures/HealthBoost.gif");
  healthBoostGif.loop();
  healthBoost_PImage = Gif.getPImages(this, "gfx/textures/HealthBoost.gif");

  titleScreen = new Gif(this, "gfx/textures/tomahawk_tosser_title.gif");
  
  
  //*****************************END LOAD IMAGES*********************
  
  frameRate(60);
  
  bullets = new ArrayList(0);
  
  player = new Player(300,300,2,50);
  playerLifebar = new Lifebar(player.xPos-50, player.yPos+250, player.xPos+50, player.yPos-250, 100,100);
  playerXP = new Expbar();
  playerLevel = new Level(1);
  /*********************WEAPON DECLARATION********************/
  tomahawk = new Weapon(10, 30, "tomahawkGif");
  sword = new Weapon(15, 25, "swordGif");
  hammer = new Weapon(18, 18, "hammerGif");
  harpoon = new Weapon(30,10, "harpoonGif");
  spear = new Weapon(5,50, "spearGif");
  axe = new Weapon(20, 15, "axeGif");
  mace = new Weapon(25, 10, "maceGif");
  /***********************************************************/
  for (int i = 0; i < healthboosts.length; i++){
    int rand1 = int(random(-5000,5000));
    int rand2 = int(random(-5000,5000));
    healthboosts[i] = new HealthBoost(rand1, rand2);
  }
  for(int i = 0; i < ponds.length; i++){
    int rand1 = int(random(-5000,5000));
    int rand2 = int(random(-5000,5000));
    ponds[i] = new Pond(rand1, rand2);
    walls[i+2000] = new Wall(ponds[i].xPos, ponds[i].yPos, ponds[i].xPos+400, ponds[i].yPos + 400);
  }
  for (int i = 0; i < clouds.length; i++){
    int rand1 = int(random(-5000,5000));
    int rand2 = int(random(-5000,5000));
    float rand3 = random(0,1);
    clouds[i] = new Cloud (rand1,rand2,rand3);
    cloudshadows[i] = new CloudShadow (rand1+50,rand2+100,rand3);
  }
  for (int i = 0; i < fences.length; i++){
    int rand1 = int(random(-5000,5000));
    int rand2 = int(random(-5000,5000));
    fences[i] = new Fence (rand1, rand2);
    walls[i] = new Wall(fences[i].xPos, fences[i].yPos + 10, fences[i].xPos+32, fences[i].yPos + 20);
  }
  for (int i = 0; i < flowers.length; i++){
    int rand1 = int(random(-5000,5000));
    int rand2 = int(random(-5000,5000));
    flowers[i] = new Flower (rand1, rand2);
    flowershadows[i] = new FlowerShadow (rand1+20, rand2+27);
  }
  for (int i = 0; i < rocks.length; i++){
    int rand1 = int(random(-5000,5000));
    int rand2 = int(random(-5000,5000));
    rocks[i] = new Rock(rand1, rand2);
    walls[i+1500] = new Wall (rocks[i].xPos, rocks[i].yPos, rocks[i].xPos+32, rocks[i].yPos+32);
  }
  for (int i = 0; i < trees.length; i++){
    int rand1 = int(random(-5000,5000));
    int rand2 = int(random(-5000,5000));
    trees[i] = new Tree (rand1, rand2);
    walls[i+500] = new Wall (trees[i].xPos+20, trees[i].yPos+90, trees[i].xPos+100, trees[i].yPos+100);
  }
  for (int i = 0; i < monsters.length; i++){
    int rand1 = int(random(-5000,5000));
    int rand2 = int(random(-5000,5000));
    monsters[i] = new Monster(0.5, 32, rand1, rand2);
  }//end for
  
  for (int i = 0; i < monsters.length; i++){
    monsterLifebar[i] = new Lifebar(monsters[i].xPos-10, monsters[i].yPos-10, monsters[i].xPos+10, monsters[i].yPos-5,50,50);
  }//end for
  
  for (int i = 0; i< lights.length; i++){
    lights[i] = new Light(0,0,200,200);
  }//end for
  for (int i = 0; i < weaponBoxes.length; i++){
    int rand1 = int(random(-2000,2000));
    int rand2 = int(random(-2000,2000));
    weaponBoxes[i] = new WeaponBox(rand1, rand2);
  }
}//end of setup
