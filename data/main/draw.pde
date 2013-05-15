void draw(){
  
  background(255);
  
  for (int i = 0; i < bullets.size(); i++){
    
    Bullet bullet = (Bullet) bullets.get(i);
    
    bullet.display();
    bullet.shoot();
    
    if (bullet.xPos < 0 || bullet.xPos > width || bullet.yPos < 0 || bullet.yPos > height){
      
      bullets.remove(i);
      
    }//end if
  
  }//end list constructor
  
  for (int i = 0; i < monsters.length; i++){
    
    monsters[i].display();
    monsters[i].hit();
    
  }
  
  monsters[0].patrol(0,0,200,150);
  
  player.display();
  player.move();
  
  playerLifebar.display();
  
  for (int i = 0; i < walls.length; i++){
    
    walls[i].display();
    walls[i].hit();
    
  }
  
}
