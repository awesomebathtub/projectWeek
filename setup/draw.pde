float xx = 0;

void draw(){

  //OPENING SCREEN CODE BEGINS HERE**********************************************
  if(gameRunning == false){
    background(40,170,40);
    
    for (int i = 0; i < flowers.length; i++){
        flowershadows[i].display();
        flowers[i].display();
      }
    for(int i =0; i< ponds.length; i++){
      ponds[i].display();
    }
    for (int i = 0; i < rocks.length; i++){
      rocks[i].display();
    }
    for (int i = 0; i < trees.length; i++){
        
        trees[i].display();
      }
    for (int i = 0; i < fences.length; i++){
        
        fences[i].display();
      }
    for (int i = 0; i < clouds.length; i++){
        
        clouds[i].display();
        if(clouds[i].xPos <= 10000){
        clouds[i].xPos = clouds[i].xPos + clouds[i].speed;
        }
    else{
          clouds[i].xPos = -5000;
        }
      } 
    
    image(titleScreen, 0, 0);
    
    
    textSize(30);
    textAlign(CENTER,CENTER);
    if(xx <= 601){
      if(eqWep == "Tomahawk"){
      image(tomahawkGif, xx, 500);
      }
      if(eqWep == "Sword"){
      image(swordGif, xx, 500);
      }
      xx+=1;
    }else{
      xx=0;
    }
    
    fill(0);
    textSize(10);
    text("© Alec Ray 2013", width-43, height-10);
    
    textSize(20);
    fill(255);
    text("Press Space to Play", (width/2)+2, 501);
    fill(0);
    text("Press Space to Play", width/2, 500);
    translate(10,0);      
  }//end gamestate
  
  //GAME SCREEN CODE BEGINS HERE**************************************************
  
  if(gameRunning == true){
    if(playerAlive == true){
      
      background(40,170,40);
      
      player.move();
      
      
      for (int i = 0; i < walls.length; i++){
        
        walls[i].hit();//initialize wall collision
        
      }
      player.follow();
      //MONSTER PATROL DISPLAY HIT & LIFEBAR DISPLAY
      for (int i = 0; i < monsters.length; i++){
        
        if (monsters[i].living == true){
          monsters[i].patrol(monsters[i].initxPos,monsters[i].inityPos,200,200);
          monsters[i].display();
          monsters[i].hit();
          monsterLifebar[i].display();    
          monsterLifebar[i].xPos1 = monsters[i].xPos - 10;
          monsterLifebar[i].yPos1 = monsters[i].yPos - 10;
          monsterLifebar[i].yPos2 = monsters[i].yPos - 5;
        }
      }

      //MONSTER DEATH
      for (int i = 0; i < monsters.length; i++){
        if (monsterLifebar[i].health <= 0){
          monsters[i].death(i);
        }//end if
      }//end for
      
      for (int i = 0; i < bullets.size(); i++){//constructs a dynamic list of bullets
        Bullet bullet = (Bullet) bullets.get(i); //casts the ArrayList slots to the type Bullet
       
        bullet.display();
        bullet.shoot();
        
        if (bullet.hit == true || bullet.xPos > player.xPos + width/2 || bullet.xPos < player.xPos - width/2 || bullet.yPos > player.yPos + height/2 || bullet.yPos < player.yPos - height/2){
        //removes bullets when they hit an object or leave the screen
          
          bullets.remove(i);
        }//end if
      }//end list constructor
      
      //BEGIN DISPLAY WALLS
      for (int i = 0; i < walls.length; i++){
        walls[i].display();//display walls
      }

      //BEGIN DISPLAY FLOWERS
      for (int i = 0; i < flowers.length; i++){
        flowershadows[i].display();
        flowers[i].display(); 
      }
      
      //BEGIN REFRESH PLAYER HP BAR
      playerLifebar.xPos1 = player.xPos-50;
      playerLifebar.yPos1 = player.yPos+250; 
      playerLifebar.yPos2 = player.yPos+255;

      //BEGIN LEVEL UP
      if(playerXP.XP >=100){
        playerXP.XP = playerXP.XP - 100;
        playerLevel.level = playerLevel.level + 1;
      }
      //END LEVEL UP
      
      for(int i =0; i< ponds.length; i++){
      ponds[i].display();
      }
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
            
      //BEGIN DEATH      
      if(playerLifebar.health <= 0){
        playerAlive = false;   
        player.ammo = 20;     
      }//end if playerLifebar
      
      player.display();
      
      //BEGIN DISPLAY FENCES
      for (int i = 0; i < fences.length; i++){
        
        fences[i].display();
      }
      //END DISPLAY FENCES
      //BEGIN DISPLAY WEAPON BOXES
      for (int i = 0; i < weaponBoxes.length; i++){
        
        weaponBoxes[i].display();
        weaponBoxes[i].pickUp();
      }
      //BEGIN DISPLAY CLOUD SHADOWS (separate from display clouds so the shadows go behind the trees when necessary)
      for (int i = 0; i < cloudshadows.length; i++){
        
        cloudshadows[i].display();
        if(clouds[i].xPos <= 10000){
        cloudshadows[i].xPos = cloudshadows[i].xPos + cloudshadows[i].speed;
        }
        else{
          cloudshadows[i].xPos = -5000;
        }
      }
      //END DISPLAY CLOUD SHADOWS
      for (int i = 0; i < rocks.length; i++){
        rocks[i].display();
      }
      //BEGIN DISPLAY TREES
      for (int i = 0; i < trees.length; i++){
        
        trees[i].display();
      }
      for (int i = 0; i < healthboosts.length; i++){
        healthboosts[i].display();
        healthboosts[i].pickUp();
      }
      //END DISPLAY TREES
      
      //BEGIN DISPLAY CLOUDS (separate from display cloud shadows so the shadows go behind the trees when necessary)
      for (int i = 0; i < clouds.length; i++){
        
        clouds[i].display();
        if(clouds[i].xPos <= 10000){
        clouds[i].xPos = clouds[i].xPos + clouds[i].speed;
        }
        else{
          clouds[i].xPos = -5000;
        }
      }
      //END DISPLAY CLOUDS
      
      
      //ALWAYS MAKE THIS DISPLAY LAST SO IT'S ON TOP OF EVERYTHING ELSE
      playerLevel.display(); //display player level
      playerXP.display(); //display player xp
      playerLifebar.display();//DISPLAY THE PLAYER LIFEBAR
      player.ammoDisplay();
      player.monsterKillsDisplay();
      
      if (player.ammo == 0) {
    image(noMoreTomahawks, player.xPos-300,player.yPos-300);    
    noMoreTomahawks.noLoop();
  }
  }//END IF PLAYERALIVE == TRUE
  
    if(playerAlive == false){
      background(0);
      textAlign(CENTER);
      fill(255);
      textSize(20);
      translate(-player.countX,-player.countY);
      text("GAME OVER", width/2, height/2);
      text ("PRESS R TO RESTART", width/2, height/2 + 18);
      noLoop();
    }//END IF PLAYERALIVE == FALSE
  }//END IF GAME RUNNING
}//END DRAW
