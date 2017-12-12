class Coins {
  boolean active = true;
  float posX; 
  float posY;
  int frame = 0;
  int maxF = 8;
  float everyMillis = 125;
  int ticksLast = millis();
  int value = 1000;
  PImage coinsI = loadImage("assets/coin.png");

  Coins (float x, float y)
  {
    posX = x;
    posY = y;
  }

  void display (boolean active) 
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

  void pickUp (float x, float y)
  {
    if (posX == x && posY == y && active == true)
    {
      coin.play();
      pickUps++;
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