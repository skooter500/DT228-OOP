class Bullet extends GameObject
{
  Bullet()
  {
    x = width / 2;
    y = height / 2;
  }
  
  void move()
  {
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
