class Lazer extends GameObject
{
  float aliveFor = 0;
  float toLive;
  
  Lazer()
  {
    w = 5.0f;
    h = 5.0f;
    mass = 0.2f;
    speed = 300.0f;
    toLive = 5.0f;
  }
  
  void update()
  {
    PVector acceleration = PVector.div(force, mass);
    velocity.add(PVector.mult(acceleration, timeDelta));          
    position.add(PVector.mult(velocity, timeDelta));
    
    theta = velocity.heading() + HALF_PI;
    
    if (position.x > width)
    {
      position.x = 0;
    }
    if (position.x < 0)
    {
      position.x = width;
    }
    
    if (position.y > height)
    {
      position.y = 0;
    }
    if (position.y < 0)
    {
      position.y = height;
    }
    
    aliveFor += SpaceWars.timeDelta;    
    if (aliveFor > toLive)
    {
      alive = false;
    }
    force.setMag(0);
    look.x = sin(theta);
    look.y = -cos(theta);   
  }
  
  void draw()
  {
    stroke(colour);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    scale(scaleF);
    
    line(0, - h / 2.0f, 0, h / 2.0f);
      
    popMatrix();        
  }
}
