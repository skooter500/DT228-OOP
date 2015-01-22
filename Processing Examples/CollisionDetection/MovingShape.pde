class MovingShape
{
  PVector position;
  PVector target;
  float speed = 1.0f;
  
  MovingShape(float x, float y)
  {
    position = new PVector(x, y);
    resetTarget();
  }
  
  void resetTarget()
  {
    target = new PVector(random(0.0f, width), random(0.0f, height));
  }
  
  void move()
  {
    PVector toTarget = PVector.sub(target, position);
    if (toTarget.mag() > 1)
    {
      toTarget.normalize();
      position.add(PVector.mult(toTarget, speed));
    }
    else
    {
      resetTarget();
    }
  }

  void display()
  {
    stroke(0, 255, 255);
    fill(0);
    line(target.x, target.y - 5, target.x, target.y + 5);
    line(target.x - 5, target.y, target.x + 5, target.y);
  }  
}
