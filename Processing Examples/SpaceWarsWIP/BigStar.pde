class BigStar extends GameObject
{
  float radius;
  float points;
  
  BigStar(float x, float y, float radius, float points)
  {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.points = points;
    this.theta = 0;
  }
  
  BigStar()
  {
    this(width / 2, height / 2, 100, 5);
  }
  
  void move()
  {
    theta += 0.01;
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    
    float px, py;
    float lastx = 0, lasty = -radius;
    float theta1 = 0;
    float thetaInc = TWO_PI / (points * 2);
    
    for(int i = 0 ; i < (points * 2) ; i ++)
    {
      theta1 += thetaInc;
      if (i % 2 == 1)
      {
        px = sin(theta1) * radius;
        py = -cos(theta1) * radius;
      }
      else
      {
        px = sin(theta1) * (radius * 0.5f);
        py = -cos(theta1) * (radius * 0.5f);
      }
      line(lastx, lasty, px, py);
      lastx = px;
      lasty = py;
      
    }
    
    popMatrix();
    
  }
  
}

