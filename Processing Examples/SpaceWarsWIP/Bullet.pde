class Bullet extends GameObject
{
  Bullet()
  {
    x = width / 2;
    y = height / 2;
  }
  
  void move()
  {
    float lx = sin(theta);
    float ly = -cos(theta);
    float speed = 10.0f;
    x += lx * speed;
    y += ly * speed;
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
