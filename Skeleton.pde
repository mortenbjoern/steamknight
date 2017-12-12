class Skeleton {
  boolean alive = true;
  boolean isAttacking = false;
  boolean revivalAnimation = false;
  float posX;
  float posY;
  float oldX;
  float oldY;
  int HP = 1;
  int revivalCounter = 0;
  int revivalTime = 0;
  boolean canMoveUp = true;
  boolean canMoveDown = true;
  boolean canMoveRight = true;
  boolean canMoveLeft = true;
  int frame = 0;
  int maxF = 8;
  int frame1 = 0;
  int maxF1 = 8;
  float everyMillis = 250;
  float everyMillisAttack = 125;
  int ticksLast = millis();
  PImage skeleton = loadImage("assets/skeleton_standing.png");
  PImage skeleton_death = loadImage("assets/skeleton_death.png");
  PImage skeleton_attack = loadImage("assets/skeleton_attack.png");
  PImage skeleton_revival = loadImage("assets/skeleton_resurrect.png");

  Skeleton (float x, float y)
  {
    posX = x;
    posY = y;
  }

  void display (float x) 
  {
    if (alive && revivalAnimation != true && isAttacking != true)
    {
      imageMode(CENTER);
      PImage f = skeleton.get(frame*int(x), 0, int(x), int(x));
      image(f, posX, posY);

      int delta = millis() - ticksLast;

      if (delta >= everyMillis)
      {
        frame++;
        if (frame >= maxF/2)
        {
          frame = 0;
        }

        ticksLast = millis();
      }
    }
    else if (alive == false)
    {
      imageMode(CENTER);
      PImage f = skeleton_death.get(frame*int(x), 0, int(x), int(x));
      image(f, posX, posY);

      int delta = millis() - ticksLast;

      if (delta >= everyMillis)
      {
        frame++;
        if (frame >= maxF)
        {
          frame = maxF-1;
        }

        ticksLast = millis();
      }
    }
    else if (revivalAnimation == true)
    {
      imageMode(CENTER);
      PImage f = skeleton_revival.get(frame1*int(x), 0, int(x), int(x));
      image(f, posX, posY);

      int delta = millis() - ticksLast;

      if (delta >= everyMillis)
      {
        frame1++;
        if (frame1 >= maxF1)
        {
          revivalAnimation = false;
          frame1 = 0;
          frame = 0;
        }

        ticksLast = millis();
      }
    } if (isAttacking)
    {
      imageMode(CENTER);
      PImage f = skeleton_attack.get(int(frame*x), 0, int(x), int(x));
      image(f, posX, posY);

      int delta = millis() - ticksLast;

      if (delta >= everyMillis)
      {
        frame++;
        if (frame >= maxF/2)
        {
          isAttacking = false;
          frame = 0;
        }
        ticksLast = millis();
      }
    }
  }

  void move(float x, float y, int z, Player a)
  {
    if (z % 2 == 0 && alive == true) //round(random(1,2))
    {
      
      //-----> LEFT MOVEMENT / ATTACKS START HERE <-----//
      
      
      if (posX-tS == x && posY == y)
      {
        isAttacking = true;
        deathStatement = dBySkele;
        a.HP -=1;
      }
      
      else if (posX > x && (posX-x)>(posY - y) && canMoveLeft == true)
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
      
      else if (posX+tS == x && posY == y)
      {
        isAttacking = true;
        deathStatement = dBySkele;
        a.HP -=1;
      }
      
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
      
      else if (posY-tS == y && posX == x)
      {
        isAttacking = true;
        deathStatement = dBySkele;
        a.HP -=1;
      }
      
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
      
      else if (posY+tS == y && posX == x)
      {
        isAttacking = true;
        deathStatement = dBySkele;
        a.HP -=1;
      }
      
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
  
  void revive ()
  {
    if(alive == false && revivalCounter < 5)
    {
     revivalCounter++;
    }
    else if (revivalCounter == 5)
    {
      revivalAnimation = true;
      revivalCounter = 0;
      HP = 1;
      alive = true;
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

  boolean checkPit (float x, float y)
  {
    if (posX == x && posY == y) //add: || oldX+tS == entityPos);
    {
      return true;
    } else {
      return false;
    }
  } // end checkColD

  boolean checkTrap (float x, float y, boolean z)
  {
    if (posX == x && posY == y && z == true) //add: || oldX+tS == entityPos);
    {
      return true;
    } else {
      return false;
    }
  } // end checkColD

  float getX ()
  {
    return posX;
  }

  float getY ()
  {
    return posY;
  }
} // end class