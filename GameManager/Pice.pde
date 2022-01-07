class Pice
{
  float ellipseX, ellipseY;
  float ellipseSize;

  Pice(float tempX, float tempY, float tempSize)
  {
    ellipseX = tempX;
    ellipseY = tempY;
    ellipseSize = tempSize;
  }

  void Display(int blackORwhite)//1 == white, -1 == black
  {
    noStroke();
    ellipseMode(CORNERS);

    if (blackORwhite == 1)
    {
      fill(255);
      ellipse(ellipseX, ellipseY, ellipseX + ellipseSize, ellipseY + ellipseSize);
    } else if (blackORwhite == -1)
    {
      fill(0);
      ellipse(ellipseX, ellipseY, ellipseX + ellipseSize, ellipseY + ellipseSize);
    }
  }
}
