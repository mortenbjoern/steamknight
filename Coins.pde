class Coins {
  boolean active = true;
  float posX; 
  float posY;
  byte frame = 0;
  byte maxF = 8;
  float everyMillis = 125;
  int ticksLast = millis();
  int value = 1000;
  PImage coinsI = loadImage("assets/coin.png");

  Coins (float x, float y)
  {
    posX = x;
    posY = y;
  }

  void display () 
  {
    if (active)
    {
      imageMode(CENTER);
      PImage show = coinsI.get(frame*int(tS), 0, int(tS), int(tS));
      image(show, posX, posY);

      int delta = millis() - ticksLast;

      if (delta >= everyMillis)
      {
        frame++;
        
        if (frame >= maxF)
        {
          frame = 0;
        }

        ticksLast = millis();
      }
    }
  } // end display()

  void pickUp (Player a)
  {
    if (posX == a.posX && posY == a.posY && active == true)
    {
      //coin.play();
      a.pickUps++;
      score += value;
      active = false;
    }
  }

  float getX ()
  {
    return posX;
  }

  float getY ()
  {
    return posY;
  }
} // end class