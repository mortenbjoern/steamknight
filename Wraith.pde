class Wraith {
  float posX;
  float posY;
  float oldX;
  float oldY;
  boolean canMoveUp = true;
  boolean canMoveDown = true;
  boolean canMoveRight = true;
  boolean canMoveLeft = true;
  int frame = 0;
  int maxF = 4;
  float everyMillis = 250;
  int ticksLast = millis();
  PImage wraith = loadImage("assets/wraith.png");

  Wraith (float x, float y)
  {
    posX = x;
    posY = y;
  }

  void display (float x) 
  {
    imageMode(CENTER);
    PImage f = wraith.get(frame*int(x), 0, int(x), int(x));
    image(f, posX, posY);

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

  void move(float x, float y, int z)
  {
    if (z % 2 == 0) //round(random(1,2))
    {
      if (posX > x && (posX-x)>(posY - y))
      {
        posX -= tS;
      } else if (posX > x && (posX-x)>(posY - y))
      {
        if (y < posY)
        {
          posY -= tS;
        } else if (posY < y)
        {
          posY += tS;
        } else if (posY == y)
        {
          int roll = round(random(1));
          if (roll == 0)
          {
            posY += tS;
          } else if (roll == 1)
          {
            posY -= tS;
          }
        }
      } else if (posX < x && (x-posX)>(y - posY))
      {
        posX += tS;
      } else if (posX < x && (x-posX)>(y - posY))
      {
        if (y < posY)
        {
          posY -= tS;
        } else if (posY < y)
        {
          posY += tS;
        } else if (posY == y)
        {
          int roll = round(random(1));
          if (roll == 0)
          {
            posY += tS;
          } else if (roll == 1)
          {
            posY -= tS;
          }
        }
      } else if (posY > y && (posY-y)>(posX-x))
      {
        posY -= tS;
      } else if (posY > y && (posY-y)>(posX-x))
      {
        if (x < posX)
        {
          posX -= tS;
        } else if (posX < x)
        {
          posX += tS;
        } else if (posX == x)
        {
          int roll = round(random(1));
          if (roll == 0)
          {
            posX += tS;
          } else if (roll == 1)
          {
            posX -= tS;
          }
        }
      } else if (posY < y && (y-posY)>(x-posX))
      {
        posY += tS;
      } else if (posY < y && (y-posY)>(x-posX))
      {
        if (x < posX)
        {
          posX -= tS;
        } else if (posX < x)
        {
          posX += tS;
        } else if (posX == x)
        {
          int roll = round(random(1));
          if (roll == 0)
          {
            posX += tS;
          } else if (roll == 1)
          {
            posX -= tS;
          }
        }
      }
      
      //scenario 1
      else if (posX > x && posY > y && (posX-x)==(posY - y))
      {
        int roll = round(random(1));
        if (roll == 0)
        {
          posX -= tS;
        } else if (roll == 1)
        {
          posY -= tS;
        }
      }
      
      //scenario 2
      else if (posX < x && posY < y && (x-posX)==(y-posY))
      {
        int roll = round(random(1));
        if (roll == 0)
        {
          posX += tS;
        } else if (roll == 1)
        {
          posY += tS;
        }
      }
      
      //scenario 3
      else if (posX > x && posY < y && (x-posX)==(posY -y))
      {
        int roll = round(random(1));
        if (roll == 0)
        {
          posX -= tS; //move left
        } else if (roll == 1)
        {
          posY += tS; //move down
        }
      }
      
      //scenario 4
      else if (posX < x && posY > y && (posX - x)==(y-posY))
      {
        int roll = round(random(1));
        if (roll == 0)
        {
          posX += tS; //move right
        } else if (roll == 1)
        {
          posY -= tS; //move up
        }
      }
    }
  } //end move ()

  void update ()
  {
    oldX = posX;
    oldY = posY;
    canMoveUp = true;
    canMoveDown = true;
    canMoveRight = true;
    canMoveLeft = true;
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
    } else
    {
      return true;
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