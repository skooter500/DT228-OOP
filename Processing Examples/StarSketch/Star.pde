class BigStar
{
  float points;
  float rotSpeed;
  float radius;
  float x, y;
  float rot;
  color colour;
  BigStar()
  {
    x = 100;
    y = 100;
    radius = 50;
    points = 12;
    rot = 0.0f;
    rotSpeed = 0.01f;
    colour = color(255, 255, 255);
  }
  
  void update()
  {
    rot += rotSpeed;
    if (rot > TWO_PI)
    {
      rot = 0;
    }
  }
  
  void draw()
  {
    pushMatrix();
    translate(x, y);
    rotate(rot);
    float thetaInc = TWO_PI / (points * 2);
    float lastX;
    float lastY;
    lastX = 0;
    lastY = -radius; 
    stroke(colour);
    for (int i = 1 ; i <= (points * 2) ; i ++)
    {
      float theta = i * thetaInc;
      float x, y;
      if (i % 2 == 1)
      {
        x = sin(theta) * (radius / 2.0f);
        y = -cos(theta) * (radius / 2.0f);
      }
      else
      {
        x = sin(theta) * radius;
        y = -cos(theta) * radius;
      }
      line(lastX, lastY, x, y);
      lastX = x;
      lastY = y;      
    }
    
    popMatrix();
  }
}
