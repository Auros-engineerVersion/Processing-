class Board
{
  int boardIndex = 8;
  ArrayList<ArrayList> cells;

  Board()
  {
    cells = new ArrayList<ArrayList>();

    for (int row = 0; row < boardIndex; row++)//row == 行
    {
      ArrayList<Cell> rCell = new ArrayList<Cell>();

      for (int col = 0; col < boardIndex; col++)//col == 列
      {
        Cell cell = new Cell(col, row);
        rCell.add(cell);
      }

      cells.add(rCell);
    }
  }

  void Display()
  {
    for (ArrayList<ArrayList> row: cells)
    {
      for (Cell c: row)
      {
        c.Display();
      }
    }
  }
}
