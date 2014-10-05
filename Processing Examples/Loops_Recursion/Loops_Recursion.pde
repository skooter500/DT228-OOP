void setup()
{
  size(500, 500);
  smooth();
  centX = width / 2;
  centY = height / 2;
  
  //fibonachiLoop();
  
  //fibonachiRecursive(0, 1);
  
  //println(decimalToBinary(16));
  
  //println(decimalToBinaryRecursive(255));  
  
  //println(binaryToDecimal("1001"));
  
  //println(binaryToDecimalRecursive("1001", 0));
  
  previous = 0;
  current = 1;
}

int previous, current;
float centX, centY;

int nextFib()
{
  current += previous;
  previous = current - previous;
  return previous;
}

void drawFibSpiral()
{
  int quadCount = 15;
  float theta = 0;
  float startRad = 0;
  float endRad = 0;
  previous = 0;
  current = 1;
  float prevX = centX, prevY = centY;
  for (int i = 0 ; i < quadCount ; i ++)
  {
    startRad = endRad;
    endRad = nextFib();
    float steps = startRad - endRad;
    float thetaInc = HALF_PI / steps;
    for (float f = startRad ; f < endRad ; f ++)
    {
      float x = centX + sin(theta) * f;
      float y = centY - cos(theta) * f;
      theta += thetaInc;
      line(prevX, prevY, x, y);
      prevX = x;
      prevY = y;
    }
  }
}

void draw()
{
 drawFibSpiral();   
}

void fibonachiRecursive(int previous, int current)
{
  if (current > 200)
  {
    return;
  }
  else
  {
    println(current);
    fibonachiRecursive(current, current + previous);
  }
}

void fibonachiLoop()
{
  int previous = 0;
  int current = 1;
  
  while (current < 200)
  {    
    println(current);
    current = current + previous;
    previous = current - previous;
  }  
}

String decimalToBinaryRecursive(int decimal)
{
  if (decimal == 0)
  {
    return "";
  }
  else
  {
    return (decimal % 2) + decimalToBinaryRecursive(decimal / 2);
  }
}

int binaryToDecimalRecursive(String binary)
{
  return binaryToDecimalRecursive(binary, 0);
}

int binaryToDecimalRecursive(String binary, int i)
{
  if (i == binary.length())
  {
    return 0;
  }
  else
  {
    return (binary.charAt(i) == '1' ? (int) pow(2, i) : 0) +  binaryToDecimalRecursive(binary, ++ i);
  }   
}

int binaryToDecimal(String binary)
{
  int ret = 0;
  for (int i = 0 ; i < binary.length() ; i ++)
  {
    ret += (binary.charAt(i) == '1') ? pow(2, i) : 0;
  }
  
  return ret;
}


String decimalToBinary(int decimal)
{
  String ret = "";
  while (decimal > 0)
  {
    ret += "" + (decimal % 2);
    decimal /= 2;
  }
  return ret;
}

