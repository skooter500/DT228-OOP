void setup()
{
  size(500, 500);
  background(0);
  centX = width / 2;
  centY = height / 2;
  lastX = centX;
  lastY = centY;  
}

float segments = 12;
int centX, centY;
float lastX, lastY;
int col = 100;
int colInc = 1;
void draw()
{
  background(0);
  float bigRadius = 1;
  float smallRadius = 1;
  stroke(col, 0, 0);
  segments = 12;
  for (int i = 0 ; i <  20; i ++)
  {
    float thetaInc = TWO_PI / segments;    
    for (float theta = 0 ; theta < TWO_PI ; theta += thetaInc)
    {
      float x = centX + sin(theta) * bigRadius; 
      float y = centY -cos(theta) * bigRadius;
      fill(col, col, random(0, 255));
      stroke(col, 0, 0);

      //line(lastX, lastY, x, y);
      lastX = x;
      lastY = y;
      ellipse(x, y, smallRadius * 2.0f, smallRadius * 2.0f);
      bigRadius += 0.5f;
    }
    segments += 5;
    smallRadius += 2;
  }
  if ((col > 255) || (col < 100))
  {
    colInc = - colInc;
  }
  col += colInc;
}
