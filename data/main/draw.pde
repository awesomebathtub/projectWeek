void draw(){
  
  background(255);
  
  player.move();
  player.display();
  
  for (int i = 0; i < bullets.size(); i++){//constructs a dynamic list of bullets
    
    Bullet bullet = (Bullet) bullets.get(i); //sets the ArrayList slots to the type Bullet
    
    bullet.display();
    bullet.shoot();
    
    if (bullet.xPos < 0 || bullet.xPos > width || bullet.yPos < 0 || bullet.yPos > height){//removes bullets when they leave the screen
      
      bullets.remove(i);
      
    }//end if
  
  }//end list constructor
  
  for (int i = 0; i < monsters.length; i++){
    
    monsters[i].display();
    monsters[i].hit();
    
  }
  
  monsters[0].patrol(0,0,200,150);
  
  playerLifebar.display();
  
  for (int i = 0; i < walls.length; i++){
    
    walls[i].display();
    walls[i].hit();
    
  }
  
}
