void setup()
{  
  println(decimalToBinary(16));    
  println(binaryToDecimal("11001"));

}

int binaryToDecimal(String binary)
{
  int ret = 0;
  int bit = binary.length() - 1;
  for (int i = 0 ; i < binary.length() ; i ++)
  {
    ret += (binary.charAt(i) == '1') ? pow(2, bit) : 0;
    -- bit;
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

