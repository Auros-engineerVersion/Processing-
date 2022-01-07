class Cell
{
  int col;
  int row;
  int hasStone = 0;

  Cell(int colNum, int rowNum)
  {
    col = colNum;
    row = rowNum;
  }

  void Display()
  {
    float posX, posY;
    float rowF, colF;
    float rectSize;

    rowF = row;
    colF = col;

    posX = 512f * (rowF / boardIndex);
    posY = 512f * (colF / boardIndex);

    rectSize = 512f * (1f / boardIndex);

    rectMode(CORNERS);

    fill(green);
    stroke(0);

    rect(posX, posY, posX + rectSize, posY + rectSize);

    if (hasStone != 0)
    {
      noStroke();

      if (hasStone == 1)
      {
        fill(0);
      } else
      {
        fill(255);
      }

      Pice pice = new Pice(posX, posY, rectSize);
      pice.Display(hasStone);
    }
  }

  void PutStone(int stoneColor)
  {
    hasStone = stoneColor;
  }
}
