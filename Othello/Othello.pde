int boundSize = 2; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
int fieldSize = 8 + boundSize;
int canvasSize = 512;

int cellSize;

int field[][];
int hasStone = 1;

color green = color(0, 140, 0);

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

boolean canPutCell(int rowNum, int colNum)
{
  int startRow = rowNum;
  int startCol = colNum;

  if (field[startRow][startCol] == 2)
  {
    return false;
  }

  for (int dirRow = -1; dirRow < 2; dirRow++)
  {
    for (int dirCol = -1; dirCol < 2; dirCol++)
    {
      int curRow = startRow + dirRow;
      int curCol = startCol + dirCol;

      if ((curRow != 0 || curCol != fieldSize) || (curCol != 0 || curCol != fieldSize))
        //盤内またはfield[curRow][curCol]の位置に石があるなら
      {
        while (field[curRow][curCol] == -hasStone)//相手の石ならループ
        {
          curRow += dirRow;
          curCol += dirCol;

          if (field[curRow][curCol] == hasStone) 
          {
            return true;
          }
        }
      }
    }
  }

  return false;
}

void setup()
{
  size(512, 512);
  FieldSetUp();
  DebugDraw();
}

void draw()
{
  background(0, 140, 0);
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

  int rectPosAll;
  int rectPos = (canvasSize / fieldSize) / 4;
  int rectPosW;
  int offset = 5;

  fill(255);
  rectMode(CORNERS);
  rect(rectPos, rectPos, rectPos * 1.5, height - rectPos);
}

void mousePressed()
{
  int row = mousePos(mouseX);
  int col = mousePos(mouseY);

  if (canPutCell(row, col))
  {
    field[row][col] = hasStone;
    flipCell(row, col);
    hasStone *= -1;
  }

  DebugDraw();
  CellNumberChecker();
  println("row = " + row + ", " + "col = " + col);
}

void CellNumberChecker()
{
  int blackNum = 0;
  int whiteNum = 0;

  //あとで関数にする 
  for (int rowNum = 0; rowNum < fieldSize; rowNum++)
  {
    for (int colNum = 0; colNum < fieldSize; colNum++)
    {
      if (field[rowNum][colNum] == -1) blackNum++;
      if (field[rowNum][colNum] == 1) whiteNum++;
    }
  }

  println("black is " + blackNum);
  println("white is " + whiteNum);
}

void FieldSetUp()
{
  int iniPos = ((fieldSize) / 2) - 1;

  field = new int[fieldSize][fieldSize];

  for (int row = 0; row < fieldSize; row++)
  {
    for (int col = 0; col < fieldSize; col++)
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
  field[iniPos][iniPos] = hasStone;//black
  println(hasStone);
  CellDraw(iniPos, iniPos);
  hasStone *= -1;

  field[iniPos + 1][iniPos] = hasStone;//white
  println(hasStone);
  CellDraw(iniPos + 1, iniPos);
  hasStone *= -1;

  field[iniPos + 1][iniPos + 1] = hasStone;//black
  println(hasStone);
  CellDraw(iniPos + 1, iniPos + 1);
  hasStone *= -1;

  field[iniPos][iniPos + 1] = hasStone;//white、その後黒のターンへ
  println(hasStone);
  CellDraw(iniPos, iniPos + 1);
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
    if (i != 0)  println();//縦の隙間を作る
    print(i);

    for (int j = 0; j < fieldSize; j++)//ベースの碁盤を描写
    {
      print(strPlus(field[j][i]));
    }

    println();
  }

  println();

  if (hasStone == 1)
  {
    println("This turn is White, hasStone is " + hasStone);
  } else if (hasStone == -1)
  {
    println("This turn is Black, hasStone is " + hasStone);
  }
}

void GridDraw()//碁盤を書く
{
  float posX, posY;
  float rectOffset = 5;

  for (int i = 0; i < fieldSize; i++)//碁盤の線
  {
    posX= (canvasSize / fieldSize);
    posY= (canvasSize / fieldSize);

    fill(255);
    strokeWeight(1);
    line(i * posX, width, i * posX, -width);//col
    line(height, i * posY, -height, i * posY);//row
  }

  //枠
  fill(green);
  rectMode(CORNERS);
  rect(0, 0, width, (canvasSize / fieldSize) - rectOffset);//上
  rect(0, height, width, (fieldSize - 1) * ((canvasSize / fieldSize)) + rectOffset);//下
  rect(0, 0, (canvasSize / fieldSize) - rectOffset, height);//左
  rect(width, 0, (fieldSize - 1) * ((canvasSize / fieldSize)) + rectOffset, height);//右
}

void CellDraw(int startRow, int startCol)
{
  if (field[startRow][startCol] != 0)
  {
    if (field[startRow][startCol] == 1)
    {
      fill(255);
    } else if (field[startRow][startCol] == -1)
    {
      fill(0);
    }

    int cellX = startRow * (canvasSize / fieldSize) + (canvasSize / fieldSize / 2);
    int cellY = startCol * (canvasSize / fieldSize) + (canvasSize / fieldSize / 2);
    int cellSize = (canvasSize / fieldSize) - 10;

    ellipseMode(CENTER);
    ellipse(cellX, cellY, cellSize, cellSize);
  }
}

void flipCell(int startRow, int startCol)
{
  for (int dirRow = -1; dirRow < 2; dirRow++)
  {
    for (int dirCol = -1; dirCol < 2; dirCol++)
    {
      int curRow = startRow + dirRow;
      int curCol = startCol + dirCol;

      while (field[curRow][curCol] == -hasStone)//相手の石ならループ
      {
        curRow += dirRow;//それぞれの方向の数を足す。
        curCol += dirCol;//これで方向の先も検知できる

        if (field[curRow][curCol] == hasStone)
        {          
          while (!(curRow == startRow && curCol == startCol))
          {
            field[curRow][curCol] = hasStone;
            curRow -= dirRow;//1マス戻る
            curCol -= dirCol;
          }
        }
      }
    }
  }
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
