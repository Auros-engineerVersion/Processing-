int canvasSize = 512;
float boardIndex = 8.0f;
float mousePosX, mousePosY;

color green = color(0, 140, 0);

PiceDraw piceDraw;

void setup()
{
  size(512, 512);
}

void draw()
{
  background(255);
}

void mousePressed()
{
  mousePosX = floor(mouseX / (canvasSize / boardIndex));
  mousePosY = floor(mouseY / (canvasSize / boardIndex));
  
  String tempStringX = "mouseX = " + mousePosX;
  String tempStringY = "mouseY = " + mousePosY;
  
  println(tempStringX + ", " + tempStringY);
}
