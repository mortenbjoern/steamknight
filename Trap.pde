class Trap {
  float posX;
  float posY;
  int trapCounter;
  PImage spiketrap = loadImage("assets/spikes.png");
  PImage lavatrap = loadImage("assets/lava_trap.png");

  Trap (float x, float y)
  {
    posX = x;
    posY = y;
    trapCounter = round(random(2));
  }

  void setPos (float x, float y) {
    posX = x;
    posY = y;
  }

  void display (float x, int y) 
  {
    switch(level)
    {
    case 0:
      imageMode(CENTER);
      PImage frame = spiketrap.get(0 + (int(x)*y), 0, 64, 64);
      image(frame, posX, posY);
      break;
      
    case 1:
      imageMode(CENTER);
      PImage frame1 = spiketrap.get(0 + (int(x)*y), 0, 64, 64);
      image(frame1, posX, posY);
      break;
      
    case 2:
      imageMode(CENTER);
      PImage frame2 = spiketrap.get(0 + (int(x)*y), 0, 64, 64);
      image(frame2, posX, posY);
      break;
      
    case 3:
      imageMode(CENTER);
      PImage frame3 = spiketrap.get(0 + (int(x)*y), 0, 64, 64);
      image(frame3, posX, posY);
      break;
      
    case 4:
      imageMode(CENTER);
      PImage frame4 = lavatrap.get(0 + (int(x)*y), 0, 64, 64);
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
  } // end class