class Board()
{
  Board()
  {
  }

  void Display(float posX, float posY, float size)//四角形を書く
  {
    strokeWeight(gridStrokeWeight);
    fill(greenLight);

    rectMode(CORNERS);
    rect(posX, posY, posX + size, posY + size);
  }
}
