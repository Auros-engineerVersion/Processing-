int canvasSize = 512;
float boardIndex = 8.0f;
float mousePosX, mousePosY;

int stoneColor = 1;

color green = color(0, 140, 0);

Pice pice;
Board board;
Cell c;

void setup()
{
  size(512, 512);
  board = new Board();
}

void draw()
{
  background(255);
  board.Display();
}

void mousePressed()
{
  Cell cell = board.getCellPos(mouseX, mouseY);
  
  cell.PutStone(stoneColor);
  stoneColor *= -1;
}
