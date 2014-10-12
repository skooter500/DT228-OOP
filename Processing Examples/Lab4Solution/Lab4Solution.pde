void setup()
{
  size(500, 500);
  centX = width / 2;
  centY = height / 2;
  
  gap = width / bytes.length;
}

boolean[] bytes = new boolean[16];
int centX, centY;
float gap;
float left;
int maxNum = (int) pow(2, (int)bytes.length);

void draw()
{
  background(127);
  for (int i = 0 ; i < bytes.length ; i ++)
  {
    float x = i * gap;
    float y = centY;
    if (bytes[i])
    {
      fill(0);
    }
    else
    {
      fill(255);
    }
    rect(x,y, gap, gap);
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
  
  // 2's complement
  if (bytes[0] == true)
  {
    ret -= maxNum;
  }
  
  return ret;
   
}

void mousePressed()
{
  if ((mouseY > centY) && (mouseY < centY + gap))
  {    
    int i = mouseX / (int) gap;    
    bytes[i] = ! bytes[i];
  }
}
