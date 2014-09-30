void setup()
{
  size(1024, 768, OPENGL);
  background(0);
  smooth();
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
float rot = 0.0f; // rotate by this each time
  
void draw()
{
  float offset = 0.0f; // Offset each iteration by this
  background(0);
  float bigRadius = 1;
  float smallRadius = 2;
  stroke(col, 0, 0);
  segments = 8;
    
  for (int i = 0 ; i <  100; i ++)
  {
    float thetaInc = TWO_PI / segments;    
    for (float theta = 0 ; theta < TWO_PI ; theta += thetaInc)
    {
      float x = centX + sin(theta + offset + rot) * bigRadius; 
      float y = centY -cos(theta + offset + rot) * bigRadius;
      fill(col, 0, random(0, 255));
      stroke(col, 0, random(0, 255));

      //line(lastX, lastY, x, y);
      lastX = x;
      lastY = y;
      ellipse(x, y, smallRadius * 2.0f, smallRadius * 2.0f);
    }
    bigRadius += 5f;
    smallRadius += 0.2f;
    offset += 0.1f;
  }
  if ((col > 255) || (col < 100))
  {
    colInc = - colInc;
  }
  col += colInc;
  rot += 0.01f;
}
