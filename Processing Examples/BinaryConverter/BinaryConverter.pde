void setup()
{
  size(500, 500);
  centX = width / 2;
  centY = height / 2;
  
  gap = 25;
  left = centX - (bytes.length * gap) / 2;
}

boolean[] bytes = new boolean[16];
int centX, centY;
float gap;
float left;

void draw()
{
  background(127);
  for (int i = 0 ; i < bytes.length ; i ++)
  {
    float x = left + (i * gap);
    float y = centY;
    if (bytes[i])
    {
      fill(0);
    }
    else
    {
      fill(255);
    }
    rect(x,y, gap - 1, gap - 1);
  }
  
  int number = binaryToDecimal(bytes);
  fill(255);
  text(number, centX, 100);
}

int binaryToDecimal(boolean[] bytes)
{
  int ret = 0;
  int bit = bytes.length - 1;
  for (int i = 0 ; i < bytes.length ; i ++)
  {
    ret += bytes[i] ? pow(2, bit) : 0;
    -- bit;
  }
  
  return ret;
}

void mousePressed()
{
  for (int i = 0 ; i < bytes.length ; i ++)
  {
    float x = left + (i * gap);
    float y = centY;
    
    if ((mouseX > x) && (mouseX < x + gap) && (mouseY > y) && (mouseY < y + gap))
    {
      bytes[i] = ! bytes[i];
    }  
  }
}
