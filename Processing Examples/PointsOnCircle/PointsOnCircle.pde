void setup()
{
  size(500, 500);
  centX = width / 2;
  centY = height / 2;
}

int centX;
int centY;

void draw()
{
  float segments = 12;
  float thetaInc = TWO_PI / segments;
  float theta = 0;
  float radius = 100;
  while (theta < TWO_PI)
  {
    float x;
    float y;
    x = centX + sin(theta) * radius;
    y = centY + cos(theta) * radius;
    ellipse(x, y, 20, 20);
    line(centX, centY, x, y);
    theta += thetaInc;
  }
}
