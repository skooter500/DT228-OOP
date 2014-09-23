void setup()
{
  size(100, 100);
  stroke(255);
  fill(0);
  
  centX = width / 2;
  centY = height / 2;
}

int centX, centY;

void draw()
{
  background(0);
  fill(255, 0, 255);
  stroke(0, mouseX, mouseY);
  
  line (centX, 0, centX, height);
  line (0, centY, width, centY);
   
  if ((mouseX < centX) && (mouseY < centY))
  {
    rect(0, 0, centX, centY);
  }
  
  if ((mouseX >= centX) && (mouseY < centY))
  {
    rect(centX, 0, centX, centY);
  }
  
  if ((mouseX < centX) && (mouseY >= centY))
  {
    rect(0, centY, centX, centY);
  }
  
  if ((mouseX >= centX) && (mouseY >= centY))
  {
    rect(centX, centY, centX, centY);
  }
  
  
  //ellipse(x, 100, 100, 100);  
  //x += speed;
  //if ((x > width) || (x < 0))
  //{
  //  speed = - speed;
  //}
}

