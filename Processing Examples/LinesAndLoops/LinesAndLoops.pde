void setup()
{
  size(500, 500);
  
  centX = width / 2;
  centY = height / 2;
  smooth();
}

int centX;
int centY;

void draw()
{
  background(0);
  stroke(255);
  /*
  int x = 50;
  while (x <= 300)
  {
    line(x, 50, x, 150);
    x += 50;
  }
  */
  
  for (int x = 0 ; x <= width ; x += 10)
  {
    line(x, height, centX, centY);
  }
  /*
  int x = 0;
  while (x <= width)
  {
    line(x, height, centX, centY);
    x += 10;
  }
  */
  int y = centY;
  int yInc = 1;
  while (y < height)
  {
    line(0, y, width, y);
    y += yInc;
    yInc += 2;
  }
  
  /*
  int count = 6;
  int i = 0;
  while (i < count)
  {
    int x = 50 + ((i++) * 50);
    line(x, 50, x, 150);    
  }
  */
  
  
  
  /*
  line(50, 50, 50, 150);
  line(100, 50, 100, 150);
  line(150, 50, 150, 150);
  line(200, 50, 200, 150);
  line(250, 50, 250, 150);
  line(300, 50, 300, 150);
   */ 
}
