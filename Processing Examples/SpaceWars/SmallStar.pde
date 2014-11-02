class SmallStar extends GameObject
{
  SmallStar()
  {
    position.x = random(0, width);
    position.y = random(0, height);
    colour = color(random(0, 255), random(0, 255), random(0, 255));    
  }
 
  void draw()
  {
    stroke(colour);
    point(position.x, position.y);
  }
}
