void setup()
{
  size(500, 500);
  for (int i = 0 ; i < 3 ; i ++)
  {
    CircleShape circle = new CircleShape(random(20, 100), random(0, width), random(0, height));
    shapes.add(circle);
    circles.add(circle); 
  }
  
  for (int i = 0 ; i < 3 ; i ++)
  {
    RectShape rect = new RectShape(random(0, width), random(0, height), random(50, 100), random(50, 100));
    shapes.add(rect);
    rects.add(rect); 
  }
}

ArrayList<MovingShape> shapes = new ArrayList<MovingShape>();
ArrayList<CircleShape> circles = new ArrayList<CircleShape>();
ArrayList<RectShape> rects = new ArrayList<RectShape>();

int messagePos = 20;
void printMessage(String s)
{
  fill(255);
  text(s, 20, messagePos);
  messagePos += 20;
}

void draw()
{
  messagePos = 20;
  background(0);
  // Draw and move all the shapes
  for(int i = 0 ; i < shapes.size() ; i ++)
  {
    shapes.get(i).move();
    shapes.get(i).display();
  }
  
  // Now check circle circle collisions
  for(int i = 0 ; i < circles.size() - 1 ; i ++)
  {
    CircleShape circle1 = circles.get(i);
    for (int j = i + 1 ; j < circles.size() ; j ++)
    {
      CircleShape circle2 = circles.get(j);
      if (circle1.collides(circle2))
      {
        printMessage("Circle " + i + " collides with " + " circle " + j);
      }  
    }
  }
  
  // Now check rect rect collisions
  for(int i = 0 ; i < rects.size() - 1 ; i ++)
  {
    RectShape rect1 = rects.get(i);
    for (int j = i + 1 ; j < rects.size() ; j ++)
    {
      RectShape rect2 = rects.get(j);
      if (rect1.collides(rect2))
      {
        printMessage("Rectangle " + i + " collides with " + " rect " + j);
      }  
    }
  }
  
}
