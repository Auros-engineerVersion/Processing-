int canvasSize = 512;
int fieldSize = 8;

int field[][];
int row;
int col;

String strPlus(int intValue)
{
  String l = "[";
  String r = "]";
  String m = ", ";
  String strValue = null;

  strValue = new String(l + intValue + r + m);

  return strValue;
}

void setup()
{
  size(512, 512);
  FieldManager();
  PutCell();
}

void draw()
{
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

  DebugDraw();
}

void DebugDraw()
{
  println("↓col/row→");
  println("  1    2    3    4    5    6    7    8");
                               
  for (int a = 0; a < fieldSize; a++)
  {
    println((a + 1) + strPlus(field[a][0]) + strPlus(field[a][1]) + strPlus(field[a][2]) + strPlus(field[a][3]) + 
      strPlus(field[a][4]) + strPlus(field[a][5]) + strPlus(field[a][6]) + strPlus(field[a][7]));
      println(" ");
  }
}

void PutCell()//この二つのintはUIを作るまでの一時的なもの,
{
  field[3][4] = 1;
  field[4][3] = -1;
}
