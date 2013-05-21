void draw(){

  //OPENING SCREEN CODE BEGINS HERE**********************************************
  if(gameRunning == false){
    background(0);
    image(loadScreen, 0, 0);
    music.play();
    
    textSize(30);
    textAlign(CENTER,CENTER);
    
    fill(0);
    text("SPACE-SHOOTER", (width/2)-2,(height/6)-2);
    fill(255);
    text("SPACE-SHOOTER", width/2,height/6);
    
    fill(0);
    text("DUNGEON-CRAWLER", (width/2)-2, (height/6)+28);
    fill(255);
    text("DUNGEON-CRAWLER", width/2, (height/6)+30);
    
    fill(0);
    text("MONSTER-KILLER GAME", (width/2)-2, (height/6)+58);
    fill(255);
    text("MONSTER-KILLER GAME", width/2, (height/6)+60);
    
    fill(0);
    text("CLICK TO PLAY", (width/2)-2, (height/2)-2);
    fill(255);
    text("CLICK TO PLAY", width/2, height/2);
    
    fill(0);
    textSize(20);
    rotate(-0.5);
    text("MUSIC BY LIDSKY",348,398);
    fill(255,255,0);
    text("MUSIC BY LIDSKY",350,400);
    
    textSize(10);
    fill(255);
    rotate(0.5);
    text("Created by Alec Ray and Julian Bloch", width/2,550);
    
      if(mousePressed && (mouseButton == LEFT)){
        gameRunning = true;
        music.close();
        minim.stop();
      }//end of if mousePressed
  }//end gameState == 0
  //OPENING SCREEN CODE ENDS HERE**************************************************
  
  //GAME SCREEN CODE BEGINS HERE**************************************************
  if(gameRunning == true){
  background(255);
    
  //sets up a temp variable to measure change in player.xPos and .yPos
  player.tempX = player.xPos;
  player.tempY = player.yPos;
        
  //translates screen based on change in player.xPos and .yPos
  translate (player.countX, player.countY);
  
  for (int i = 0; i < bullets.size(); i++){//constructs a dynamic list of bullets
    
    Bullet bullet = (Bullet) bullets.get(i); //casts the ArrayList slots to the type Bullet
    
    bullet.display();
    bullet.shoot();
    
    if (bullet.xPos < 0 || bullet.xPos > width || bullet.yPos < 0 || bullet.yPos > height || bullet.hit == true){//removes bullets when they leave the screen
      
      bullets.remove(i);
      
    }//end if
  
  }//end list constructor
    
  player.move();
  player.display();
  
  //BEGIN REFRESH PLAYER HP BAR
  playerLifebar.xPos1 = player.xPos-50;
  playerLifebar.yPos1 = player.yPos+250; 
  playerLifebar.yPos2 = player.yPos+255;
  //END REFRESH PLAYER HP BAR
  
  playerLifebar.display();
  
  for (int i = 0; i < monsters.length; i++){
    
    if (monsters[i].living == true){
      monsters[i].display();
      monsters[i].hit();
    }
    
  }
  
  if (monsters[0].living == true){
    monsters[0].patrol(0,0,200,150);
  }
  
  playerLevel.display();
  playerXP.display();
  
  //DISPLAY MONSTER LIFEBAR
  
  for (int i = 0; i < monsters.length; i++){
    
    if (monsters[i].living == true){
      
      monsterLifebar[i].display();    
      monsterLifebar[i].xPos1 = monsters[i].xPos - 10;
      monsterLifebar[i].yPos1 = monsters[i].yPos - 15;
      monsterLifebar[i].yPos2 = monsters[i].yPos - 5;
    
    }
  
  }
  
  //monster death
  for (int i = 0; i < monsters.length; i++){
      
    if (monsterLifebar[i].health <= 0){
        
      monsters[i].death(i);
        
    }
      
  }
  //TESTING PLAYER POSITION
  //text(player.xPos,300,300);
  //text(player.yPos,300,320);
  
  //DISPLAY WALLS
  for (int i = 0; i < walls.length; i++){
    
    walls[i].display();
    walls[i].hit();
    
  }
  if(playerXP.XP >=100){
    playerXP.XP = playerXP.XP - 100;
    playerLevel.level = playerLevel.level + 1;
  }
  
  //calculates change between player.xPos and .yPos
  player.countX -= (player.xPos - player.tempX);
  player.countY -= (player.yPos - player.tempY);
  
  }//end gameState == 1
  //GAME SCREEN CODE ENDS HERE*******************************************************
}
