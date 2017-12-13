class Pit {
  //pit variables
  float posX;
  float posY;
  byte frame = 0;
  byte maxF = 4;
  float everyMillis = 250;
  int ticksLast = millis();
  PImage pit = loadImage("assets/pit.png");
  PImage acid = loadImage("assets/Acid_pit.png");

  //pit constructor
  Pit (float x, float y)
  {
    posX = x;
    posY = y;
  }

  //pit methods
  void display (float x, int level) {
    switch(level)
    {
    case 0:
      imageMode(CENTER);
      PImage f1 = pit.get(0, 0, 64, 64);
      image(f1, posX, posY);
      break;

    case 1:
      imageMode(CENTER);
      PImage f2 = acid.get(frame*(int(x)), 0, int(x), int(x));
      image(f2, posX, posY);

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
      break;
      
      case 2:
      imageMode(CENTER);
      PImage f3 = pit.get(0, 0, 64, 64);
      image(f3, posX, posY);
      break;
      
      case 3:
      imageMode(CENTER);
      PImage f4 = pit.get(64, 0, 64, 64);
      image(f4, posX, posY);
      break;
      
      case 4:
      imageMode(CENTER);
      PImage f5 = pit.get(128, 0, 64, 64);
      image(f5, posX, posY);
      break;
    }
  }
  
  void checkPlayer (Player a)
  {
    if (a.posX == posX && a.posY == posY)
      {
        deathStatement = dByPit;
        screen = 2;
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
  
  boolean colSkele (Skeleton z)
  {
    if ((z.oldX-tS) == posX && z.oldY == posY)
    {
      z.canMoveLeft = false;
      return false;
    }
    
    if ((z.oldX+tS) == posX && z.oldY == posY)
    {
      z.canMoveRight = false;
      return false;
    }
    
    if (z.oldX == posX && (z.oldY-tS) == posY)
    {
      z.canMoveUp = false;
      return false;
    }
    
    if (z.oldX == posX && (z.oldY+tS) == posY)
    {
      z.canMoveDown = false;
      return false;
    }
    else
    {
      return true;
    }
  }
  
  boolean colGoon (Goon z)
  {
    if ((z.oldX-tS) == posX && z.oldY == posY)
    {
      z.canMoveLeft = false;
      return false;
    }
    
    if ((z.oldX+tS) == posX && z.oldY == posY)
    {
      z.canMoveRight = false;
      return false;
    }
    
    if (z.oldX == posX && (z.oldY-tS) == posY)
    {
      z.canMoveUp = false;
      return false;
    }
    
    if (z.oldX == posX && (z.oldY+tS) == posY)
    {
      z.canMoveDown = false;
      return false;
    }
    else
    {
      return true;
    }
  }
  
  boolean colSeeker (Seeker z)
  {
    if ((z.oldX-tS) == posX && z.oldY == posY)
    {
      z.canMoveLeft = false;
      return false;
    }
    
    if ((z.oldX+tS) == posX && z.oldY == posY)
    {
      z.canMoveRight = false;
      return false;
    }
    
    if (z.oldX == posX && (z.oldY-tS) == posY)
    {
      z.canMoveUp = false;
      return false;
    }
    
    if (z.oldX == posX && (z.oldY+tS) == posY)
    {
      z.canMoveDown = false;
      return false;
    }
    else
    {
      return true;
    }
  }
}