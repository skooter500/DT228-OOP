class RectShape extends MovingShape
{
  float w, h;
  
  RectShape(float x, float y, float w, float h)
  {
    super(x, y);
    this.w = w;
    this.h = h;
  }  
  
  void display()
  {
    stroke(0, 0, 255);
    fill(0);
    rect(position.x, position.y, w, h);
    super.display(); // call display in the base class
  }
  
  // This is the collision detection bit!!
  boolean collides(RectShape b)
  {
    // Its easier to check if they DONT colide
    if (b.position.x + b.w < position.x)
    {
      return false;
    }
    if (b.position.x > position.x + w)
    {
      return false;
    } 
    
    if (b.position.y > position.y + h)
    {
      return false;
    }
    
    if (b.position.y + b.h < position.y)
    {
      return false;
    }
    // If none of the above then there is a collision
    return true;
    
  }
}
