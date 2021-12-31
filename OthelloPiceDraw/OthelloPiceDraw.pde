int gridIndex = 8; //<>//

float gridStrokeWeight = 2.5f;
float canvasSize = 512;
float offset = canvasSize / 17.5f;
float gridPos[] = new float[gridIndex];
float squareSize = 63f;

color green = color(50, 175, 50);

void setup()
{
  size(512, 512);
  background(green);

  GridPosCheck();
}

void draw()
{
  DrawLine();
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

private void DrawLine()
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
  rect(xGridPos, yGridPos, size, size);
}
