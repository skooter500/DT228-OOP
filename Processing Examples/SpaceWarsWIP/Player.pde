class Player
{
  float x, y;
  float w, h;
  color colour;
  float theta;
  
  Player(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    colour = color(255);
    theta = 0;
  }

  Player(float x, float y)
  {
    this.x = x;
    this.y = y;
    h = 20;
    w = 20;
    colour = color(255);
    theta = 0;
  }
  
  Player()
  {
    x = width / 2;
    y = width / 2;
    w = 20;
    h = 20;
    colour = color(255);
    theta = 0;
  }
  
  void draw()
  {
    pushMatrix();
    translate(x, y);   
    rotate(theta);
    
    stroke(colour);
    float halfWidth = w / 2;
    float  halfHeight = h / 2;
    
    line(-halfWidth, halfHeight, 0, - halfHeight);
    line(0, - halfHeight, halfWidth, halfWidth);
    line(halfWidth, halfHeight, 0, 0);
    line(0,0,  - halfWidth, halfHeight);
    popMatrix();
  }
  
  void move()
  {
    if (keyPressed)
    {
      switch (key)
      {
        case 'w':
          y = y -1;
          break;
        case 's':
          y = y + 1;
          break;
        case 'a':
          theta -= 0.1f;
          break;
        case 'd':
          theta += 0.1f;
          break;  
      }
    }
  }
}
