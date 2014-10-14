void setup()
{
  ages = new int[100];
  
  for (int i = 0 ; i < ages.length ; ++ i)
  {
    ages[i] = (int) random(10, 100);
  }
  
  for (int i = 0 ; i < ages.length ; ++ i)
  {
    println(ages[i]);
  }  
  
  float average = 0.0f;
  float sum = 0.0f;
  int min = Integer.MAX_VALUE;
  int max = Integer.MIN_VALUE;

  println("Min: " + min);
  println("Max: " + max);

  for (int i = 0 ; i < ages.length ; ++ i)
  {
    if (ages[i] > max)
    {
      max = ages[i];
    }
    if (ages[i] < min)
    {
      min = ages[i];
    }
    sum += ages[i];
  }
  average = sum / ages.length;
  println(average);
  println("Min: " + min + "" + average);
  println("Max: " + max);
}

int[] ages;
  

void draw()
{
}
