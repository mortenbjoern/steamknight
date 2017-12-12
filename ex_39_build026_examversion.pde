/*

 Authors:    Morten Bjørn & Jimmy Mikkelsen
 Date:       December 11th 2017
 Exercise:   #39
 
 Description: 
 Steam Knight is a top down turn-based game, drawing inspiration from old dungeon crawlers.
 The object of the game is to collect enough coins and defeat enough monsters to get a highscore. 
 here are five levels in the game, each with their own theme (forest, dungeon, catacombs, cursed church, hell).
 
*/

//Libraries to be imported
import processing.sound.*;

//variables for highscores
String[] HiScoreName;
String[] scoring;
char[] letters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'æ', 'ø', 'å', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'Æ', 'Ø', 'Å', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
String[] initials = {"_", "_", "_"};
int initialsPos = 0;
String name = join(initials, "");

//global variables, screens
int screen = 0;
PFont bitmapFont;
PFont cleanFont;
PImage menuScreen;
boolean playmusic = true;

//global variables, in-game
float tS = 64; //tS = tileSize;
float h = tS/2; //h = half a tileSize;
color particleColors [] = {color(3, 74, 236), color(207, 16, 32)};
int score = 0;
int level = 0;

//level dependant variabels
int mobKills = 0;
int pickUps = 0;
int moves = 0;

//declare important stuff
PImage dungeon;
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
//Trap trapsL3 [] = new Trap[0];
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
//Boss boss;

void setup()
{
  size(1152, 640);
  HiScoreName = loadStrings("hiscorenames.txt");
  scoring = loadStrings("hiscores.txt");
  dungeon = loadImage("assets/dungeon.png");
  
  bitmapFont = createFont("Pixeled.ttf", 15);
  
  cleanFont = createFont("Roboto-Medium.ttf", 15);
  textFont(cleanFont);
  
  menuScreen = loadImage("assets/startScreen.png");
  
  menu = new SoundFile(this, "0.mp3");
  clik = new SoundFile(this, "clickMenu.wav");
  pres = new SoundFile(this, "letterTick.wav");
  delete = new SoundFile(this, "delete.wav");
  slash = new SoundFile(this, "slash.wav");
  coin = new SoundFile(this, "coin.wav");
  move = new SoundFile(this, "move.wav");
  goonie = new SoundFile(this, "goon.wav");

  Main = new Player();

  //declare particles
  for (int i = 0; i < rain.length; i++)
  {
    rain[i] = new Particles(particleColors[0], random(-1, 1), 240, random(-720));
  }

  for (int i = 0; i < embers.length; i++)
  {
    embers[i] = new Particles(particleColors[1], random(-10, 10), 20, random(height+50));
  }

  //declare traps for each level
  for (int i = 0; i < trapsL1.length; i++)
  {
    trapsL1[i] = new Trap(trapPosX[0][i], trapPosY[0][i]);
  }
  for (int i = 0; i < trapsL2.length; i++)
  {
    trapsL2[i] = new Trap(trapPosX[1][i], trapPosY[1][i]);
  }
  /*
  for (int i = 0; i < trapsL3.length; i++)
   {
   trapsL3[i] = new Trap(trapPosX[2][i], trapPosY[2][i]);
   }
   */
  for (int i = 0; i < trapsL4.length; i++)
  {
    trapsL4[i] = new Trap(trapPosX[2][i], trapPosY[2][i]); //replace with "3" in case we use traps in level 3
  }
  for (int i = 0; i < trapsL5.length; i++)
  {
    trapsL5[i] = new Trap(trapPosX[3][i], trapPosY[3][i]); //replace with "4" in case we use traps in level 3
  }

  //declare pits for each level
  for (int i = 0; i < pitsL1.length; i++)
  {
    pitsL1[i] = new Pit(pitPosX[0][i], pitPosY[0][i]);
  }
  for (int i = 0; i < pitsL2.length; i++)
  {
    pitsL2[i] = new Pit(pitPosX[1][i], pitPosY[1][i]);
  }
  for (int i = 0; i < pitsL3.length; i++)
  {
    pitsL3[i] = new Pit(pitPosX[2][i], pitPosY[2][i]);
  }
  for (int i = 0; i < pitsL4.length; i++)
  {
    pitsL4[i] = new Pit(pitPosX[3][i], pitPosY[3][i]);
  }
  for (int i = 0; i < pitsL5.length; i++)
  {
    pitsL5[i] = new Pit(pitPosX[4][i], pitPosY[4][i]);
  }

  //declare debris for each level
  for (int i = 0; i < debrisL1.length; i++)
  {
    debrisL1[i] = new Debris(debrisPosX[0][i], debrisPosY[0][i]);
  }
  for (int i = 0; i < debrisL2.length; i++)
  {
    debrisL2[i] = new Debris(debrisPosX[1][i], debrisPosY[1][i]);
  }
  for (int i = 0; i < debrisL3.length; i++)
  {
    debrisL3[i] = new Debris(debrisPosX[2][i], debrisPosY[2][i]);
  }
  for (int i = 0; i < debrisL4.length; i++)
  {
    debrisL4[i] = new Debris(debrisPosX[3][i], debrisPosY[3][i]);
  }
  for (int i = 0; i < debrisL5.length; i++)
  {
    debrisL5[i] = new Debris(debrisPosX[4][i], debrisPosY[4][i]);
  }

  //declare coins for each level
  for (int i = 0; i < coinsL1.length; i++)
  {
    coinsL1[i] = new Coins(coinsPosX[0][i], coinsPosY[0][i]);
  }
  for (int i = 0; i < coinsL2.length; i++)
  {
    coinsL2[i] = new Coins(coinsPosX[1][i], coinsPosY[1][i]);
  }
  for (int i = 0; i < coinsL3.length; i++)
  {
    coinsL3[i] = new Coins(coinsPosX[2][i], coinsPosY[2][i]);
  }
  for (int i = 0; i < coinsL4.length; i++)
  {
    coinsL4[i] = new Coins(coinsPosX[3][i], coinsPosY[3][i]);
  }
  for (int i = 0; i < coinsL5.length; i++)
  {
    coinsL5[i] = new Coins(coinsPosX[4][i], coinsPosY[4][i]);
  }

  //declare mobs for each level
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

//functions

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
        afterMoves(level);
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
        afterMoves(level);
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
        afterMoves(level);
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
        afterMoves(level);
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
    }
    
    else if (key == 'd')
    {
      Main.attackR(goon1, goon2, goon3, seeker, skele1, skele2, skele3, skele4);
    }
    
    else if (key == 'w')
    {
      Main.attackU(goon1, goon2, goon3, seeker, skele1, skele2, skele3, skele4);
    }
    
    else if (key == 's')
    {
      Main.attackD(goon1, goon2, goon3, seeker, skele1, skele2, skele3, skele4);
    }
    afterMoves(level);
    checkConditions(level);
    Main.update();
  }

  //this runs whenever a key is pressed, but the functions are reliant on screen == 3
  enterLetters(); //you can find this in the "Navigation" tab
  deleteInput();
  submitName(); //you can find this in the "Navigation" tab
} //end keyPressed

//FUNCTIONS
void displayMap (int level)
{
  background(255);
  imageMode(CORNER);
  PImage skin = dungeon.get(0 + (1152*level), 0, 1152, 640);
  image(skin, 0, 0);
  stroke(1);
}

void afterMoves (int l)
{
  moves ++;
  switch(l) {
  case 0:

    //entity moves

    goon1.move(Main.posX, Main.posY, moves, Main);
    goon1.update();
    goon2.move(Main.posX, Main.posY, moves, Main);
    goon2.update();

    for (int i = 0; i < trapsL1.length; i++)
    {
      trapsL1[i].trapCounter++;
    }
    for (int i = 0; i < trapsL1.length; i++)
    {
      if (trapsL1[i].trapCounter > 2) {
        trapsL1[i].trapCounter = 0;
      }
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
      trapsL2[i].trapCounter++;
    }
    for (int i = 0; i < trapsL2.length; i++)
    {
      if (trapsL2[i].trapCounter > 2) {
        trapsL2[i].trapCounter = 0;
      }
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
      trapsL4[i].trapCounter++;
    }
    for (int i = 0; i < trapsL4.length; i++)
    {
      if (trapsL4[i].trapCounter > 2) {
        trapsL4[i].trapCounter = 0;
      }
    }
    break;

  case 4:
    for (int i = 0; i < trapsL5.length; i++)
    {
      trapsL5[i].trapCounter++;
    }
    for (int i = 0; i < trapsL5.length; i++)
    {
      if (trapsL5[i].trapCounter > 2) {
        trapsL5[i].trapCounter = 0;
      }
    }
    break;
  }
}

void calcScore()
{
  score = score + round((1+((10-moves)/100)) * ((1+mobKills)*250) + ((1+pickUps)*250)) + (Main.HP*5000);
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
      if (Main.checkPit(pitsL1[i].getX(), pitsL1[i].getY()) == true)
      {
        deathStatement = dByPit;
        screen = 2;
      }
    }

    //check if something is standing on spikes
    for (int i = 0; i < trapsL1.length; i++)
    {
      if (trapsL1[i].getX() == Main.posX && trapsL1[i].getY() == Main.posY && trapsL1[i].trapCounter == 2)
      {
        deathStatement = dByTrap;
        Main.HP -= 1;
      }
      if (trapsL1[i].getX() == goon1.getX() && trapsL1[i].getY() == goon1.getY() && trapsL1[i].trapCounter == 2)
      {
        goon1.HP -= 1;
      }
      if (trapsL1[i].getX() == goon2.getX() && trapsL1[i].getY() == goon2.getY() && trapsL1[i].trapCounter == 2)
      {
        goon2.HP -= 1;
      }
    }

    //check mob specific stuff here
    //...

    //check if player or mobs are dead
    if (goon1.HP <= 0) {
      mobKills++;
      goon1.alive = false;
    }
    if (goon2.HP <= 0) {
      mobKills++;
      goon2.alive = false;
    }
    if (Main.HP <= 0) {
      screen = 2;
    }

    //check if player progressed to next level
    if (Main.posX == (tS*16)+h && Main.posY == (tS*4)+h || Main.posX == (tS*16)+h && Main.posY == (tS*5)+h && level == 0)
    {
      /* calculate score based on enemies slain, number of moves taken and other stuff */
      level = 1;
      calcScore();
      softReset(level);
    }

    break;

    // --------> LEVEL 2 <-------- //
  case 1:
    //check if PLAYER landed in pit
    for (int i = 0; i < pitsL2.length; i++)
    {
      if (Main.checkPit(pitsL2[i].getX(), pitsL2[i].getY()) == true)
      {
        deathStatement = dByPit;
        screen = 2;
      }
    }

    //check if something is standing on spikes
    for (int i = 0; i < trapsL2.length; i++)
    {
      if (trapsL2[i].getX() == Main.posX && trapsL2[i].getY() == Main.posY && trapsL2[i].trapCounter == 2)
      {
        deathStatement = dByTrap;
        Main.HP -= 1;
      }
      if (trapsL2[i].getX() == goon3.getX() && trapsL2[i].getY() == goon3.getY() && trapsL2[i].trapCounter == 2)
      {
        goon3.HP -= 1;
      }
      if (trapsL2[i].getX() == seeker.getX() && trapsL2[i].getY() == seeker.getY() && trapsL2[i].trapCounter == 2)
      {
        seeker.HP -= 1;
      }
    }

    //check mob specific stuff here
    if (seeker.getX() == Main.posX && seeker.getY() == Main.posY && seeker.alive == true)
    {
      seeker.alive = false;
      seeker.frame = 0; //improves deavth animation
      deathStatement = dBySeeker;
      Main.HP -= 2;
    }

    //check if player or mobs are dead
    if (seeker.HP <= 0 && seeker.alive == true) {
      mobKills++;
      seeker.frame = 0; //improves death animation
      seeker.alive = false;
    }
    if (goon3.HP <= 0) {
      mobKills++;
      goon3.alive = false;
    }
    if (Main.HP <= 0) {
      screen = 2;
    }

    //check if player progressed to next level
    if (Main.posX == (tS*16)+h && Main.posY == (tS*8)+h)
    {
      /* calculate score based on enemies slain, number of moves taken and other stuff */
      level++;
      calcScore();
      softReset(level);
    }

    break;

    // --------> LEVEL 3 <-------- //
  case 2:
    //check if PLAYER landed in pit
    for (int i = 0; i < pitsL3.length; i++)
    {
      if (Main.checkPit(pitsL3[i].getX(), pitsL3[i].getY()) == true)
      {
        deathStatement = dByPit;
        screen = 2;
      }
    }

    //check if something is standing on spikes

    /* no traps in this level */

    //check mob specific stuff here
    //...

    //check if player or mobs are dead
    if (skele1.HP <= 0) {
      mobKills++;
      skele1.alive = false;
    }
    if (skele2.HP <= 0) {
      mobKills++;
      skele2.alive = false;
    }
    if (skele3.HP <= 0) {
      mobKills++;
      skele3.alive = false;
    }
    if (Main.HP <= 0) {
      screen = 2;
    }

    //check if player progressed to next level
    if (Main.posX == (tS*16)+h && Main.posY == (tS*4)+h || Main.posX == (tS*16)+h && Main.posY == (tS*5)+h)
    {
      /* calculate score based on enemies slain, number of moves taken and other stuff */
      level++;
      calcScore();
      softReset(level);
    }

    break;

    // --------> LEVEL 4 <-------- //
  case 3:
    //check if PLAYER landed in pit
    for (int i = 0; i < pitsL4.length; i++)
    {
      if (Main.checkPit(pitsL4[i].getX(), pitsL4[i].getY()) == true)
      {
        deathStatement = dByPit;
        screen = 2;
      }
    }

    //check if something is standing on spikes
    for (int i = 0; i < trapsL4.length; i++)
    {
      if (trapsL4[i].getX() == Main.posX && trapsL4[i].getY() == Main.posY && trapsL4[i].trapCounter == 2)
      {
        deathStatement = dByTrap;
        Main.HP -= 1;
      }
      if (trapsL4[i].getX() == skele4.getX() && trapsL4[i].getY() == skele4.getY() && trapsL4[i].trapCounter == 2)
      {
        skele4.HP -= 1;
      }
    }

    //check mob specific stuff here
    if (wraith.getX() == Main.posX && wraith.getY() == Main.posY)
    {
      deathStatement = dByWraith;
      screen = 2;
    }

    //check if player or mobs are dead
    if (skele4.HP <= 0) {
      mobKills++;
      skele4.alive = false;
    }
    if (Main.HP <= 0) {
      screen = 2;
    }

    //check if player progressed to next level
    if (Main.posX == (tS*16)+h && Main.posY == (tS*4)+h || Main.posX == (tS*16)+h && Main.posY == (tS*5)+h)
    {
      /* calculate score based on enemies slain, number of moves taken and other stuff */
      level++;
      calcScore();
      softReset(level);
    }

    break;

    // --------> LEVEL 5 <-------- //
  case 4:
    //check if PLAYER landed in pit
    for (int i = 0; i < pitsL5.length; i++)
    {
      if (Main.checkPit(pitsL5[i].getX(), pitsL5[i].getY()) == true)
      {
        deathStatement = dByPit;
        screen = 2;
      }
    }

    //check if something is standing on spikes
    for (int i = 0; i < trapsL5.length; i++)
    {
      if (trapsL5[i].getX() == Main.posX && trapsL5[i].getY() == Main.posY && trapsL5[i].trapCounter == 2)
      {
        deathStatement = dByTrap;
        Main.HP -= 1;
      }
    }

    //check mob specific stuff here
    //...

    //check if player or mobs are dead
    if (Main.HP <= 0) {
      screen = 2;
    }

    //check if player progressed to next level
    if ((Main.posX == (tS*16)+h && Main.posY == (tS*4)+h) || (Main.posX == (tS*16)+h && Main.posY == (tS*5)+h))
    {
      calcScore();
      softReset(level);
      screen = 3;
    }

    break;
  }
}

void hardReset()
{
  moves = 0;
  score = 0;
  level = 0;
  mobKills = 0;
  pickUps = 0;
  Main.HP = 3;
  deathStatement = "Whoops, you died!";
  Main.posX = tS+h;
  Main.posY = tS+h;
  Main.oldX = tS+h;
  Main.oldY = tS+h;

  //reset status of all goons
  goon1.posX = goonPosX[0][0]; goon1.posY = goonPosY[0][0];
  goon2.posX = goonPosX[0][1]; goon1.posY = goonPosY[0][1];
  goon3.posX = goonPosX[1][0]; goon1.posY = goonPosY[1][0];
  goon1.alive = true;
  goon2.alive = true;
  goon3.alive = true;
  goon1.HP = 1;
  goon2.HP = 1;
  goon3.HP = 1;

  //reset status of all skeletons
  skele1.posX = skeletonPosX[0][0]; skele1.posY = skeletonPosY[0][0];
  skele2.posX = skeletonPosX[0][1]; skele2.posY = skeletonPosY[0][1];
  skele3.posX = skeletonPosX[0][2]; skele3.posY = skeletonPosY[0][2];
  skele4.posX = skeletonPosX[1][0]; skele4.posY = skeletonPosY[1][0];
  skele1.alive = true;
  skele2.alive = true;
  skele3.alive = true;
  skele4.alive = true;
  skele1.HP = 1;
  skele2.HP = 1;
  skele3.HP = 1;
  skele4.HP = 1;

  //reset status of all seekers
  seeker.posX = seekerPosX; seeker.posY = seekerPosY;
  seeker.alive = true;
  seeker.HP = 3;

  //reset status of all wraiths
  wraith.posX = wraithPosX; wraith.posY = wraithPosY;

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
    trapsL1[i].trapCounter = round(random(2));
  }
  for (int i = 0; i < trapsL2.length; i++)
  {
    trapsL2[i].trapCounter = round(random(2));
  }
  for (int i = 0; i < trapsL4.length; i++)
  {
    trapsL4[i].trapCounter = round(random(2));
  }
  for (int i = 0; i < trapsL5.length; i++)
  {
    trapsL5[i].trapCounter = round(random(2));
  }
}

void softReset(int l)
{
  moves = 0;
  mobKills = 0;
  pickUps = 0;
  Main.HP = 3;
  deathStatement = "Whoops, you died!";

  //position = level dependant
  switch (l)
  {
  case 0:
  Main.posX = tS+h;
  Main.posY = tS+h;
  break;
  
  case 1:
  Main.posX = tS+h;
  Main.posY = tS+h;
  break;
  
  case 2:
  Main.posX = tS+h;
  Main.posY = tS+h;
  break;
  
  case 3:
  Main.posX = tS+h;
  Main.posY = tS*4+h;
  break;
  
  case 4:
  Main.posX = tS+h;
  Main.posY = tS*4+h;
  break;
  }

  //reset status of all goons
  goon1.posX = goonPosX[0][0]; goon1.posY = goonPosY[0][0];
  goon2.posX = goonPosX[0][1]; goon1.posY = goonPosY[0][1];
  goon3.posX = goonPosX[1][0]; goon1.posY = goonPosY[1][0];
  goon1.alive = true;
  goon2.alive = true;
  goon3.alive = true;
  goon1.HP = 1;
  goon2.HP = 1;
  goon3.HP = 1;

  //reset status of all skeletons
  skele1.posX = skeletonPosX[0][0]; skele1.posY = skeletonPosY[0][0];
  skele2.posX = skeletonPosX[0][1]; skele2.posY = skeletonPosY[0][1];
  skele3.posX = skeletonPosX[0][2]; skele3.posY = skeletonPosY[0][2];
  skele4.posX = skeletonPosX[1][0]; skele4.posY = skeletonPosY[1][0];
  skele1.alive = true;
  skele2.alive = true;
  skele3.alive = true;
  skele4.alive = true;
  skele1.HP = 1;
  skele2.HP = 1;
  skele3.HP = 1;
  skele4.HP = 1;

  //reset status of all seekers
  seeker.posX = seekerPosX; seeker.posY = seekerPosY;
  seeker.alive = true;
  seeker.HP = 3;

  //reset status of all wraiths
  wraith.posX = wraithPosX; wraith.posY = wraithPosY;

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
    trapsL1[i].trapCounter = round(random(2));
  }
  for (int i = 0; i < trapsL2.length; i++)
  {
    trapsL2[i].trapCounter = round(random(2));
  }
  for (int i = 0; i < trapsL4.length; i++)
  {
    trapsL4[i].trapCounter = round(random(2));
  }
  for (int i = 0; i < trapsL5.length; i++)
  {
    trapsL5[i].trapCounter = round(random(2));
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

      displayMap(level);

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
        trapsL1[i].display(tS, trapsL1[i].trapCounter);
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
        coinsL1[i].display(coinsL1[i].active);
        coinsL1[i].pickUp(Main.posX, Main.posY);
      }

      //mob stuff
      goon1.display(tS);
      goon2.display(tS);
      goon1.colGoon(goon2);
      goon2.colGoon(goon1);

      //player stuff
      Main.display(tS);
      Main.displayMeta(tS, Main.HP);

      //particle stuff
      for (int i = 0; i < rain.length; i++)
      {
        rain[i].display();
        rain[i].update();
      }

      break;

      // --------> LEVEL 2 <-------- //
    case 1:
      displayMap(level);

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
        trapsL2[i].display(tS, trapsL2[i].trapCounter);
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
        coinsL2[i].display(coinsL2[i].active);
        coinsL2[i].pickUp(Main.posX, Main.posY);
      }

      //mob stuff
      goon3.display(tS);
      goon3.colSeeker(seeker);
      seeker.colGoon(goon3);

      //player stuff
      Main.display(tS);
      Main.displayMeta(tS, Main.HP);
      
      //specific case for seeker, important with explosion on top
      seeker.display(tS);

      //particle stuff
      break;

      // --------> LEVEL 3 <-------- //  
    case 2:
      displayMap(level);
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
        coinsL3[i].display(coinsL3[i].active);
        coinsL3[i].pickUp(Main.posX, Main.posY);
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
      Main.displayMeta(tS, Main.HP);

      //particle stuff
      break;

      // --------> LEVEL 4 <-------- //
    case 3:
      displayMap(level);

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
        trapsL4[i].display(tS, trapsL4[i].trapCounter);
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
        coinsL4[i].display(coinsL4[i].active);
        coinsL4[i].pickUp(Main.posX, Main.posY);
      }

      //mob stuff
      wraith.display(tS);
      wraith.colSkele(skele4);
      skele4.display(tS);

      //player
      Main.display(tS);
      Main.displayMeta(tS, Main.HP);

      //particle stuff
      break;

      // --------> LEVEL 5 <-------- //
    case 4:
      displayMap(level);

      //debris stuff
      for (int i = 0; i < debrisL5.length; i++)
      {
        debrisL5[i].display(level);
        debrisL5[i].colPlayer(Main);
      }

      //trap stuff
      for (int i = 0; i < trapsL5.length; i++)
      {
        trapsL5[i].display(tS, trapsL5[i].trapCounter);
      }

      //pit stuff
      for (int i = 0; i < pitsL5.length; i++)
      {
        pitsL5[i].display(tS, level);
      }

      //coin stuff
      for (int i = 0; i < coinsL5.length; i++)
      {
        coinsL5[i].display(coinsL5[i].active);
        coinsL5[i].pickUp(Main.posX, Main.posY);
      }

      //mob stuff
      //skele.display(tS);

      //player stuff
      Main.display(tS);
      Main.displayMeta(tS, Main.HP);

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