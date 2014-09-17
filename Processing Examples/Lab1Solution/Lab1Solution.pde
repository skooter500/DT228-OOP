
int red = 255;
int green = 255;
int blue = 0;
boolean smile = true;
size(500,500);
background(0);
fill(0);
for (int y = 0 ; y < height ; y += 50)
{
  for (int x = 0 ; x < width ; x += 50)
  {  
    stroke(red, green, blue);
    ellipse(x + 25, y + 25, 50, 50);
    // The eyes and nose    
    ellipse(x + 15, y + 10, 4, 4);
    ellipse(x + 35, y + 10, 4, 4);
    ellipse(x + 25, y + 25, 4, 4);    
  
    // The mouth
    line(x + 20, y + 38, x + 30, y + 38);
    if (smile)
    {    
      // Draw an upturned mouth
      line(x + 20, y + 38, x + 18, y + 35);
      line(x + 30, y + 38, x + 32, y + 35);
    }
    else
    {
      // Draw a downturned mouth
      line(x + 20, y + 38, x + 18, y + 41);
      line(x + 30, y + 38, x + 32, y + 41);
    }
    smile = ! smile;
  }
  smile = ! smile;
}
