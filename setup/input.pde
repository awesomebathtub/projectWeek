void keyTyped () {
}//end keyTyped

void keyPressed () {

  if (key == 'w' || key == 'W') {
    up = true;
    playerMovement = 1;
  }
  if (key == 'a' || key == 'A') {
    left = true;
    playerMovement = 2;
  }
  if (key == 's' || key == 'S') {
    dn = true;
    playerMovement = 3;
  }
  if (key == 'd' || key == 'D') {
    right = true;
    playerMovement = 4;
  }
  if (key == 'k' || key == 'K'){
    for(int i=0; i<monsters.length; i++){
    monsters[i].living = false;
    }
  }
}//end of keyPressed

void keyReleased () {

  if (key == 'w' || key == 'W') {
    up = false;
    playerMovement = 0;
  }
  if (key == 'a' || key == 'A') {
    left = false;
    playerMovement = 0;
  }
  if (key == 's' || key == 'S') {
    dn = false;
    playerMovement = 0;
  }
  if (key == 'd' || key == 'D') {
    right = false;
    playerMovement = 0;
  }
}//end of keyReleased

void mouseReleased () {

  if (player.ammo > 0) {
    bullets.add (new Bullet (10));
    bulletSound = bulletMinim.loadFile("sfx/tomahawkWoosh.mp3");
    bulletSound.play();
    player.ammo-=1;
  }
}//end mouseReleased

