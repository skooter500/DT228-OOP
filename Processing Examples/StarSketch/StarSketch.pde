
BigStar[] stars;

void setup()
{
  size(500, 500);
  smooth();

  stars = new BigStar[3];
  BigStar star = new BigStar();
  stars[0] = star;  
  
  star = new BigStar();
  stars[1] = star;  

  star.rotSpeed = -0.05f;
  star.colour = color(255, 0, 0);
  star.x = 200; 
  star.y = 50;
  star.radius = 20;

  star = new BigStar();
  stars[2] = star;  
  star.rotSpeed = 0.015f;
  star.colour = color(255, 0, 255);
  star.points = 5;
  star.x = 300; 
  star.y = 300;
  star.radius = 120;  
}


void draw()
{
  background(0);
  for (int i = 0 ; i < stars.length ; i ++)
  {
    stars[i].update();
    stars[i].draw();
  }
}
