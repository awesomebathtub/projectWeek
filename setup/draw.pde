void draw(){

  //OPENING SCREEN CODE BEGINS HERE**********************************************
  if(gameRunning == false){
    background(255);
    image(loadScreen, 0, 0);
    music.play();
    
    textSize(30);
    textAlign(CENTER,CENTER);
    
    fill(0);
    textSize(20);
    rotate(-0.5);
    text("MUSIC BY LIDSKY",348,398);
    fill(255,255,0);
    text("MUSIC BY LIDSKY",350,400);
    
    textSize(10);
    fill(0);
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
      background(40,170,40);
          
      player.move();
      player.follow();

      for (int i = 0; i < bullets.size(); i++){//constructs a dynamic list of bullets
        
        Bullet bullet = (Bullet) bullets.get(i); //casts the ArrayList slots to the type Bullet
        
        bullet.display();
        bullet.shoot();
        
        if (bullet.xPos < -1000 || bullet.xPos > width+1000 || bullet.yPos < -1000 || bullet.yPos > height+1000 || bullet.hit == true){//removes bullets when they leave the screen
          
          bullets.remove(i);
          
        }//end if
      
      }//end list constructor
      
      //BEGIN DISPLAY WALLS
      for (int i = 0; i < walls.length; i++){
        
        walls[i].hit();//initialize wall collision
        walls[i].display();//display walls
        
      }
      //END DISPLAY WALLS

      //BEGIN DISPLAY FLOWERS
      for (int i = 0; i < flowers.length; i++){
        
        flowers[i].display();
      
      }
      //END DISPLAY FLOWERS
      //BEGIN REFRESH PLAYER HP BAR
      playerLifebar.xPos1 = player.xPos-50;
      playerLifebar.yPos1 = player.yPos+250; 
      playerLifebar.yPos2 = player.yPos+255;
      //END REFRESH PLAYER HP BAR
      
      playerLifebar.display();//DISPLAY THE PLAYER LIFEBAR
      
      //WHILE MONSTERS ARE LIVING DISPLAY THEM AND INITIALIZE THE HIT MODULE
      for (int i = 0; i < monsters.length; i++){
        
        if (monsters[i].living == true){
          monsters[i].display();
          monsters[i].hit();
        }
        
      }
      //PATROL FUNCTIONS
      if (monsters[0].living == true){ 
        monsters[0].patrol(0,0,200,150);
      } 
      if (monsters[1].living == true){
        monsters[1].patrol(900,900,200,150);
      }
      if (monsters[2].living == true){
        monsters[2].patrol(500,500,100,100);
      }
      
      playerLevel.display(); //display player level
      playerXP.display(); //display player xp
      
      //DISPLAY MONSTER LIFEBAR
      for (int i = 0; i < monsters.length; i++){
        
        if (monsters[i].living == true){
          
          monsterLifebar[i].display();    
          monsterLifebar[i].xPos1 = monsters[i].xPos - 10;
          monsterLifebar[i].yPos1 = monsters[i].yPos - 10;
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
      
      //BEGIN LEVEL UP
      if(playerXP.XP >=100){
        playerXP.XP = playerXP.XP - 100;
        playerLevel.level = playerLevel.level + 1;
      }
      //END LEVEL UP      
      
      //DRAW PLAYER MOVEMENT
      //STOP
      if ( playerMovement == 0 && keyPressed == false){
      image(playerStop, player.xPos, player.yPos);
      }
      //UP
      if ( playerMovement == 1 && keyPressed == true){
       image(playerUp, player.xPos, player.yPos);
      }
      //LEFT
      if ( playerMovement == 2 && keyPressed == true){
         image(playerLeft, player.xPos, player.yPos);
      }
      //DOWN
      if ( playerMovement == 3 && keyPressed == true){
         image(playerDown, player.xPos, player.yPos);
      }
      //RIGHT
      if ( playerMovement == 4 && keyPressed == true){
         image(playerRight, player.xPos, player.yPos);
      }
      //END DRAW PLAYER MOVEMENT
      
      //DRAW MONSTER IMAGE
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
      
      //BEGIN DISPLAY LIGHTS
      for ( int i = 0; i < lights.length; i++){
        
        lights[i].on();
      }
      //END DISPLAY LIGHTS

     // if(playerLifebar.xPos1 !=
       
      //BEGIN DISPLAY FENCES
      for (int i = 0; i < fences.length; i++){
        
        fences[i].display();
      }
      //END DISPLAY FENCES
      
      //BEGIN DISPLAY TREES
      for (int i = 0; i < trees.length; i++){
        
        trees[i].display();
      }
      //END DISPLAY TREES
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
