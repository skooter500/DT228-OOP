void setup()
{
  size(500, 500);
  stroke(255);
  fill(0);
  
  centX = width / 2;
  centY = height / 2;
  
  bWidth = width * 0.3f;
  bHeight = height * 0.3f;
  left = centX - bWidth / 2;
  top = centY - bHeight / 2;  
  toggled = false;
  
  ballX = 200;
  ballY = 400;
  dirX = 1;
  dirY = 1;
  
}

float centX, centY;
float left, top, bWidth, bHeight;
float ballX;
float ballY;
float dirX;
float dirY;
float ballSize = 20;
float ballRadius = ballSize / 2;

boolean toggled;

void draw()
{
  background(0);
  
  if (toggled)
  {
    stroke(255,0,0);
    fill(255,0,0);
  }
  else
  {
    if ((mouseX > left) && (mouseX < left + bWidth) && (mouseY > top) && (mouseY < top + bHeight)) 
    {
      stroke(0,0,255);
      fill(0,0,255);    
    }
    else
    {
      stroke(128);
      fill(128);    
    }    
  }
  
  rect(left, top, bWidth, bHeight);  
  
  // The ball
  
  stroke(255);
  fill(255);
  
  ellipse(ballX, ballY, ballSize, ballSize);
  
  ballX += dirX;
  ballY += dirY;
  if ((ballX > (width - ballRadius)) || (ballX < ballRadius))
  {
    dirX = - dirX;
  }
  if ((ballY > (height - ballRadius)) || (ballY < ballRadius))
  {
    dirY = - dirY;
  }
  
}

void mouseClicked()
{
  if ((mouseX > left) && (mouseX < left + bWidth) && (mouseY > top) && (mouseY < top + bHeight)) 
  {
    toggled = ! toggled;
  }  
}

