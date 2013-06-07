void keyTyped() {

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
  if(playerAlive == false && (key == 'r' || key == 'R')){
    gameRunning = false;
    playerAlive = true;
    loop ();
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
  if(playerAlive == false && (key == 'r' || key == 'R')){
    gameRunning = false;
    loop ();
  }
  if(key == 'z' || key == 'Z'){
    String pxp = str(player.xPos);
    String pyp = str(player.yPos);
    String pll = str(playerLevel.level);
    String plh = str(playerLifebar.health);
    String pxx = str(playerXP.XP);
    String pa = str(player.ammo);
    String we = eqWep;
    String[] save = {pxp,pyp,pll,plh,pxx,pa,we};
    saveStrings("saves/save.txt", save);
  }
  /*if(key == 'x' || key == 'X' && playerAlive == false){
      reader = createReader("saves/save.txt");
      
      try {
      loaded = reader.readLine();
      } catch (IOException e) {
      e.printStackTrace();
      loaded = null;
      }
      if (loaded == null) {
        // Stop reading because of an error or file is empty
        noLoop();  
      } else {
        String[] pieces = split(loaded, TAB);
        float pxp = int(pieces[0]);
        float pyp = int(pieces[1]);
        int pll = int(pieces[2]);
        float plh = int(pieces[3]);
        float pxx = int(pieces[4]);
        int pa = int(pieces[5]);
        String we = (pieces[6]);
        player.xPos = pxp;
        player.yPos = pyp;
        playerLevel.level = pll;
        playerLifebar.health = plh;
        playerXP.XP = pxx;
        player.ammo = pa;
        eqWep = we;
      }
        
      }
 */
}//end of keyReleased

void mouseReleased () {

  if (player.ammo > 0) {
    bullets.add (new Bullet (10));
    bulletSound = bulletMinim.loadFile("sfx/tomahawkWoosh.mp3");
    bulletSound.play();
    player.ammo-=1;
  }
}//end mouseReleased

