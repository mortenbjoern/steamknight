/* === FUNCTIONS FOR DISPLAYING THE MENUS AND SCREENS, OTHER THAN THE MAIN GAME ===*/

String deathStatement = "Whoops, you died!";
String defaultDeathStatement = "Whoops, you died!"; //default death statement
String dByPit = "Don't go there another time!";
String dBySeeker = "Kabooom goes the knight!";
String dByGoon = "Argh, the pumpkin-face got you!";
String dBySkele = "Sliced by the undead, yikes!";
String dByTrap = "Haven't you learned to count?";
String dByWraith = "Take a lesson from Ghostbusters, then return!";


void displayMainMenu()
{
  textFont(bitmapFont);
  imageMode(CORNER);
  image(menuScreen, 0, 0);
  textAlign(LEFT);
  textSize(40);
  fill(255, 255, 255);
  text("Play", bL*1.5, bT*3.5);
  text("Highscore", bL*1.5, bT*4.5);
  textFont(cleanFont);
}

void displayDeathScreen()
{
  background(30);
  textAlign(CENTER);
  textSize(40);
  fill(255, 255, 255);
  text(deathStatement, width/2, bT*2);
  text("Wanna try again?", width/2, bT*3);

  //navigation
  noStroke();
  fill(255, 255, 255);
  rectMode(CENTER);
  rect(width/2-tS*2, bT*6-20, 192, 72);
  rect(width/2+tS*2, bT*6-20, 192, 72);

  textSize(64);
  fill(30, 30, 30);
  text("YES!", (width/2)-tS*2, bT*6);
  text("No...", (width/2)+tS*2, bT*6);
}

void displayVictoryScreen()
{
  background(30);
  textAlign(CENTER);
  textSize(40);
  fill(255, 255, 255);
  text("Congratulations, you won the game!", width/2, bT*2);
  textSize(80);
  text(score, width/2, bT*4.5);
  text(name, width/2, bT*6);
  textSize(24);
  fill(60, 60, 50);
  text("(Please enter your credentials)", width/2, bT*7);
  fill(255, 255, 255);
  text("Press ENTER to see if you're on the highscore list!", width/2, bT*9);
}

void displayHighscoreScreen ()
{
  background(30);
  textAlign(CENTER);
  textSize(40);
  fill(255, 255, 255);
  text("HIGHSCORE", width/2, bT);

  //display highscore list here//
  int i;
  for (i=0; i<scoring.length; i++)
  {
    textSize(25);
    text(HiScoreName[i]+" "+scoring[i], width/2, (bT*1.5)+20+(40*i));
  }

  noStroke();
  fill(255, 255, 255);
  rectMode(CENTER);
  rect(width/2, bT*9, tS*3, tS);
  textSize(32);
  fill(30, 30, 30);
  text("Menu", (width/2), bT*9+10);
}


/* === FUNCTIONS FOR NAVIGATION AROUND THE MENUS AND SUBMITTING YOUR SCORE TO THE HIGHSCORE LIST === */
void mousePressed()
{
  pres.play();
  if (screen == 0 //start the game
    && mouseX > 94
    && mouseX < 228
    && mouseY > 175
    && mouseY < 225
    )
  {
    hardReset();
    screen = 1;
  }

  if (screen == 0 //go to the hiscore list
    && mouseX > 94
    && mouseX < 430
    && mouseY > 240
    && mouseY < 275
    )
  {
    hardReset();
    screen = 4;
  }

  if (screen == 2 //you restart the game
    && mouseX > 352
    && mouseX < 544
    && mouseY > 328
    && mouseY < 400
    )
  {
    hardReset();
    screen = 1;
  }
  if (screen == 2 //you go to the main menu
    && mouseX > 608
    && mouseX < 800
    && mouseY > 328
    && mouseY < 400
    )
  {
    hardReset();
    screen = 0;
  }


  if (screen == 3 //you click the left button on the victory screen
    && mouseX > (width/2-tS*2)-192/2
    && mouseX < ((width/2-tS*2)+ 192)
    && mouseY > (bT*7-20)-72/2
    && mouseY < ((bT*7-20)+ 72)
    )
  {
    hardReset();
    screen = 0;
  }

  if (screen == 3 //you click the right button on the death screen
    && mouseX > (width/2+tS*2)-192/2
    && mouseX < ((width/2+tS*2)+ 192)
    && mouseY > (bT*7-20)-72/2
    && mouseY < ((bT*7-20)+ 72)
    )
  {
    hardReset();
    screen = 1;
  }

  if (screen == 4 
    && mouseX > (width/2) - tS*1.5
    && mouseX < (width/2) + tS*1.5
    && mouseY > bT*9-tS*0.5
    && mouseY < bT*9+tS*0.5
    )
  {
    hardReset();
    screen = 0;
  }
}

void addToHiScore(String PlayerName, int gameScore)
{
  int i;

  for (i=0; i < scoring.length; i++)
  {
    if (gameScore >= int(scoring[i]))
    {
      scoring = splice(scoring, str(gameScore), i);
      HiScoreName = splice(HiScoreName, PlayerName, i);
      scoring = shorten(scoring);
      HiScoreName = shorten(HiScoreName);
      i = scoring.length;
    }
  }
}

void submitName ()
{
  if (screen == 3 && key == RETURN || screen == 3 && key == ENTER)
  {
    String name = join(initials, "");
    addToHiScore(name, score);

    clik.play();

    saveStrings("data/hiscorenames.txt", HiScoreName);
    saveStrings("data/hiscores.txt", scoring);

    hardReset();
    screen = 4;
  }
}

void enterLetters ()
{
  if (screen == 3)
  {
    for (int k = 0; k < letters.length; k++)
    {
      if (key == letters[k])
      {
        pres.play();
        initials[initialsPos] = str(letters[k]);
        name = join(initials, "");
        initialsPos++;
        if (initialsPos > 2)
        {
          initialsPos = 2;
        }
      } else if (key == letters[k] && initialsPos == 3 && keyPressed == false)
      {
        initials[initialsPos] = str(letters[k]);
        name = join(initials, "");
      }
    }
  }
}

void deleteInput ()
{
  if (screen == 3 && key == BACKSPACE)
  {
    if (initialsPos == 2 && initials[2] != "_")
    {
      delete.play();
      initials[2] = "_";
      name = join(initials, "");
      keyPressed = false;
    } else if (initialsPos == 2 && initials[initialsPos] == "_")
    {
      delete.play();
      initialsPos -= 1;
      initials[initialsPos] = "_";
      name = join(initials, "");
      keyPressed = false;
    } else if (initialsPos == 1 && initials[initialsPos] == "_")
    {
      delete.play();
      initialsPos -= 1;
      initials[initialsPos] = "_";
      name = join(initials, "");
      keyPressed = false;
    }
  }
}