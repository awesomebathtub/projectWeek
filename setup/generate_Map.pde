void keyPressed(){
  if (gameRunning == false && key == ' '){
    
      for (int i = 0; i < clouds.length; i++){
      int rand1 = int(random(-5000,5000));
      int rand2 = int(random(-5000,5000));
      float rand3 = random(0,1);
      clouds[i] = new Cloud (rand1,rand2,rand3);
      cloudshadows[i] = new CloudShadow (rand1+50,rand2+100,rand3);
    }
    for (int i = 0; i < fences.length; i++){
      fences[i] = new Fence (0 + (i*32), 0);
      walls[i] = new Wall (fences[i].xPos, fences[i].yPos + 10, fences[i].xPos+32, fences[i].yPos + 20);
    }
    for (int i = 0; i < flowers.length; i++){
      int rand1 = int(random(-5000,5000));
      int rand2 = int(random(-5000,5000));
      flowers[i] = new Flower (rand1, rand2);
      flowershadows[i] = new FlowerShadow (rand1+20, rand2+27);
    }
    for (int i = 0; i < trees.length; i++){
      int rand1 = int(random(-5000,5000));
      int rand2 = int(random(-5000,5000));
      trees[i] = new Tree (rand1, rand2);
      walls[i+100] = new Wall (trees[i].xPos+20, trees[i].yPos+90, trees[i].xPos+100, trees[i].yPos+100);
    }
    for (int i = 0; i < monsters.length; i++){
      int rand1 = int(random(-5000,5000));
      int rand2 = int(random(-5000,5000));
      monsters[i] = new Monster(0.5,32, rand1, rand2);
    }//end for
    gameRunning = true;
    playerAlive = true;
    playerLifebar.health = playerLifebar.maxHP;
    //music.close();
    minim.stop();
  }//end if
}//end keyTyped
