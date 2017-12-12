//terminology: b = border, B = Bottom, etc.
int bB = 640-64;
int bR = 1152-64;
int bL = 64;
int bT = 64;

float trapPosX [][] =
{
  //level 1 x pos
  {tS*6+h, tS*7+h, tS*14+h, tS*14+h, tS*14+h}, 
  //level 2 x pos
  {tS*1+h, tS*4+h, tS*14+h,}, 
  //level 4 x pos
  {tS*5+h, tS*5+h, tS*5+h, tS*5+h, tS*5+h, tS*7+h, tS*14+h,},  
  //level 5 x pos
  {tS*1+h, tS*1+h, tS*1+h, tS*2+h, tS*2+h, tS*2+h, tS*3+h, tS*3+h, tS*3+h, tS*3+h, tS*3+h, tS*4+h, tS*4+h, tS*5+h, tS*5+h, tS*5+h, tS*6+h, tS*6+h, tS*7+h, tS*7+h, tS*7+h, tS*8+h, tS*8+h, tS*9+h, tS*9+h, tS*10+h, tS*10+h, tS*10+h, tS*11+h, tS*11+h, tS*11+h, tS*11+h, tS*12+h, tS*12+h, tS*13+h, tS*13+h, tS*14+h, tS*14+h, tS*15+h, tS*15+h, tS*16+h, tS*16+h,}, 
};

float trapPosY [][] = 
{
  //level 1 y pos
  {tS*4+h, tS*7+h, tS*1+h, tS*4+h, tS*5+h}, 
  //level 2 y pos
  {tS*4+h, tS*2+h, tS*7+h,}, 
  //level 4 y pos
  {tS*4+h, tS*5+h, tS*6+h, tS*7+h, tS*8+h, tS*7+h, tS*3+h,}, 
  //level 5 y pos
  {tS*2+h, tS*6+h, tS*7+h, tS*1+h, tS*2+h, tS*3+h, tS*1+h, tS*2+h, tS*6+h, tS*7+h, tS*8+h, tS*3+h, tS*7+h, tS*3+h, tS*5+h, tS*6+h, tS*3+h, tS*4+h, tS*3+h, tS*5+h, tS*6+h, tS*3+h, tS*4+h, tS*3+h, tS*6+h, tS*3+h, tS*5+h, tS*6+h, tS*3+h, tS*4+h, tS*5+h, tS*6+h, tS*3+h, tS*6+h, tS*2+h, tS*7+h, tS*1+h, tS*8+h, tS*1+h, tS*8+h, tS*2+h, tS*3+h,}, 
};

float pitPosX[][] =
{
  //level 1 x pos
  {tS*1+h, tS*8+h, tS*8+h}, 
  //level 2 x pos
  {tS*4+h, tS*7+h, tS*8+h}, 
  //level 3 x pos
  {tS*14+h, tS*15+h, tS*15+h, tS*16+h}, 
  //level 4 x pos
  {tS*7+h, tS*7+h, tS*7+h, tS*8+h, tS*12+h, tS*12+h, tS*13+h, tS*13+h, tS*15+h, tS*15+h, tS*15+h, tS*16+h, tS*16+h, tS*16+h, tS*16+h, tS*16+h},
  //level 5 x pos
  {tS*4+h, tS*4+h, tS*5+h, tS*5+h, tS*5+h, tS*5+h, tS*6+h, tS*6+h, tS*6+h, tS*6+h, tS*7+h, tS*7+h, tS*7+h, tS*7+h, tS*8+h, tS*8+h, tS*8+h, tS*8+h, tS*9+h, tS*9+h, tS*9+h, tS*9+h, tS*10+h, tS*10+h, tS*10+h, tS*10+h, tS*11+h, tS*11+h, tS*11+h, tS*11+h, tS*12+h, tS*12+h, tS*12+h, tS*12+h, tS*13+h, tS*13+h}, 
};

float pitPosY[][] =
{
  //level 1 y pos
  {tS*5+h, tS*4+h, tS*5+h}, 
  //level 2 y pos
  {tS*1+h, tS*8+h, tS*8+h}, 
  //level 3 y pos
  {tS*6+h, tS*3+h, tS*6+h, tS*3+h}, 
  //level 4 y pos
  {tS*3+h, tS*4+h, tS*5+h, tS*5+h, tS*4+h, tS*5+h, tS*4+h, tS*5+h, tS*1+h, tS*3+h, tS*6+h, tS*1+h, tS*2+h, tS*3+h, tS*6+h, tS*7+h}, 
  //level 5 y pos
  {tS*1+h, tS*8+h, tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*1+h, tS*8+h},
};

float debrisPosX[][] =
{
  //level 1 x pos
  {tS*1+h, tS*1+h, tS*2+h, tS*5+h, tS*5+h, tS*6+h, tS*6+h, tS*6+h, tS*7+h, tS*7+h, tS*8+h, tS*8+h, tS*9+h, tS*9+h, tS*10+h, tS*10+h, tS*11+h, tS*11+h, tS*12+h, tS*14+h, tS*14+h, tS*14+h, tS*15+h, tS*15+h, tS*16+h, tS*16+h}, 
  //level 2 x pos
  {tS*2+h, tS*3+h, tS*3+h, tS*4+h, tS*9+h, tS*12+h, tS*12+h, tS*16+h}, 
  //level 3 x pos
  {tS*3+h, tS*3+h, tS*3+h, tS*3+h, tS*6+h, tS*6+h, tS*6+h, tS*6+h, tS*9+h, tS*9+h, tS*9+h, tS*9+h, tS*12+h, tS*12+h, tS*12+h, tS*12+h, tS*15+h, tS*16+h}, 
  //level 4 x pos
  {tS*5+h, tS*5+h, tS*5+h, tS*7+h, tS*7+h, tS*8+h, tS*9+h, tS*9+h, tS*10+h, tS*10+h, tS*10+h, tS*10+h, tS*10+h}, 
  //level 5 x pos
  {tS*1+h, tS*2+h, tS*2+h, tS*3+h, tS*4+h, tS*4+h, tS*6+h, tS*8+h, tS*8+h, tS*10+h, tS*12+h, tS*15+h, tS*15+h, tS*16+h, tS*16+h,}, 
};

float debrisPosY[][] =
{
  //level 1 y pos
  {tS*7+h, tS*8+h, tS*8+h, tS*5+h, tS*6+h, tS*1+h, tS*5+h, tS*6+h, tS*1+h, tS*2+h, tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*7+h, tS*8+h, tS*7+h, tS*8+h, tS*8+h, tS*2+h, tS*3+h, tS*6+h, tS*3+h, tS*6+h, tS*3+h, tS*6+h}, 
  //level 2 y pos
  {tS*3+h, tS*3+h, tS*7+h, tS*7+h, tS*4+h, tS*7+h, tS*8+h, tS*6+h}, 
  //level 3 y pos
  {tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*1+h, tS*2+h, tS*7+h, tS*8+h, tS*2+h, tS*6+h},
  //level 4 y pos
  {tS*1+h, tS*2+h, tS*3+h, tS*6+h, tS*8+h, tS*3+h, tS*3+h, tS*5+h, tS*1+h, tS*3+h, tS*4+h, tS*5+h, tS*8+h},
  //level 5 y pos
  {tS*3+h, tS*6+h, tS*8+h, tS*3+h, tS*4+h, tS*5+h, tS*5+h, tS*5+h, tS*6+h, tS*4+h, tS*5+h, tS*2+h, tS*7+h, tS*6+h, tS*7+h,}, 
};

float coinsPosX[][] =
{
  //level 1 x pos
  {tS*16+h}, 
  //level 2 x pos
  {tS*4+h, tS*16+h,}, 
  //level 3 x pos
  {tS*16+h, tS*16+h,}, 
  //level 4 x pos
  {tS*15+h, tS*16+h,}, 
  //level 5 x pos
  {tS*1+h, tS*1+h, tS*6+h, tS*16+h, tS*16+h}, 
};

float coinsPosY[][] =
{
  //level 1 y pos
  {tS*2+h,}, 
  //level 2 y pos
  {tS*8+h, tS*1+h,}, 
  //level 3 y pos
  {tS*2+h, tS*8+h,}, 
  //level 4 y pos
  {tS*2+h, tS*8+h,},
  //level 5 y pos
  {tS*1+h, tS*8+h, tS*6+h, tS*1+h, tS*8+h}, 
};

//mob positions
float goonPosX[][] =
{
  //level 1 x pos
  {tS*10+h, tS*13+h,}, 
  //level 2 x pos
  {tS*11+h,},
};

float goonPosY[][] =
{
  //level 1 x pos
  {tS*4+h, tS*7+h}, 
  //level 2 x pos
  {tS*3+h,},
};

float skeletonPosX[][] =
{
  //level 3 x pos
  {tS*4+h, tS*7+h, tS*14+h,}, 
  //level 4 x pos
  {tS*3+h,},
};

float skeletonPosY[][] =
{
  //level 3 x pos
  {tS*7+h, tS*1+h, tS*5+h,}, 
  //level 4 x pos
  {tS*8+h,},
};

float seekerPosX = tS*15+h;
float seekerPosY = tS*7+h;
float wraithPosX = tS*9+h;
float wraithPosY = tS*4+h;
float bossPosX = tS*14+h;
float bossPosY = tS*4+h;