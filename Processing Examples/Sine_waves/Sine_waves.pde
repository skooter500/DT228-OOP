void setup()
{
  size(displayWidth, displayHeight);
  println("In setup");
   background(0);
 
}

float x;
float y;
float theta = 0;
float radius = 5;
void draw()
{
  x = sin(theta) * radius;
  y = - cos(theta) * radius;
  x += width / 2;
  y += height / 2;
  fill(random(0, 255), random(0, 255), random(0, 255));
  stroke(random(0, 255), random(0, 255), random(0, 255));
  ellipse(x, y, radius, radius);
  //line(width /2 , height / 2, x, y);
  radius += 0.5;
  theta += 0.005;
}


