class Particles {
  
  float posX = random(width);
  float posY = random(-10000, -720);
  float velocityX = 0;
  float velocityY = 240;
  int ticksLast = millis();
  color c;
 
  Particles (color x, float y1, float y2, float z)
  {
    c = x;
    posY = z;
    velocityX = y1;
    velocityY = y2;
  }
    
  void display()
  {
    stroke(c);
    strokeWeight(2);
    line(posX, posY, posX, posY+3);
  }
  
  void update()
  {
    posX += velocityX * float(millis() - ticksLast) * 0.002;
    posY += velocityY * float(millis() - ticksLast) * 0.002;
    if (posY > height+10)
    {
      posY = random(-720);
    }
    if (posX < 0)
    {
      posX = width;
    }
    ticksLast = millis();
  }
}