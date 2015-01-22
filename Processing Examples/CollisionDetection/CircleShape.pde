class CircleShape extends MovingShape
{  
  // Position is the centre of the circle
  float radius;

  CircleShape(float radius, float x, float y)
  {
      super(x, y);
      this.radius = radius;      
  }
  
  void display()
  {
    stroke(255, 255, 0);
    fill(0);
    ellipse(position.x, position.y, radius * 2, radius * 2);
    super.display(); // call display in the base class
  }
  
  // This is the collision detection bit!!
  boolean collides(CircleShape c)
  {
    // Get the distance between the 2 center points
    float dist = PVector.dist(c.position, position);
    return (dist < c.radius + radius);
  }
}
