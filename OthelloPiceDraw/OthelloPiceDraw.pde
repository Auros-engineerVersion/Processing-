int gridIndex = 8; //<>// //<>// //<>//

float gridStrokeWeight = 2.5f;
float canvasSize = 512;
float offset = canvasSize / 10f;
float linePos[] = new float[gridIndex];
float squarPos[] = new float[gridIndex];

color backGround = color(50, 175, 50);

void setup()
{
  size(512, 512);
  background(backGround);

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
    //x
    float tempIndex = i;
    float tempGridIndex = gridIndex;
    float currentNum = canvasSize * (tempIndex / tempGridIndex);
    linePos[i] = currentNum;
  }
}

private void DrawLine()
{
  for (int i = 0; i < gridIndex; i++)
  {
    for(int j = 0; j < gridIndex; j++)
    {
      strokeWeight(gridStrokeWeight);
      point(linePos[i] + offset, linePos[j] + offset);
      float gridVector2[] = {linePos[i] + offset, linePos[j] + offset};
      
    }
    /*
    strokeWeight(gridStrokeWeight);
   line(linePos[i], canvasSize, linePos[i], -canvasSize);//縦線
   line(canvasSize, linePos[i], -canvasSize, linePos[i]);//横線
   */
  }
}
