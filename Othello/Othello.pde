int gridIndex = 8;

float gridStrokeWeight = 2.5f;
float canvasSize = 512;
float offset = canvasSize / 17.5f;

int gridPos[][];

float squareSize = 63f;

color greenLight = color(50, 175, 50);
color greenDark  = color(75, 175, 75);

public GridSquare[][] grid;

Board board;
void setup()
{
  size(512, 512);
}

void draw()
{
  GridSquareSetting();
}

void GridSquareSetting()
{
  grid = new GridSquare[gridIndex + 1][gridIndex + 1];

  for (int x = 0; x <= gridIndex; x++)
  {
    for (int y = 0; y <= gridIndex; y++)
    {
      grid[x][y] = new GridSquare(x, y);

      float toFloatX = x;
      float toFloatY = y;

      float X = canvasSize * (toFloatX / gridIndex);//gridIndexを1として、割合の数値に変換
      float Y = canvasSize * (toFloatY / gridIndex);

      grid[x][y].CheckMousePos();
      grid[x][y].Display(X, Y, squareSize);

      fill(0);
      text("mousw X :" + mouseX, 10, 10);
      text("mousw Y :" + mouseY, 10, 20);
    }
  }
}

public class GridSquare
{
  private float posX, posY;
  private float size;
  private int id_x, id_y;

  GridSquare(int ID_X, int ID_Y)
  {
    id_x = ID_X;
    id_y = ID_Y;
  }

  void Display(float posX, float posY, float size)//四角形を書く
  {
    strokeWeight(gridStrokeWeight);
    fill(greenLight);

    rectMode(CORNERS);
    rect(posX, posY, posX + size, posY + size);

    fill(0);
    text("横 : " + id_x, posX, posY - 1);
    text("縦 : " + id_y, posX, posY - 10);
  }

  void CheckMousePos()//四角形の中にマウスボタンがあるか検知
  {
    if ((posX < mouseX && mouseX > posX + size) && 
      (posY < mouseY && mouseY > posY + size))//色を変更
    {
      println("範囲内");
      fill(0);
    } else
    {
      println("範囲外");
    }
  }
}
