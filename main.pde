/*
 Authors:
 Morten Bjørn & Jimmy Mikkelsen
 
 Description: 
 Steam Knight is a top down turn-based game, drawing inspiration from old dungeon crawlers.
 The object of the game is to collect enough coins and defeat enough monsters to get a highscore. 
 There are five levels in the game, each with their own theme (forest, dungeon, catacombs, cursed church, hell).
 
 v1.0.2 — DEC 2017
 */

//super important global variables
float tS = 64; //tS = tileSize;
float h = tS/2; //h = half a tileSize;
byte screen = 0;
byte level = 0;
int moves = 0; //consider moving to player class
int score = 0;

//declare important stuff
Player Main;

//declare particles
Particles rain [] = new Particles[600];
Particles embers [] = new Particles[200];

//declare debris
Debris debrisL1 [] = new Debris[26];
Debris debrisL2 [] = new Debris[8];
Debris debrisL3 [] = new Debris[18];
Debris debrisL4 [] = new Debris[13];
Debris debrisL5 [] = new Debris[15];

//declare traps
Trap trapsL1 [] = new Trap[5];
Trap trapsL2 [] = new Trap[3];
Trap trapsL4 [] = new Trap[7];
Trap trapsL5 [] = new Trap[42];

//declare pits
Pit pitsL1 [] = new Pit[3];
Pit pitsL2 [] = new Pit[3];
Pit pitsL3 [] = new Pit[4];
Pit pitsL4 [] = new Pit[16];
Pit pitsL5 [] = new Pit[36];

//declare coins
Coins coinsL1 [] = new Coins[1];
Coins coinsL2 [] = new Coins[2];
Coins coinsL3 [] = new Coins[2];
Coins coinsL4 [] = new Coins[2];
Coins coinsL5 [] = new Coins[5];

//declare mobs
Goon goon1;
Goon goon2;
Goon goon3;
Seeker seeker;
Skeleton skele1;
Skeleton skele2;
Skeleton skele3;
Skeleton skele4;
Wraith wraith;

void setup()
{
  size(1152, 640); //define window size
  
  //load in highscore list
  HiScoreName = loadStrings("hiscorenames.txt");
  scoring = loadStrings("hiscores.txt");
  
  //load in global images
  dungeon = loadImage("assets/dungeon.png");
  menuScreen = loadImage("assets/startScreen.png");

  //declare and set fonts
  bitmapFont = createFont("Pixeled.ttf", 15);
  cleanFont = createFont("Roboto-Medium.ttf", 15);
  textFont(cleanFont);

  //declare sounds
  menu = new SoundFile(this, "0.mp3");
  clik = new SoundFile(this, "clickMenu.wav");
  pres = new SoundFile(this, "letterTick.wav");
  delete = new SoundFile(this, "delete.wav");
  slash = new SoundFile(this, "slash.wav");
  coin = new SoundFile(this, "coin.wav");
  move = new SoundFile(this, "move.wav");
  goonie = new SoundFile(this, "goon.wav");

  //declare particles
  declareParticles(rain, color(3, 74, 236), random(-1, 1), 240, random(-720));
  declareParticles(embers, color(207, 16, 32), random(-10, 10), 20, random(height+50));

  //declare traps for each level
  declareTraps(trapsL1, 0);
  declareTraps(trapsL2, 1);
  declareTraps(trapsL4, 2);
  declareTraps(trapsL5, 3);

  //declare pits for each level
  declarePits(pitsL1, 0);
  declarePits(pitsL2, 1);
  declarePits(pitsL3, 2);
  declarePits(pitsL4, 3);
  declarePits(pitsL5, 4);

  //declare debris for each level
  declareDebris(debrisL1, 0);
  declareDebris(debrisL2, 1);
  declareDebris(debrisL3, 2);
  declareDebris(debrisL4, 3);
  declareDebris(debrisL5, 4);

  //declare coins for each level
  declareCoins(coinsL1, 0);
  declareCoins(coinsL2, 1);
  declareCoins(coinsL3, 2);
  declareCoins(coinsL4, 3);
  declareCoins(coinsL5, 4);

  //declare entities for each level
  Main = new Player();
  goon1 = new Goon(goonPosX[0][0], goonPosY[0][0]);
  goon2 = new Goon(goonPosX[0][1], goonPosY[0][1]);
  goon3 = new Goon(goonPosX[1][0], goonPosY[1][0]);
  skele1 = new Skeleton(skeletonPosX[0][0], skeletonPosY[0][0]);
  skele2 = new Skeleton(skeletonPosX[0][1], skeletonPosY[0][1]);
  skele3 = new Skeleton(skeletonPosX[0][2], skeletonPosY[0][2]);
  skele4 = new Skeleton(skeletonPosX[1][0], skeletonPosY[1][0]);
  seeker = new Seeker(seekerPosX, seekerPosY);
  wraith = new Wraith(wraithPosX, wraithPosY);
}

//declaration functions

void declareCoins (Coins [] x, int y)
{
  for (int i = 0; i < x.length; i++)
  {
    x[i] = new Coins(coinsPosX[y][i], coinsPosY[y][i]);
  }
}

void declareDebris (Debris [] x, int y)
{
  for (int i = 0; i < x.length; i++)
  {
    x[i] = new Debris(debrisPosX[y][i], debrisPosY[y][i]);
  }
}

void declarePits (Pit [] x, int y)
{
  for (int i = 0; i < x.length; i++)
  {
    x[i] = new Pit(pitPosX[y][i], pitPosY[y][i]);
  }
}

void declareTraps (Trap [] x, int y)
{
  for (int i = 0; i < x.length; i++)
  {
    x[i] = new Trap(trapPosX[y][i], trapPosY[y][i]);
  }
}

void declareParticles (Particles [] x, color y, float a, float b, float c)
{
  for (int i = 0; i < x.length; i++)
  {
    x[i] = new Particles(y, a, b, c);
  }
}

void keyPressed()
{
  if (key == CODED && screen == 1)
    move.play();
  {
    if (keyCode == UP)
    {
      if (Main.checkColU() == true || Main.canMoveUp == false)
      {
        //do nothing
      } else
      {
        Main.posY -= tS;
        afterMoves();
      }
    }
    if (keyCode == DOWN)
    {
      if (Main.checkColD() == true || Main.canMoveDown == false)
      {
        //do nothing
      } else
      {
        Main.posY += tS;
        afterMoves();
      }
    }
    if (keyCode == RIGHT)
    {
      if (Main.checkColR() == true || Main.canMoveRight == false)
      {
        //do nothing
      } else
      {
        Main.posX += tS;
        afterMoves();
      }
    }
    if (keyCode == LEFT)
    {
      if (Main.checkColL() == true || Main.canMoveLeft == false)
      {
        //do nothing
      } else
      {
        Main.posX -= tS;
        afterMoves();
      }
    }

    //genereal functions to be executed after moving
    checkConditions(level);
    Main.update();
  } //end key CODED && screen == 1

  if ((key == 'a' || key == 'w' || key == 's' || key == 'd') && screen == 1)
  {
    if (key == 'a')
    {
      Main.attackL(goon1, goon2, goon3, seeker, skele1, skele2, skele3, skele4);
    } else if (key == 'd')
    {
      Main.attackR(goon1, goon2, goon3, seeker, skele1, skele2, skele3, skele4);
    } else if (key == 'w')
    {
      Main.attackU(goon1, goon2, goon3, seeker, skele1, skele2, skele3, skele4);
    } else if (key == 's')
    {
      Main.attackD(goon1, goon2, goon3, seeker, skele1, skele2, skele3, skele4);
    }
    afterMoves();
    checkConditions(level);
    Main.update();
  }

  //this runs whenever a key is pressed, but the functions are reliant on screen == 3
  enterLetters(); //you can find this in the "Navigation" tab
  deleteInput();
  submitName(); //you can find this in the "Navigation" tab
} //end keyPressed

void afterMoves ()
{
  moves ++;
  switch(level) {
  case 0:

    //entity moves
    goon1.move(Main.posX, Main.posY, moves, Main);
    goon1.update();
    goon2.move(Main.posX, Main.posY, moves, Main);
    goon2.update();

    for (int i = 0; i < trapsL1.length; i++)
    {
      trapsL1[i].count();
    }
    
    break;

  case 1:

    //entity moves
    seeker.move(Main.posX, Main.posY, moves);
    seeker.update();
    goon3.move(Main.posX, Main.posY, moves, Main);
    goon3.update();

    //trap progression
    for (int i = 0; i < trapsL2.length; i++)
    {
      trapsL2[i].count();
    }
    
    break;

  case 2:

    skele1.move(Main.posX, Main.posY, moves, Main);
    skele1.update();
    skele1.revive();
    skele2.move(Main.posX, Main.posY, moves, Main);
    skele2.update();
    skele2.revive();
    skele3.move(Main.posX, Main.posY, moves, Main);
    skele3.update();
    skele3.revive();
    break;

  case 3:
    skele4.move(Main.posX, Main.posY, moves, Main);
    skele4.update();
    skele4.revive();
    wraith.move(Main.posX, Main.posY, moves);
    wraith.update();

    for (int i = 0; i < trapsL4.length; i++)
    {
      trapsL4[i].count();
    }
    break;

  case 4:
    for (int i = 0; i < trapsL5.length; i++)
    {
      trapsL5[i].count();
    }
    break;
  }
}

void calcScore()
{
  score = score + round((1+((10-moves)/100)) * ((1+Main.mobKills)*250) + ((1+Main.pickUps)*250)) + (Main.HP*5000);
}


void checkConditions(int l)
{
  switch (l)
  {

    // --------> LEVEL 1 <-------- //
  case 0:
    //check if PLAYER landed in pit
    for (int i = 0; i < pitsL1.length; i++)
    {
      pitsL1[i].checkPlayer(Main);
    }

    //check if something is standing on spikes
    for (int i = 0; i < trapsL1.length; i++)
    {
      trapsL1[i].playerOn(Main);
      trapsL1[i].goonOn(goon1);
      trapsL1[i].goonOn(goon2);
    }

    //check if mobs are dead
    goon1.checkHealth();
    goon2.checkHealth();

    //check if player progressed to next level
    if (Main.posX == (tS*16)+h && Main.posY == (tS*4)+h || Main.posX == (tS*16)+h && Main.posY == (tS*5)+h && level == 0)
    {
      /* calculate score based on enemies slain, number of moves taken and other stuff */
      level = 1;
      calcScore();
      softReset();
    }

    break;

    // --------> LEVEL 2 <-------- //
  case 1:
    //check if PLAYER landed in pit
    for (int i = 0; i < pitsL2.length; i++)
    {
      pitsL2[i].checkPlayer(Main);
    }

    //check if something is standing on spikes
    for (int i = 0; i < trapsL2.length; i++)
    {
      trapsL2[i].playerOn(Main);
      trapsL2[i].goonOn(goon3);
      trapsL2[i].seekerOn(seeker);
    }

    //check mob specific stuff here
    seeker.explode(Main);

    //check if mobs are dead
    seeker.checkHealth();
    goon3.checkHealth();

    //check if player progressed to next level
    if (Main.posX == (tS*16)+h && Main.posY == (tS*8)+h)
    {
      /* calculate score based on enemies slain, number of moves taken and other stuff */
      level++;
      calcScore();
      softReset();
    }

    break;

    // --------> LEVEL 3 <-------- //
  case 2:
    //check if PLAYER landed in pit
    for (int i = 0; i < pitsL3.length; i++)
    {
      pitsL3[i].checkPlayer(Main);
    }

    //check if mobs are dead
    skele1.checkHealth();
    skele2.checkHealth();
    skele3.checkHealth();

    //check if player progressed to next level
    if (Main.posX == (tS*16)+h && Main.posY == (tS*4)+h || Main.posX == (tS*16)+h && Main.posY == (tS*5)+h)
    {
      /* calculate score based on enemies slain, number of moves taken and other stuff */
      level++;
      calcScore();
      softReset();
    }

    break;

    // --------> LEVEL 4 <-------- //
  case 3:
    //check if PLAYER landed in pit
    for (int i = 0; i < pitsL4.length; i++)
    {
      pitsL4[i].checkPlayer(Main);
    }

    //check if something is standing on spikes
    for (int i = 0; i < trapsL4.length; i++)
    {
      trapsL4[i].playerOn(Main);
      trapsL4[i].skeleOn(skele4);
    }

    //check mob specific stuff here
    if (wraith.getX() == Main.posX && wraith.getY() == Main.posY)
    {
      deathStatement = dByWraith;
      screen = 2;
    }

    //check if mobs are dead
    

    //check if player progressed to next level
    if (Main.posX == (tS*16)+h && Main.posY == (tS*4)+h || Main.posX == (tS*16)+h && Main.posY == (tS*5)+h)
    {
      /* calculate score based on enemies slain, number of moves taken and other stuff */
      level++;
      calcScore();
      softReset();
    }

    break;

    // --------> LEVEL 5 <-------- //
  case 4:
    //check if PLAYER landed in pit
    for (int i = 0; i < pitsL5.length; i++)
    {
      pitsL5[i].checkPlayer(Main);
    }

    //check if something is standing on spikes
    for (int i = 0; i < trapsL5.length; i++)
    {
      trapsL5[i].playerOn(Main);
    }

    //check mob specific stuff here
    //...

    //check if player progressed to next level
    if ((Main.posX == (tS*16)+h && Main.posY == (tS*4)+h) || (Main.posX == (tS*16)+h && Main.posY == (tS*5)+h))
    {
      calcScore();
      softReset();
      screen = 3;
    }

    break;
  }
  
  //do this regardless of level
  Main.checkHealth();
}

void hardReset()
{
  moves = 0;
  score = 0;
  level = 0;
  Main.reset();
  Main.setStartPos();
  deathStatement = defaultDeathStatement;

  //reset status of all mobs
  goon1.reset();
  goon2.reset();
  goon3.reset();
  skele1.reset();
  skele2.reset();
  skele3.reset();
  skele4.reset();
  seeker.reset();
  wraith.reset();

  //activate all coins
  for (int i = 0; i < coinsL1.length; i++)
  {
    coinsL1[i].active = true;
  }
  for (int i = 0; i < coinsL2.length; i++)
  {
    coinsL2[i].active = true;
  }
  for (int i = 0; i < coinsL3.length; i++)
  {
    coinsL3[i].active = true;
  }
  for (int i = 0; i < coinsL4.length; i++)
  {
    coinsL4[i].active = true;
  }
  for (int i = 0; i < coinsL5.length; i++)
  {
    coinsL5[i].active = true;
  }

  //shuffle all trapCounter values
  for (int i = 0; i < trapsL1.length; i++)
  {
    trapsL1[i].trapCounter = byte(round(random(2)));
  }
  for (int i = 0; i < trapsL2.length; i++)
  {
    trapsL2[i].trapCounter = byte(round(random(2)));
  }
  for (int i = 0; i < trapsL4.length; i++)
  {
    trapsL4[i].trapCounter = byte(round(random(2)));
  }
  for (int i = 0; i < trapsL5.length; i++)
  {
    trapsL5[i].trapCounter = byte(round(random(2)));
  }
}

void softReset()
{
  moves = 0;
  Main.reset();
  Main.setStartPos();
  deathStatement = defaultDeathStatement;

  //reset status of all mobs
  goon1.reset();
  goon2.reset();
  goon3.reset();
  skele1.reset();
  skele2.reset();
  skele3.reset();
  skele4.reset();
  seeker.reset();
  wraith.reset();

  //activate all coins
  for (int i = 0; i < coinsL1.length; i++)
  {
    coinsL1[i].active = true;
  }
  for (int i = 0; i < coinsL2.length; i++)
  {
    coinsL2[i].active = true;
  }
  for (int i = 0; i < coinsL3.length; i++)
  {
    coinsL3[i].active = true;
  }
  for (int i = 0; i < coinsL4.length; i++)
  {
    coinsL4[i].active = true;
  }
  for (int i = 0; i < coinsL5.length; i++)
  {
    coinsL5[i].active = true;
  }

  //shuffle all trapCounter values
  for (int i = 0; i < trapsL1.length; i++)
  {
    trapsL1[i].trapCounter = byte(round(random(2)));
  }
  for (int i = 0; i < trapsL2.length; i++)
  {
    trapsL2[i].trapCounter = byte(round(random(2)));
  }
  for (int i = 0; i < trapsL4.length; i++)
  {
    trapsL4[i].trapCounter = byte(round(random(2)));
  }
  for (int i = 0; i < trapsL5.length; i++)
  {
    trapsL5[i].trapCounter = byte(round(random(2)));
  }
}

void draw()
{
  switch(screen) {
  case 0:
    displayMainMenu(); //you can find this in the "Navigation" tab
    level1music(menu);
    break;

  case 1:
    switch(level)
    {

      // --------> LEVEL 1 <-------- //  
    case 0:

      displayMap();

      //debris stuff
      for (int i = 0; i < debrisL1.length; i++)
      {
        debrisL1[i].display(level);
        debrisL1[i].colPlayer(Main);
        debrisL1[i].colGoon(goon1);
        debrisL1[i].colGoon(goon2);
      }

      //trap stuff
      for (int i = 0; i < trapsL1.length; i++)
      {
        trapsL1[i].display(tS);
      }

      //pit stuff
      for (int i = 0; i < pitsL1.length; i++)
      {
        pitsL1[i].display(tS, level);
        pitsL1[i].colGoon(goon1);
        pitsL1[i].colGoon(goon2);
      }

      //coin stuff
      for (int i = 0; i < coinsL1.length; i++)
      {
        coinsL1[i].display();
        coinsL1[i].pickUp(Main);
      }

      //mob stuff
      goon1.display(tS);
      goon2.display(tS);
      goon1.colGoon(goon2);
      goon2.colGoon(goon1);

      //player stuff
      Main.display(tS);
      Main.displayMeta(h);

      //particle stuff
      for (int i = 0; i < rain.length; i++)
      {
        rain[i].display();
        rain[i].update();
      }

      break;

      // --------> LEVEL 2 <-------- //
    case 1:
      displayMap();

      //debris stuff
      for (int i = 0; i < debrisL2.length; i++)
      {
        debrisL2[i].display(level);
        debrisL2[i].colPlayer(Main);
        debrisL2[i].colGoon(goon3);
        debrisL2[i].colSeeker(seeker);
      }

      //trap stuff
      for (int i = 0; i < trapsL2.length; i++)
      {
        trapsL2[i].display(tS);
      }

      //pit stuff
      for (int i = 0; i < pitsL2.length; i++)
      {
        pitsL2[i].display(tS, level);
        pitsL2[i].colGoon(goon3);
        pitsL2[i].colSeeker(seeker);
      }

      //coins stuff
      for (int i = 0; i < coinsL2.length; i++)
      {
        coinsL2[i].display();
        coinsL2[i].pickUp(Main);
      }

      //mob stuff
      goon3.display(tS);
      goon3.colSeeker(seeker);
      seeker.colGoon(goon3);

      //player stuff
      Main.display(tS);
      Main.displayMeta(h);

      //specific case for seeker, important with explosion on top
      seeker.display(tS);

      //particle stuff
      break;

      // --------> LEVEL 3 <-------- //  
    case 2:
      displayMap();
      for (int i = 0; i < debrisL3.length; i++)
      {
        debrisL3[i].display(level);
        debrisL3[i].colPlayer(Main);
        debrisL3[i].colSkele(skele1);
        debrisL3[i].colSkele(skele2);
        debrisL3[i].colSkele(skele3);
      }

      //trap stuff

      //pit stuff
      for (int i = 0; i < pitsL3.length; i++)
      {
        pitsL3[i].display(tS, level);
        pitsL3[i].colSkele(skele1);
        pitsL3[i].colSkele(skele2);
        pitsL3[i].colSkele(skele3);
      }

      //coin stuff
      for (int i = 0; i < coinsL3.length; i++)
      {
        coinsL3[i].display();
        coinsL3[i].pickUp(Main);
      }

      //mob stuff
      skele1.display(tS);
      skele2.display(tS);
      skele3.display(tS);
      skele1.colSkele(skele2);
      skele1.colSkele(skele3);
      skele2.colSkele(skele1);
      skele2.colSkele(skele3);
      skele3.colSkele(skele1);
      skele3.colSkele(skele2);

      //player stuff
      Main.display(tS);
      Main.displayMeta(h);

      //particle stuff
      break;

      // --------> LEVEL 4 <-------- //
    case 3:
      displayMap();

      //debris stuff
      for (int i = 0; i < debrisL4.length; i++)
      {
        debrisL4[i].display(level);
        debrisL4[i].colPlayer(Main);
        debrisL4[i].colSkele(skele4);
      }

      //trap stuff 
      for (int i = 0; i < trapsL4.length; i++)
      {
        trapsL4[i].display(tS);
      }

      //pit stuff
      for (int i = 0; i < pitsL4.length; i++)
      {
        pitsL4[i].display(tS, level);
        pitsL4[i].colSkele(skele4);
      }

      //coin stuff
      for (int i = 0; i < coinsL4.length; i++)
      {
        coinsL4[i].display();
        coinsL4[i].pickUp(Main);
      }

      //mob stuff
      wraith.display(tS);
      wraith.colSkele(skele4);
      skele4.display(tS);

      //player
      Main.display(tS);
      Main.displayMeta(h);

      //particle stuff
      break;

      // --------> LEVEL 5 <-------- //
    case 4:
      displayMap();

      //debris stuff
      for (int i = 0; i < debrisL5.length; i++)
      {
        debrisL5[i].display(level);
        debrisL5[i].colPlayer(Main);
      }

      //trap stuff
      for (int i = 0; i < trapsL5.length; i++)
      {
        trapsL5[i].display(tS);
      }

      //pit stuff
      for (int i = 0; i < pitsL5.length; i++)
      {
        pitsL5[i].display(tS, level);
      }

      //coin stuff
      for (int i = 0; i < coinsL5.length; i++)
      {
        coinsL5[i].display();
        coinsL5[i].pickUp(Main);
      }

      //player stuff
      Main.display(tS);
      Main.displayMeta(h);

      //particle stuff
      for (int i = 0; i < embers.length; i++)
      {
        embers[i].display();
        embers[i].update();
      }

      break;
    } // Levels switch ends

    break; // main game ends

  case 2:
    displayDeathScreen(); //you can find this in the "Navigation" tab
    break;

  case 3:
    displayVictoryScreen(); //you can find this in the "Navigation" tab
    break;

  case 4:
    displayHighscoreScreen(); //you can find this in the "Navigation" tab
    break;
  }
}