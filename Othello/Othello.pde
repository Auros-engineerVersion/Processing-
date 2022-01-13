int boundSize = 2;
int fieldSize = 8 + 2;
int canvasSize = 512;

int cellSize;

int field[][];
int row;
int col;
int hasStone = -1;

String strPlus(int intValue)
{
  String strValue;

  if (intValue != 2)
  {
    strValue = new String("[" + intValue + "]" + ", ");
    return strValue;
  } else
  {
    strValue = new String("<" + intValue + ">" + ", ");
  }

  return strValue;
}

int mousePos(float mousePos)//ここで設置する場所を決める
{
  int tempInt = floor(mousePos / (canvasSize / fieldSize));
  return tempInt;
}

boolean isEmpty(int startRow, int startCol)//置く場所が空いているか
{
  if (field[startRow][startCol] == 0)
  {
    return true;
  } else
  {
    return false;
  }
}

boolean isCellExist(int startRow, int startCol)//四方八方に駒があるか検知
{
  boolean tempBool = false;

  for (int dirRow = -1; dirRow < 2; dirRow++)
  {
    for (int dirCol = -1; dirCol < 2; dirCol++)
    {
      if (field[startRow + dirRow][startCol + dirCol] != 0 &&
        field[startRow + dirRow][startCol + dirCol] != 2)
      {
        tempBool = true;
      } else
      {
        tempBool = false;
      }
    }
  }

  return tempBool;
}

boolean isSameColor(int startRow, int startCol, int stoneColor)//色が同じか検知
{
  boolean tempBool = false;
  for (int dirRow = -1; dirRow < 2; dirRow++)
  {
    for (int dirCol = -1; dirCol < 2; dirCol++)
    {
      if (field[startRow + dirRow][startCol + dirCol] == stoneColor)
      {
        tempBool = true;

        //色が同じものの座標とhasStoneを出力
        println("色が同じ " + "row = " + (startRow + dirRow) +  ", " + "col = " + (startCol + dirCol)
          + ", " + "stoneColor = " + field[startRow + dirRow][startCol + dirCol]);
      } else
      {
        tempBool = false;
      }
    }
  }

  return tempBool;
}

void setup()
{
  size(512, 512);
  background(0, 140, 0);
  FieldSetUp();
  DebugDraw();
}

void draw()
{
  GridDraw();

  for (int rowNum = 0; rowNum < fieldSize; rowNum++)
  {
    for (int colNum = 0; colNum < fieldSize; colNum++)
    {
      if (field[rowNum][colNum] != 0 && field[rowNum][colNum] != 2)
      {
        CellDraw(rowNum, colNum);
      }
    }
  }
}

void mousePressed()
{
  PutCell();
}

void FieldSetUp()
{
  int iniPos = ((fieldSize) / 2) - 1;
  int rowNum = 0;//rowのみList形式のため

  field = new int[fieldSize][fieldSize];

  for (row = 0; row < fieldSize; row++)
  {
    rowNum++;
    for (col = 0; col < fieldSize; col++)
    {

      if ((row == 0 || col == 0) ||
        (row == fieldSize - 1) || (col == fieldSize - 1))
      {
        field[row][col] = 2;
      } else
      {
        field[row][col] = 0;
      }
    }
  }

  //初期値
  field[iniPos][iniPos] = hasStone;//white
  println(hasStone);
  CellDraw(iniPos, iniPos);
  hasStone *= -1;

  field[iniPos + 1][iniPos] = hasStone;//black
  println(hasStone);
  CellDraw(iniPos + 1, iniPos);
  hasStone *= -1;

  field[iniPos + 1][iniPos + 1] = hasStone;//white
  println(hasStone);
  CellDraw(iniPos + 1, iniPos + 1);
  hasStone *= -1;

  field[iniPos][iniPos + 1] = hasStone;//black
  println(hasStone);
  CellDraw(iniPos, iniPos + 1);
  hasStone *= -1;
}

void DebugDraw()
{
  println("");
  println("↓col/row→");

  for (int rowID = 0; rowID < fieldSize; rowID++)//↓col/row→のナンバーを表示
  {
    if (rowID == 0) print("  ");
    print(rowID);
    if (rowID != fieldSize - 1)  print("    ");//横のIDの間の隙間
  }

  println();//最後の行まで行った後の改行

  for (int i = 0; i < fieldSize; i++)
  {
    if (i != 0)  println("");//縦の隙間を作る
    print(i);

    for (int j = 0; j < fieldSize; j++)//ベースの碁盤を描写
    {
      print(strPlus(field[j][i]));
    }

    println("");
  }
}

void GridDraw()//碁盤を書く
{
  float posX, posY;
  float rectOffset = 5;

  for (int i = 0; i < fieldSize; i++)//碁盤の線
  {
    posX = (canvasSize / fieldSize);
    posY = (canvasSize / fieldSize);

    fill(255);
    strokeWeight(1);
    line(i * posX, width, i * posX, -width);//col
    line(height, i * posY, -height, i * posY);//row
  }

  //枠
  fill(0);
  rectMode(CORNERS);
  rect(0, 0, width, (canvasSize / fieldSize) - rectOffset);//上
  rect(0, height, width, (fieldSize - 1) * ((canvasSize / fieldSize)) + rectOffset);//下
  rect(0, 0, (canvasSize / fieldSize) - rectOffset, height);//左
  rect(width, 0, (fieldSize - 1) * ((canvasSize / fieldSize)) + rectOffset, height);//右
}

void CellDraw(int rowNum, int colNum)
{
  if (field[rowNum][colNum] == 1)
  {
    fill(255);
  } else if (field[rowNum][colNum] == -1)
  {
    fill(0);
  }

  int cellX = rowNum * (canvasSize / fieldSize) + (canvasSize / fieldSize / 2);
  int cellY = colNum * (canvasSize / fieldSize) + (canvasSize / fieldSize / 2);
  int cellSize = (canvasSize / fieldSize) - 10;

  ellipseMode(CENTER);
  ellipse(cellX, cellY, cellSize, cellSize);
}

void PutCell()
{
  int row = mousePos(mouseX);
  int col = mousePos(mouseY);

  if ()
  {
    field[row][col] = hasStone;
    hasStone *= -1;
  }

  DebugDraw();

  println("mouseX = " + row + ", " + "mouseY = " + col);
}
/*
      0, -1上
 0, 1下
 
 -1, -1右上
 1, 1右下
 
 -1, 0左
 1, 0右
 
 -1, -1左上;
 -1, 1左下
 
 (-1, -1)  (0, -1)  (1, -1)
 左上         上       右上
 (-1, 0)  左  @  右  (1, 0)
 左下         下       右下
 (-1, 1)   (0, 1)   (1, 1)
 */
