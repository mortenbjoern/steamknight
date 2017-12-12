class Debris {
  float posX; 
  float posY;
  PImage debris = loadImage("assets/debris.png");

  Debris (float x, float y)
  {
    posX = x;
    posY = y;
  }

  void display (int level) 
  {
    switch(level)
    {
    case 0:
      imageMode(CENTER);
      PImage frame = debris.get(0, 0, 64, 64);
      image(frame, posX, posY);
      break;

    case 1:
      imageMode(CENTER);
      PImage frame1 = debris.get(64, 0, 64, 64);
      image(frame1, posX, posY);
      break;

    case 2:
      imageMode(CENTER);
      PImage frame2 = debris.get(128, 0, 64, 64);
      image(frame2, posX, posY);
      break;

    case 3:
      imageMode(CENTER);
      PImage frame3 = debris.get(192, 0, 64, 64);
      image(frame3, posX, posY);
      break;

    case 4:
      imageMode(CENTER);
      PImage frame4 = debris.get(256, 0, 64, 64);
      image(frame4, posX, posY);
      break;
    }
  } // end display()

  float getX ()
  {
    return posX;
  }

  float getY ()
  {
    return posY;
  }

  /* boolean col (float x1, float y1, float x2, float y2, z)
  {
    if ((x1-tS) == posX && y1 == posY)
    {
      z.canMoveLeft = false;
      return false;
    }
    
    if ((x1+tS) == posX && y1 == posY)
    {
      Main.canMoveRight = false;
      return false;
    }
    
    if (x1 == posX && (y1-tS) == posY)
    {
      Main.canMoveUp = false;
      return false;
    }
    
    if (x1 == posX && (y1+tS) == posY)
    {
      Main.canMoveDown = false;
      return false;
    }
    if ((x2-tS) == posX && y2 == posY)
    {
      skele.canMoveLeft = false;
      return false;
    }
    
    if ((x2+tS) == posX && y2 == posY)
    {
      skele.canMoveRight = false;
      return false;
    }
    
    if (x2 == posX && (y2-tS) == posY)
    {
      skele.canMoveUp = false;
      println(skele.canMoveUp);
      return false;
    }
    
    if (x2 == posX && (y2+tS) == posY)
    {
      skele.canMoveDown = false;
      return false;
    }
    else
    {
      return true;
    }
  } */
  
  boolean colPlayer (Player z)
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
  
} // end class