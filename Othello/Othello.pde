int canvasSxze = 512;
float boardIndex = 8.0f;

color green = color(0, 140, 0);

PiceDraw piceDraw;

void setup()
{
  size(512, 512);
}

void draw()
{
  background(255);

  for (int x = 0; x < 8; x++)
  {
    for (int y = 0; y < 8; y++)
    {
      float posX, posY;
      float rectSize;

      posX = 512f * (x / boardIndex);
      posY = 512f * (y / boardIndex);

      rectSize = 512f * (1f / boardIndex);

      rectMode(CORNERS);

      fill(green);
      stroke(0);

      rect(posX, posY, posX + rectSize, posY + rectSize);

      if (x == 4 && y == 3)
      {
        piceDraw = new PiceDraw(posX, posY, rectSize);//1 == white, -1 == black
        piceDraw.Display(1);
      }
    }
  }
}
