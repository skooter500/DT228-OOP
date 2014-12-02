class Bullet extends GameObject
{
  float toLive = 5.0f;
  float ellapsed = 0.0;
  float timeDelta = 1.0f / 60.0f;
  
  Bullet()
  {
    
  }
  
  void move()
  {
    ellapsed += timeDelta;
    if (ellapsed > toLive)
    {
      alive = false;
    }
    forward.x = sin(theta);
    forward.y = -cos(theta);
    float speed = 10.0f;
 
    PVector velocity = PVector.mult(forward, speed);
    position.add(forward);
        
  }
  
  void display()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    line(0, - 5, 0, 5);
    popMatrix();
  }
}
