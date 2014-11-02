class BigStar extends GameObject
{
  float points;
  float rot = 0;
  float rotSpeed;
  BigStar()
  {
    position.x = width / 2;
    position.y = height / 2;
    w = 50;
    points = 5;
    rot = 0.0f;
    rotSpeed = 0.05f;
    colour = color(255, 255, 0);
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
    translate(position.x, position.y);
    float x, y, radius;
    radius = w / 2;
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
