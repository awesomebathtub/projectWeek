void keyTyped (){
 
}//end keyTyped

void keyPressed () {
  
  if(key == 'w' || key == 'W'){
    up = true;}
  if(key == 'a' || key == 'A'){
    left = true;}
  if(key == 's' || key == 'S'){
    dn = true;}
  if(key == 'd' || key == 'D'){
    right = true;}
    
}//end of keyPressed

void keyReleased () {
  
  if(key == 'w' || key == 'W'){
    up = false;}
  if(key == 'a' || key == 'A'){
    left = false;}
  if(key == 's' || key == 'S'){
    dn = false;}
  if(key == 'd' || key == 'D'){
    right = false;}
      
}//end of keyReleased

void mouseReleased (){
  
  bullets.add (new Bullet (10));
  bulletSound = bulletMinim.loadFile("laser_bullet.mp3");
  bulletSound.play();
  
}//end mouseReleased
