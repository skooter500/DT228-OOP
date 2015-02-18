void setup()
{
  size(500, 500);
  centX = width / 2;
  centY = height / 2;
  
  gap = width / bytes.length;
}

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

boolean[] bits = new boolean[16]; // Stores the array of bits


int binaryToDecimal(boolean[] bits)
{
  int ret = 0;
  int bit = bits.length - 1;
  for (int i = 0 ; i < bits.length ; i ++)
  {
    ret += bits[i] ? pow(2, bit) : 0;
    -- bit;
  }
  
  // 2's complement
  if (bits[0] == true)
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
    bits[i] = ! bits[i];
  }
}
