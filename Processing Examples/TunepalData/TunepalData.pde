void setup()
{
 size(500, 500);
 loadData(); 
 noLoop();
}

int[] android;
int[] ios;


void loadData()
{
  String[] lines = loadStrings("tunepalqueries.csv");
  android = new int[lines.length];
  ios = new int[lines.length];
  
  
  for (int i = 0 ; i < lines.length ; ++ i)
  {
    String[] data = split(lines[i], ",");
    android[i] = Integer.parseInt(data[1]); 
    ios[i] = Integer.parseInt(data[2]);
  }  
}

void draw()
{
  stroke(0, 0, 255);
  
  for (int i = 0 ; i < (android.length - 1) ; i ++)
  {    
    line(i, height - android[i], i, height - android[i + 1]);
  }
  
  stroke(255, 0, 0);
  for (int i = 1 ; i < ios.length ; i ++)
  {    
    line(i, height - ios[i - 1], i, height - ios[i]);
  }
  
}
