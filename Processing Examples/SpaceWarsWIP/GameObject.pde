class GameObject
{
  PVector position = new PVector(width / 2, height / 2);
  float theta;
  color colour;
  boolean alive;
  
  GameObject()
  {
    alive = true;
    position.x = width / 2;
    position.y = height / 2;
  }

  void move()
  {
  }
  
  void display()
  {
    println("display getting called");
  } 
}
