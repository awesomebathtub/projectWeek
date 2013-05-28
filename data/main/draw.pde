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
    text("PRESS SPACE TO PLAY", (width/2)-2, (height/2)-2);
    fill(255);
    text("PRESS SPACE TO PLAY", width/2, height/2);
    
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
    
      if(keyPressed && (key == ' ')){
        gameRunning = true;
        music.close();
        minim.stop();
      }//end of if mousePressed
      
  }//end gameState == 0
  //OPENING SCREEN CODE ENDS HERE**************************************************
  
  boolean playerAlive = true;
  
  //GAME SCREEN CODE BEGINS HERE**************************************************
  if(gameRunning == true){
    if(playerAlive == true){
      background(0);
     
                 
      //translates screen based on change in player.xPos and .yPos
      translate (player.countX, player.countY);
      image(ground_1,-200,-200);

      for (int i = 0; i < bullets.size(); i++){//constructs a dynamic list of bullets
        
        Bullet bullet = (Bullet) bullets.get(i); //casts the ArrayList slots to the type Bullet
        
        bullet.display();
        bullet.shoot();
        
        if (bullet.xPos < -1000 || bullet.xPos > width+1000 || bullet.yPos < -1000 || bullet.yPos > height+1000 || bullet.hit == true){//removes bullets when they leave the screen
          
          bullets.remove(i);
          
        }//end if
      
      }//end list constructor
      
      player.tempX = player.xPos;
      player.tempY = player.yPos;  
      
      player.move();          
      
      //BEGIN DISPLAY WALLS
      for (int i = 0; i < walls.length; i++){
        
        walls[i].hit();
        walls[i].display();
        
      }
      //END DISPLAY WALLS
            
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
      if (monsters[1].living == true){
        monsters[1].patrol(300,300,200,150);
      }
      if (monsters[2].living == true){
        monsters[2].patrol(500,500,100,100);
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
      
      //BEGIN MONSTER DEATH
      for (int i = 0; i < monsters.length; i++){
          
        if (monsterLifebar[i].health <= 0){
            
          monsters[i].death(i);
            
        }//end if
      }//end for
      //END MONSTER DEATH
      
      //BEGIN DISPLAY WALLS
      for (int i = 0; i < walls.length; i++){
        
        walls[i].display();
        
      }
      //END DISPLAY WALLS
      
      //BEGIN LEVEL UP
      if(playerXP.XP >=100){
        playerXP.XP = playerXP.XP - 100;
        playerLevel.level = playerLevel.level + 1;
      }
      //END LEVEL UP
      
      //calculates change between player.xPos and .yPos
      player.countX -= (player.xPos - player.tempX);
      player.countY -=(player.yPos - player.tempY);
      
      
      for (int i = 0; i < monsters.length; i++){
        if (monsters[i].living == true){
          image(monsterSprite,monsters[i].xPos,monsters[i].yPos);
        }
      }
      
      
      //end gameState == true
      
      //BEGIN DEATH      
      if(playerLifebar.health <= 0){
        playerAlive = false;
      }//end if playerLifebar
      
      player.display();
      
  }//END IF PLAYERALIVE == TRUE
  
    if(playerAlive == false){
      background(0);
      textAlign(CENTER);
      fill(255);
      textSize(20);
      translate(-player.countX,-player.countY);
      text("GAME OVER", width/2, height/2);
      noLoop();
    }//END IF PLAYERALIVE == FALSE
  }//END IF GAME RUNNING
}//END DRAW
