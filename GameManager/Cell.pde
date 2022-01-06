class Cell
{
  int row, col;

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
  }
}
