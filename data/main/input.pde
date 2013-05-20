void keyTyped (){
 
}//end keyTyped

void keyPressed () {
  
  if(key == 'w'){
    up = true;}
  if(key == 'a'){
    left = true;}
  if(key == 's'){
    dn = true;}
  if(key == 'd'){
    right = true;}
    
}//end of keyPressed

void keyReleased () {
  
  if(key == 'w'){
    up = false;}
  if(key == 'a'){
    left = false;}
  if(key == 's'){
    dn = false;}
  if(key == 'd'){
    right = false;}
      
}//end of keyReleased

void mouseReleased (){
  
  bullets.add (new Bullet (player.xPos, player.yPos, 20));
  bulletSound = bulletMinim.loadFile("laser_bullet.mp3");
  bulletSound.play();
  
}//end mouseReleased
