int canvasSize = 512;
int fieldSize = 8;//8の倍数にすること
int cellSize;

int field[][];
int row;
int col;
int hasStone = 1;

String strPlus(int intValue)
{
  String strValue = new String("[" + intValue + "]" + ", ");

  return strValue;
}

int mousePos(float mousePos)
{
  int tempInt = floor(mousePos / (canvasSize / fieldSize));
  return tempInt;
}

void setup()
{
  size(512, 512);
  background(0, 140, 0);
  FieldSetUp();
  GridDraw();
  DebugDraw();
}

void draw()
{
}

void mousePressed()
{
  int row = mousePos(mouseX);
  int col = mousePos(mouseY);

  if (field[col][row] == 0)
  {
    field[col][row] = hasStone;
    CellDraw(row, col);
  }

  DebugDraw();

  int dirRow = 1;
  int dirCol = -1;

  for (int i = 0; i < 3; i++)
  {
    println("dirRow = " + dirRow + ", " + "dirCol = " + dirCol);
    dirRow--;
    dirCol++;
  }
}

void FieldSetUp()
{
  field = new int[fieldSize][fieldSize];

  for (row = 0; row < fieldSize; row++)
  {
    for (col = 0; col < fieldSize; col++)
    {
      field[row][col] = 0;//0 = null, 1 == white. -1 == black
    }
  }
}

void DebugDraw()
{
  println("");
  println("↓col/row→");

  for (int a = 0; a < fieldSize; a++)
  {
    if (a == 0) print("  ");
    print(a);
    if (a != fieldSize - 1)  print("    ");
  }

  println();

  for (int i = 0; i < fieldSize; i++)
  {
    if (i != 0)  println("");
    print(i);

    for (int j = 0; j < fieldSize; j++)
    {
      print(strPlus(field[i][j]));
    }

    println("");
  }
}

void GridDraw()
{
  float posX, posY;

  for (int i = 0; i < fieldSize; i++)
  {
    posX = (canvasSize / fieldSize);
    posY = (canvasSize / fieldSize);

    fill(255);
    strokeWeight(1);
    line(i * posX, width, i * posX, -width);//col
    line(height, i * posY, -height, i * posY);//row
  }
}

void CellDraw(int rowNum, int colNum)
{
  if (hasStone == 1)
  {
    fill(0);
  } else if (hasStone == -1)
  {
    fill(255);
  }

  hasStone *= -1;

  int cellX = rowNum * (canvasSize / fieldSize) + ((canvasSize / fieldSize) / 2);
  int cellY = colNum * (canvasSize / fieldSize) + ((canvasSize / fieldSize) / 2);
  int cellSize = (canvasSize / fieldSize) - 10;

  ellipseMode(CENTER);
  ellipse(cellX, cellY, cellSize, cellSize);
}

boolean CellCanPutCheck(int startRow, int startCol)//周りに何があるか検知
{
  boolean tempBool = false;
  int dirRow = 0;
  int dirCol = 0;

  for (int i = 0; i < 2; i++)
  {
    dirCol = 1;

    for (int j = 0; j < 2; j++)
    {
      dirRow = 1;
    }

    dirRow *= -1;
    dirCol *= -1;

    println("dirRow = " + dirRow + ", " + "dirCol = " + dirCol);
  }
  if (field[startCol + dirCol][startRow + dirRow] != 0)//上
  {
    tempBool = true;
  }

  if (field[startCol + 1][startRow + 1] != 0)
  {
  }

  return tempBool;

  /*
  
   1, 0上
   -1, 0下
   
   1, 1右上
   -1, -1右下
   
   0, 1右
   0, -1左
   
   1, -1左上;
   -1, -1左下
   
   */
}
