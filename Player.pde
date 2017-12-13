class Player {
  //player booleans
  boolean alive = true;
  boolean isAttacking = false;
  boolean canMoveUp = true;
  boolean canMoveDown = true;
  boolean canMoveRight = true;
  boolean canMoveLeft = true;
  
  //player position
  float oldX;
  float oldY;
  float posX;
  float posY;
  
  //player condition
  byte HP = 3;
  byte maxHP = 3;
  byte mobKills = 0;
  byte pickUps = 0;
  
  //player animation
  byte frame = 0;
  byte maxF = 4;
  byte frame1 = 0;
  byte maxF1 = 10;
  float everyMillis = 250;
  float everyMillisAttack = 62.5;
  int ticksLast = millis();
  PImage hero = loadImage("assets/hero_standing.png");
  PImage hero_attack = loadImage("assets/hero_attack.png");
  PImage hearts = loadImage("assets/hearts.png");


  Player () {
  } //player constructor

  void display (float x) 
  {
    if (alive && isAttacking != true)
    {
      imageMode(CENTER);
      PImage f = hero.get(int(frame*x), 0, int(x), int(x));
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
    } if (isAttacking)
    {
      imageMode(CENTER);
      PImage f = hero_attack.get(int(frame1*x), 0, int(x), int(x));
      image(f, posX, posY);

      int delta = millis() - ticksLast;

      if (delta >= everyMillisAttack)
      {
        frame1++;
        if (frame1 >= maxF1)
        {
          isAttacking = false;
          frame = 0;
          frame1 = 0;
        }
        ticksLast = millis();
      }
    }
  } // end display()

  void displayMeta (float x) 
  {
    //textFont();
    //display hp
    imageMode(CENTER);
    PImage frame = hearts.get(0, 0 + int(x/2)*(HP-1), 48, 16);
    image(frame, 400, 606);

    //display current level
    fill(255, 255, 255);
    textAlign(LEFT);
    textSize(10);
    text("Level: " + (level+1), 440, 610);

    //display moves
    fill(255, 255, 255);
    textAlign(LEFT);
    textSize(10);
    text("Moves: " + moves, 490, 610);

    //display score
    fill(255, 255, 255);
    textAlign(LEFT);
    textSize(10);
    text("Score: " + score, 560, 610);
  }

  void attackL (Goon a, Goon b, Goon c, Seeker d, Skeleton e, Skeleton f, Skeleton g, Skeleton h)
  {
    isAttacking = true;
    slash.play();
    if (posX-tS == a.posX && posY == a.posY)
    {
      a.HP -= 1;
      if (a.HP <= 0) {
        a.alive = false;
        mobKills++;
      }
    } else if (posX-tS == b.posX && posY == b.posY)
    {
      b.HP -= 1;
      if (b.HP <= 0) {
        b.alive = false;
        mobKills++;
      }
    } else if (posX-tS == c.posX && posY == c.posY)
    {
      c.HP -= 1;
      if (c.HP <= 0) {
        c.alive = false;
        mobKills++;
      }
    } else if (posX-tS == c.posX && posY == d.posY)
    {
      d.HP -= 1;
      if (d.HP <= 0) {
        d.alive = false;
        mobKills++;
      }
    } else if (posX-tS == d.posX && posY == e.posY)
    {
      e.HP -= 1;
      if (e.HP <= 0) {
        e.alive = false;
        mobKills++;
      }
    } else if (posX-tS == f.posX && posY == f.posY)
    {
      f.HP -= 1;
      if (f.HP <= 0) {
        f.alive = false;
        mobKills++;
      }
    } else if (posX-tS == g.posX && posY == g.posY)
    {
      g.HP -= 1;
      if (g.HP <= 0) {
        g.alive = false;
        mobKills++;
      }
    } else if (posX-tS == h.posX && posY == h.posY)
    {
      h.HP -= 1;
      if (h.HP <= 0) {
        h.alive = false;
        mobKills++;
      }
    }
  }

  void attackR (Goon a, Goon b, Goon c, Seeker d, Skeleton e, Skeleton f, Skeleton g, Skeleton h)
  {
    isAttacking = true;
    slash.play();
    if (posX+tS == a.posX && posY == a.posY)
    {
      a.HP -= 1;
      if (a.HP <= 0) {
        a.alive = false;
        mobKills++;
      }
    } else if (posX+tS == b.posX && posY == b.posY)
    {
      b.HP -= 1;
      if (b.HP <= 0) {
        b.alive = false;
        mobKills++;
      }
    } else if (posX+tS == c.posX && posY == c.posY)
    {
      c.HP -= 1;
      if (c.HP <= 0) {
        c.alive = false;
        mobKills++;
      }
    } else if (posX+tS == d.posX && posY == d.posY)
    {
      d.HP -= 1;
      if (d.HP <= 0) {
        d.alive = false;
        mobKills++;
      }
    } else if (posX+tS == e.posX && posY == e.posY)
    {
      e.HP -= 1;
      if (e.HP <= 0) {
        e.alive = false;
        mobKills++;
      }
    } else if (posX+tS == f.posX && posY == f.posY)
    {
      f.HP -= 1;
      if (f.HP <= 0) {
        f.alive = false;
        mobKills++;
      }
    } else if (posX+tS == g.posX && posY == g.posY)
    {
      g.HP -= 1;
      if (g.HP <= 0) {
        g.alive = false;
        mobKills++;
      }
    } else if (posX+tS == h.posX && posY == h.posY)
    {
      h.HP -= 1;
      if (h.HP <= 0) {
        h.alive = false;
        mobKills++;
      }
    }
  }

  void attackU (Goon a, Goon b, Goon c, Seeker d, Skeleton e, Skeleton f, Skeleton g, Skeleton h)
  {
    isAttacking = true;
    slash.play();
    if (posY-tS == a.posY && posX == a.posX)
    {
      a.HP -= 1;
      if (a.HP <= 0) {
        a.alive = false;
        mobKills++;
      }
    } else if (posY-tS == b.posY && posX == b.posX)
    {
      b.HP -= 1;
      if (b.HP <= 0) {
        b.alive = false;
        mobKills++;
      }
    } else if (posY-tS == c.posY && posX == c.posX)
    {
      c.HP -= 1;
      if (c.HP <= 0) {
        c.alive = false;
        mobKills++;
      }
    } else if (posY-tS == d.posY && posX == d.posX)
    {
      d.HP -= 1;
      if (d.HP <= 0) {
        d.alive = false;
        mobKills++;
      }
    } else if (posY-tS == e.posY && posX == e.posX)
    {
      e.HP -= 1;
      if (e.HP <= 0) {
        e.alive = false;
        mobKills++;
      }
    } else if (posY-tS == f.posY && posX == f.posX)
    {
      f.HP -= 1;
      if (f.HP <= 0) {
        f.alive = false;
        mobKills++;
      }
    } else if (posY-tS == g.posY && posX == g.posX)
    {
      g.HP -= 1;
      if (g.HP <= 0) {
        g.alive = false;
        mobKills++;
      }
    } else if (posY-tS == h.posY && posX == h.posX)
    {
      h.HP -= 1;
      if (h.HP <= 0) {
        h.alive = false;
        mobKills++;
      }
    }
  }

  void attackD (Goon a, Goon b, Goon c, Seeker d, Skeleton e, Skeleton f, Skeleton g, Skeleton h)
  {
    isAttacking = true;
    slash.play();
    if (posY+tS == a.posY && posX == a.posX)
    {
      a.HP -= 1;
      if (a.HP <= 0) {
        a.alive = false;
        mobKills++;
      }
    } else if (posY+tS == b.posY && posX == b.posX)
    {
      b.HP -= 1;
      if (b.HP <= 0) {
        b.alive = false;
        mobKills++;
      }
    } else if (posY+tS == c.posY && posX == c.posX)
    {
      c.HP -= 1;
      if (c.HP <= 0) {
        c.alive = false;
        mobKills++;
      }
    } else if (posY+tS == d.posY && posX == d.posX)
    {
      d.HP -= 1;
      if (d.HP <= 0) {
        d.alive = false;
        mobKills++;
      }
    } else if (posY+tS == e.posY && posX == e.posX)
    {
      e.HP -= 1;
      if (e.HP <= 0) {
        e.alive = false;
        mobKills++;
      }
    } else if (posY+tS == f.posY && posX == f.posX)
    {
      f.HP -= 1;
      if (f.HP <= 0) {
        f.alive = false;
        mobKills++;
      }
    } else if (posY+tS == g.posY && posX == g.posX)
    {
      g.HP -= 1;
      if (g.HP <= 0) {
        g.alive = false;
        mobKills++;
      }
    } else if (posY+tS == h.posY && posX == h.posX)
    {
      h.HP -= 1;
      if (h.HP <= 0) {
        h.alive = false;
        mobKills++;
      }
    }
  }

  void update () //called after each move. Important in collision detection methods
  {
    oldX = posX;
    oldY = posY;
    canMoveUp = true;
    canMoveDown = true;
    canMoveRight = true;
    canMoveLeft = true;
  }
  
  void reset() {
    HP = 3;
    pickUps = 0;
    mobKills = 0;
    frame = 0;
    frame1 = 0;
  }
  
  void checkHealth ()
  {
    if (HP <= 0) {
      screen = 2;
    }
  }
  
  void setStartPos ()
  {
    switch (level)
    {
      case 0:
      posX = tS+h;
      posY = tS+h;
      break;
      case 1:
      posX = tS+h;
      posY = tS+h;
      break;
      case 2:
      posX = tS+h;
      posY = tS+h;
      break;
      case 3:
      posX = tS+h;
      posY = tS*4+h;
      break;
      case 4:
      posX = tS+h;
      posY = tS*4+h;
      break;
    }
  }

  boolean checkColR (/* float x, float y */)
  {
    if (oldX+tS > bR /* || (oldX+tS == x && oldY == y) */) //add: || oldX+tS == entityPos);
    {
      return true;
    } else
    {
      return false;
    }
  } // end checkColR

  boolean checkColL (/* float x, float y */)
  {
    if (oldX-tS < bL /* || (oldX-tS == x && oldY == y) */ ) //add: || oldX+tS == entityPos);
    {
      return true;
    } else {
      return false;
    }
  } // end checkColL

  boolean checkColU (/* float x, float y */)
  {
    if (oldY-tS < bT /* || (oldY-tS == y && oldX == x) */) //add: || oldX+tS == entityPos);
    {
      return true;
    } else {
      return false;
    }
  } // end checkColU

  boolean checkColD (/* float x, float y */)
  {
    if (oldY+tS > bB /* || (oldY+tS == y && oldX == x) */) //add: || oldX+tS == entityPos);
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
} // end class