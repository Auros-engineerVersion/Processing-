int gridIndex = 8;
int gridID_X[];
int gridID_Y[];

float gridStrokeWeight = 2.5f;
float canvasSize = 512;
float offset = canvasSize / 17.5f;
float gridPos[] = new float[gridIndex];
float squareSize = 63f;

color greenLight = color(50, 175, 50);
color greenDark  = color(75, 175, 75);

void setup()
{
  size(512, 512);

  GridPosCheck();
}

void draw()
{
  background(255);
  DrawGrid();
}

private void GridPosCheck()
{
  for (int i = 0; i < gridIndex; i++)
  {
    float tempIndex = i;
    float tempGridIndex = gridIndex;
    float currentNum = canvasSize * (tempIndex / tempGridIndex);
    gridPos[i] = currentNum;
  }
}

private void DrawGrid()
{
  for (int i = 0; i < gridIndex; i++)
  { 
    for (int j = 0; j < gridIndex; j++)
    {
      rectMode(CORNER);
      GritChanger(gridPos[i], gridPos[j], squareSize);
    }
  }
}

private void GritChanger(float xGridPos, float yGridPos, float size)
{
}

class GridSquare
{
  private float posX, posY;
  private float size;
  private int id_x, id_y;

  GridSquare(float X, float Y, float SIZE, int ID_X, int ID_Y)
  {
    posX = X;
    posY = Y;
    
    size = SIZE;

    id_x = ID_X;
    id_y = ID_Y;
  }

  void display()
  {
    strokeWeight(gridStrokeWeight);
    fill(greenLight);
    rect(posX, posY, size, size);
  }
}

class OthelloPice
{
  private float posX, posY;
  private float size;

  private color white = 255;
  private color black = 0;

  OthelloPice(float X, float Y, float SIZE)
  {
    posX = X;
    posY = Y;
    size = SIZE;
  }

  void display()
  {
    ellipse(posX, posY, size, size);
  }
}
