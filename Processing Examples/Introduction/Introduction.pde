size(500, 500);
background(255, 255, 0);
stroke(255, 0, 0);
fill(0,0,255);
ellipse(25, 25, 30, 10);
stroke(0, 0, 0);
line(10, 10, 50, 50);
triangle(0, 0, 100, 100, 50, 10); 

int i = 10;
while (i < width)
{
  ellipse(i, 200, i, 80);
  i += 30;
}
