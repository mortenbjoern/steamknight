class Player {
  boolean alive = true;
  float oldX = tS+(tS/2);
  float oldY = tS+(tS/2);
  float posX = tS+(tS/2);
  float posY = tS+(tS/2);
  boolean canMoveUp = true;
  boolean canMoveDown = true;
  boolean canMoveRight = true;
  boolean canMoveLeft = true;
  boolean isAttacking = false;
  float maxHP = 3;
  int HP = 3;
  int frame = 0;
  int maxF = 4;
  int frame1 = 0;
  int maxF1 = 10;
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

  void displayMeta (float x, int y) 
  {
    //textFont();
    //display hp
    imageMode(CENTER);
    PImage frame = hearts.get(0, 0 + (int(x/4)*(y-1)), 48, 16);
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
      }
    } else if (posX-tS == b.posX && posY == b.posY)
    {
      b.HP -= 1;
      if (b.HP <= 0) {
        b.alive = false;
      }
    } else if (posX-tS == c.posX && posY == c.posY)
    {
      c.HP -= 1;
      if (c.HP <= 0) {
        c.alive = false;
      }
    } else if (posX-tS == c.posX && posY == d.posY)
    {
      d.HP -= 1;
      if (d.HP <= 0) {
        d.alive = false;
      }
    } else if (posX-tS == d.posX && posY == e.posY)
    {
      e.HP -= 1;
      if (e.HP <= 0) {
        e.alive = false;
      }
    } else if (posX-tS == f.posX && posY == f.posY)
    {
      f.HP -= 1;
      if (f.HP <= 0) {
        f.alive = false;
      }
    } else if (posX-tS == g.posX && posY == g.posY)
    {
      g.HP -= 1;
      if (g.HP <= 0) {
        g.alive = false;
      }
    } else if (posX-tS == h.posX && posY == h.posY)
    {
      h.HP -= 1;
      if (h.HP <= 0) {
        h.alive = false;
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
    } else if (posX+tS == b.posX && posY == b.posY)
    {
      b.HP -= 1;
      if (b.HP <= 0) {
        b.alive = false;
      }
    } else if (posX+tS == c.posX && posY == c.posY)
    {
      c.HP -= 1;
      if (c.HP <= 0) {
        c.alive = false;
      }
    } else if (posX+tS == d.posX && posY == d.posY)
    {
      d.HP -= 1;
      if (d.HP <= 0) {
        d.alive = false;
      }
    } else if (posX+tS == e.posX && posY == e.posY)
    {
      e.HP -= 1;
      if (e.HP <= 0) {
        e.alive = false;
      }
    } else if (posX+tS == f.posX && posY == f.posY)
    {
      f.HP -= 1;
      if (f.HP <= 0) {
        f.alive = false;
      }
    } else if (posX+tS == g.posX && posY == g.posY)
    {
      g.HP -= 1;
      if (g.HP <= 0) {
        g.alive = false;
      }
    } else if (posX+tS == h.posX && posY == h.posY)
    {
      h.HP -= 1;
      if (h.HP <= 0) {
        h.alive = false;
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
    } else if (posY-tS == b.posY && posX == b.posX)
    {
      b.HP -= 1;
      if (b.HP <= 0) {
        b.alive = false;
      }
    } else if (posY-tS == c.posY && posX == c.posX)
    {
      c.HP -= 1;
      if (c.HP <= 0) {
        c.alive = false;
      }
    } else if (posY-tS == d.posY && posX == d.posX)
    {
      d.HP -= 1;
      if (d.HP <= 0) {
        d.alive = false;
      }
    } else if (posY-tS == e.posY && posX == e.posX)
    {
      e.HP -= 1;
      if (e.HP <= 0) {
        e.alive = false;
      }
    } else if (posY-tS == f.posY && posX == f.posX)
    {
      f.HP -= 1;
      if (f.HP <= 0) {
        f.alive = false;
      }
    } else if (posY-tS == g.posY && posX == g.posX)
    {
      g.HP -= 1;
      if (g.HP <= 0) {
        g.alive = false;
      }
    } else if (posY-tS == h.posY && posX == h.posX)
    {
      h.HP -= 1;
      if (h.HP <= 0) {
        h.alive = false;
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
      }
    } else if (posY+tS == b.posY && posX == b.posX)
    {
      b.HP -= 1;
      if (b.HP <= 0) {
        b.alive = false;
      }
    } else if (posY+tS == c.posY && posX == c.posX)
    {
      c.HP -= 1;
      if (c.HP <= 0) {
        c.alive = false;
      }
    } else if (posY+tS == d.posY && posX == d.posX)
    {
      d.HP -= 1;
      if (d.HP <= 0) {
        d.alive = false;
      }
    } else if (posY+tS == e.posY && posX == e.posX)
    {
      e.HP -= 1;
      if (e.HP <= 0) {
        e.alive = false;
      }
    } else if (posY+tS == f.posY && posX == f.posX)
    {
      f.HP -= 1;
      if (f.HP <= 0) {
        f.alive = false;
      }
    } else if (posY+tS == g.posY && posX == g.posX)
    {
      g.HP -= 1;
      if (g.HP <= 0) {
        g.alive = false;
      }
    } else if (posY+tS == h.posY && posX == h.posX)
    {
      h.HP -= 1;
      if (h.HP <= 0) {
        h.alive = false;
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
} // end class