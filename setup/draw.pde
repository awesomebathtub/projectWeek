float xx = 0;

void draw(){

  //OPENING SCREEN CODE BEGINS HERE**********************************************
  if(gameRunning == false){
    background(40,170,40);
    
    /*********************************************/
    for (int i = 0; i < flowers.length; i++){
        flowershadows[i].display();
        flowers[i].display();
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
    /*********************************************/  
    
    image(titleScreen, 0, 0);
    music.play();
    
    textSize(30);
    textAlign(CENTER,CENTER);
    if(xx <= 601){
      image(tomahawk, xx, 500);
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
      if(keyPressed && (key == ' ')){
        gameRunning = true;
        music.close();
        minim.stop();
      }//end of if keyPressed
      
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
        flowershadows[i].display();
        flowers[i].display();
       
      
      }
      //END DISPLAY FLOWERS
      //BEGIN REFRESH PLAYER HP BAR
      playerLifebar.xPos1 = player.xPos-50;
      playerLifebar.yPos1 = player.yPos+250; 
      playerLifebar.yPos2 = player.yPos+255;
      //END REFRESH PLAYER HP BAR
      
      //WHILE MONSTERS ARE LIVING DISPLAY THEM AND INITIALIZE THE HIT MODULE
      for (int i = 0; i < monsters.length; i++){
        
        if (monsters[i].living == true){
          monsters[i].display();
          monsters[i].hit();
        }
        
      }
      //PATROL FUNCTIONS
      for(int i = 0; i<monsters.length; i++){
        if (monsters[i].living == true){
          monsters[i].patrol(monsters[i].initxPos,monsters[i].inityPos,200,200);
        }
      }
      /*if (monsters[0].living == true){ 
        monsters[0].patrol(0,0,200,150);
      } 
      if (monsters[1].living == true){
        monsters[1].patrol(300,300,200,150);
      }
      if (monsters[2].living == true){
        monsters[2].patrol(500,500,100,100);
      }*/

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
      /*for (int i = 0; i < monsters.length; i++){
        if (monsters[i].living == true){
          image(monsterSprite,monsters[i].xPos,monsters[i].yPos);
        }
      }
      */
      //end gameState == true
      
      //BEGIN DEATH      
      if(playerLifebar.health <= 0){
        playerAlive = false;
      }//end if playerLifebar
      
      player.display();
      
      //BEGIN DISPLAY LIGHTS
      /*for ( int i = 0; i < lights.length; i++){
        
        lights[i].on();
      }*/
      //END DISPLAY LIGHTS

     // if(playerLifebar.xPos1 !=
       
      //BEGIN DISPLAY FENCES
      for (int i = 0; i < fences.length; i++){
        
        fences[i].display();
      }
      //END DISPLAY FENCES
      
      //BEGI NDISPLAY CLOUD SHADOWS (separate from display clouds so the shadows go behind the trees when necessary)
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
      
      //BEGIN DISPLAY TREES
      for (int i = 0; i < trees.length; i++){
        
        trees[i].display();
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
      
      //reticle.display();
      
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
      noLoop();
    }//END IF PLAYERALIVE == FALSE
  }//END IF GAME RUNNING
}//END DRAW
