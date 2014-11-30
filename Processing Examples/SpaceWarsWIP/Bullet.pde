class Bullet extends GameObject
{
  float toLive = 5.0f;
  float ellapsed = 0.0;
  float timeDelta = 1.0f / 60.0f;
  
  Bullet()
  {
    x = width / 2;  
    y = height / 2;
  }
  
  void move()
  {
    ellapsed += timeDelta;
    if (ellapsed > toLive)
    {
      alive = false;
    }
    float lx = sin(theta);
    float ly = -cos(theta);
    float speed = 10.0f;
    x += lx * speed;
    y += ly * speed;
    
    if (x < 0)
    {
      x = width;
    }
    if (x > width)
    {
      x = 0;
    }
    if (y > height)
    {
      y = 0;
    }
    if (y < 0)
    {
      y = height;
    }
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    line(0, - 5, 0, 5);
    popMatrix();
  }
}
