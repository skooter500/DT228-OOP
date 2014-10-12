void setup()
{
  size(500, 500);
  loadData();
}

int[] android;
int[] ios;

void loadData()
{
  String[] strings = loadStrings("tunepalqueries.csv");
  
  android = new int[strings.length];
  ios = new int[strings.length];
  
  for (int i = 0 ; i < strings.length ; i ++)
  {
    String[] elements = split(strings[i], ",");
    android[i] = Integer.parseInt(elements[1]);
    ios[i] = Integer.parseInt(elements[2]);    
  }
}

void draw()
{
  for (int i= 0 ; i < android.length - 1 ; i ++)
  {
    stroke(255, 0, 0);    
    line(i, height - android[i], i +1 , height - android[i+1]);
    stroke(0, 255, 0);    
    line(i, height - ios[i], i + 1, height - ios[i + 1]);    
  }
}
