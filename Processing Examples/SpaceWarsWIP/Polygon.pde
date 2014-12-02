class Polygon extends GameObject
{
  float radius;
  float sides;
  
  Polygon(float x, float y, float radius, float sides)
  {
    position.x = x;
    position.y = y;
    this.radius = radius;
    this.sides = sides;
  }
  
  Polygon()
  {
    this(width / 2, height / 2, 100, 5);
  }
  
  void move()
  {
  }
  
  void display()
  {
    pushMatrix();
    translate(position.x, position.y);
    
    float px, py;
    float lastx = 0, lasty = -radius;
    float theta = 0;
    float thetaInc = TWO_PI / sides;
    
    for(int i = 0 ; i < sides ; i ++)
    {
      theta += thetaInc;
      px = sin(theta) * radius;
      py = -cos(theta) * radius;
      line(lastx, lasty, px, py);
      lastx = px;
      lasty = py;
      
    }
    
    popMatrix();
    
  }
  
}

