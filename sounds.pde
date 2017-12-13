//Libraries to be imported
import processing.sound.*;

boolean playmusic = true;

//Sound loading repository
SoundFile menu;
SoundFile coin;
SoundFile clik;
SoundFile slash;
SoundFile pres;
SoundFile delete;
SoundFile move;
SoundFile goonie;

void level1music(SoundFile a)
{
  if (screen == 0 && playmusic == true)
  {
    a.loop();
    playmusic = false;
  }
  if (level != 0 && playmusic == false)
  {
    a.stop();
    playmusic = true;
  }
}