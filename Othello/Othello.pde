int canvasSize = 512;
int fieldSize = 8;
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
  FieldManager();
  DebugDraw();
}

void draw()
{
  GridDraw();
}

void mousePressed()
{
  PutCell();
  DebugDraw();
}

void FieldManager()
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
  println("↓col/row→");
  println("  0    1    2    3    4    5    6    7");

  for (int a = 0; a < fieldSize; a++)
  {
    println(a + strPlus(field[a][0]) + strPlus(field[a][1]) + strPlus(field[a][2]) + strPlus(field[a][3]) + 
      strPlus(field[a][4]) + strPlus(field[a][5]) + strPlus(field[a][6]) + strPlus(field[a][7]));
    println(" ");
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

void PutCell()
{
  if (field[mousePos(mouseY)][mousePos(mouseX)] == 0)//nullでしか置けない
  {
    field[mousePos(mouseY)][mousePos(mouseX)] = hasStone;
    hasStone *= -1;
    EllipseDraw(hasStone, mousePos(mouseX), mousePos(mouseY));
  }
}

void EllipseDraw(int BlackORWhite, int x, int y)//0 = null, 1 == white. -1 == black
{
  if(BlackORWhite == 1)
  {
    fill(0);
  }
  else if(BlackORWhite == -1)
  {
    fill(255);
  }

  int cellX = x * (canvasSize / fieldSize) + ((canvasSize / fieldSize) / 2);
  int cellY = y * (canvasSize / fieldSize) + ((canvasSize / fieldSize) / 2);
  int cellSize = (canvasSize / fieldSize) - 10;

  ellipseMode(CENTER);
  ellipse(cellX, cellY, cellSize, cellSize);
}

void CellFlipCheck()
{
  
}
