class Seeker {
  boolean alive = true;
  float posX;
  float posY;
  float oldX;
  float oldY;
  float startPosX;
  float startPosY;
  byte HP = 3;
  boolean canMoveUp = true;
  boolean canMoveDown = true;
  boolean canMoveRight = true;
  boolean canMoveLeft = true;
  byte frame = 0;
  byte maxF = 8;
  float everyMillis = 250;
  int ticksLast = millis();
  PImage seeker = loadImage("assets/seeker.png");
  PImage seeker_death = loadImage("assets/seeker_death.png");

  Seeker (float x, float y)
  {
    posX = x;
    posY = y;
    startPosX = posX;
    startPosY = posY;
  }

  void display (float x) 
  {
    if (alive) {
      imageMode(CENTER);
      PImage f = seeker.get(frame*int(x), 0, int(x), int(x));
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
    } else if (alive == false) {
      imageMode(CENTER);
      PImage f = seeker_death.get(frame*int(x), 0, int(x), int(x));
      image(f, posX, posY);

      int delta = millis() - ticksLast;

      if (delta >= everyMillis)
      {
        frame++;
        if (frame >= maxF)
        {
          frame = 10;
        }

        ticksLast = millis();
      }
    }
  }

  void move(float x, float y, int z)
  {
    if (z % round(random(1,2)) == 0 && alive == true) //round(random(1,2))
    {
      //-----> LEFT MOVEMENT / ATTACKS START HERE <-----//

      if (posX > x && (posX-x)>(posY - y) && canMoveLeft == true)
      {
        posX -= tS;
      }
      
      else if (posX > x && (posX-x)>(posY - y) && canMoveLeft == false)
      {
        if (y < posY && canMoveUp)
        {
          posY -= tS;
        }
        else if (posY < y && canMoveDown)
        {
          posY += tS;
        }
        else if (posY == y)
        {
          int roll = round(random(1));
          if (roll == 0 && canMoveUp)
          {
            posY -= tS;
          } else if (roll == 1 && canMoveDown)
          {
            posY += tS;
          } else if (roll == 1 && canMoveUp)
          {
            posY -= tS;
          } else if (roll == 0 && canMoveDown)
          {
            posY += tS;
          }
        }
      }
      
      //-----> RIGHT MOVEMENT / ATTACKS START HERE <-----//
      
      else if (posX < x && (x-posX)>(y - posY) && canMoveRight == true)
      {
        posX += tS;
      }
      
       else if (posX < x && (x-posX)>(y - posY) && canMoveRight == false)
      {
        if (y < posY && canMoveUp)
        {
          posY -= tS;
        }
        else if (posY < y && canMoveDown)
        {
          posY += tS;
        }
        else if (posY == y)
        {
          int roll = round(random(1));
          if (roll == 0 && canMoveUp)
          {
            posY -= tS;
          } else if (roll == 1 && canMoveDown)
          {
            posY += tS;
          } else if (roll == 1 && canMoveUp)
          {
            posY -= tS;
          } else if (roll == 0 && canMoveDown)
          {
            posY += tS;
          }
        }
      }
      
      //-----> UP MOVEMENT / ATTACKS START HERE <-----//
      
      else if (posY > y && (posY-y)>(posX-x) && canMoveUp == true)
      {
        posY -= tS;
      }

      else if (posY > y && (posY-y)>(posX-x) && canMoveUp == false)
      {
        if (x < posX && canMoveLeft)
        {
          posX -= tS;
        } else if (posX < x && canMoveRight)
        {
          posX += tS;
        } else if (posX == x)
        {
          int roll = round(random(1));
          if (roll == 0 && canMoveRight)
          {
            posX += tS;
          } else if (roll == 1 && canMoveLeft)
          {
            posX -= tS;
          } else if (roll == 1 && canMoveRight)
          {
            posX += tS;
          } else if (roll == 1 && canMoveLeft)
          {
            posX -= tS;
          }
        }
      }
      
      //-----> DOWN MOVEMENT / ATTACKS START HERE <-----//
      
      else if (posY < y && (y-posY)>(x-posX) && canMoveDown == true)
      {
        posY += tS;
      }
      
      else if (posY < y && (y-posY)>(x-posX) && canMoveDown == false)
      {
        if (x < posX && canMoveLeft)
        {
          posX -= tS;
        } else if (posX < x && canMoveRight)
        {
          posX += tS;
        } else if (posX == x)
        {
          int roll = round(random(1));
          if (roll == 0 && canMoveRight)
          {
            posX += tS;
          } else if (roll == 1 && canMoveLeft)
          {
            posX -= tS;
          } else if (roll == 1 && canMoveRight)
          {
            posX += tS;
          } else if (roll == 1 && canMoveLeft)
          {
            posX -= tS;
          }
        }
      }
      
      //-----> MISC MOVEMENT / ATTACKS START HERE <-----//
      
      //scenario 1
      else if (posX > x && posY > y && (posX - x) == (posY - y))
      {
        int roll = round(random(1));
        if (canMoveLeft == true && canMoveUp == true)
        {
          if (roll == 0)
          {
            posX -= tS; // move left
          }
          else if (roll == 1)
          {
            posY -= tS; //move up
          }
        }
        else if (canMoveLeft == true && canMoveUp == false)
        {
          posX -= tS; // move left
        }
        else if (canMoveLeft == false && canMoveUp == true)
        {
          posY -= tS; //move up
        }
        else {} //stand still
      }
      
      //scenario 2
      else if (posX < x && posY < y && (x - posX) == (y - posY))
      {
        int roll = round(random(1));
        if (canMoveDown == true && canMoveRight == true)
        {
          if (roll == 0)
          {
            posX += tS; // move right
          }
          else if (roll == 1)
          {
            posY += tS; //move down
          }
        }
        else if (canMoveRight == true && canMoveDown == false)
        {
          posX += tS; // move right
        }
        else if (canMoveRight == false && canMoveDown == true)
        {
          posY += tS; //move down
        }
        else {} //stand still
      }
      
      //scenario 3
      else if (posX > x && posY < y && (posX - x) == (y - posY))
      {
        int roll = round(random(1));
        if (canMoveUp == true && canMoveRight == true)
        {
          if (roll == 0)
          {
            posX += tS; // move right
          }
          else if (roll == 1)
          {
            posY -= tS; //move up
          }
        }
        else if (canMoveRight == true && canMoveUp == false)
        {
          posX += tS; // move right
        }
        else if (canMoveRight == false && canMoveUp == true)
        {
          posY -= tS; //move up
        }
        else {} //stand still
      }
      
      //scenario 4
      else if (posX < x && posY > y && (x - posX) == (posY - y))
      {
        int roll = round(random(1));
        if (canMoveDown == true && canMoveLeft == true)
        {
          if (roll == 0)
          {
            posX -= tS; // move left
          }
          else if (roll == 1)
          {
            posY += tS; //move down
          }
        }
        else if (canMoveLeft == true && canMoveDown == false)
        {
          posX -= tS; // move left
        }
        else if (canMoveLeft == false && canMoveDown == true)
        {
          posY += tS; //move down
        }
        else {} //stand still
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
  
  void reset()
  {
    posX = startPosX;
    posY = startPosY;
    HP = 3;
    alive = true;
  }
  
  void checkHealth ()
  {
    if (HP <= 0) {
      alive = false;
    }
  }
  
  void explode (Player a)
  {
    if (posX == a.posX && posY == a.posY && alive)
    {
      alive = false;
      frame = 0; //improves deavth animation
      deathStatement = dBySeeker;
      a.HP -= 2;
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