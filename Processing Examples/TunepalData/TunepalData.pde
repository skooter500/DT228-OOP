void setup()
{
 size(500, 500);
 loadData(); 
 noLoop();
}

int[] android;
int[] ios;

int[] androidByMonth = new int[12];
int[] iosByMonth = new int[12];
int[] months = {31,28,31,30,31,30,31,31,30,31,30,31}; //Size of each month exactly.


void loadData()
{
  String[] lines = loadStrings("tunepalqueries.csv");
  android = new int[lines.length];
  ios = new int[lines.length];
  
  int month = 0;
  int dayInMonth = 0;
  for (int i = 0 ; i < lines.length ; ++ i)
  {
    String[] data = split(lines[i], ",");
    android[i] = Integer.parseInt(data[1]); 
    ios[i] = Integer.parseInt(data[2]);
    
    if (dayInMonth == months[month])
    {
      month ++;
      dayInMonth = 0;
    }
    else
    {
      dayInMonth ++;
    }
    androidByMonth[month] += android[i];
    iosByMonth[month] += ios[i];    
  }  
}

void draw()
{
  stroke(0, 0, 255);
  
  float gap = (float) width / 24.0f;
  int maxIos = Integer.MIN_VALUE;
  for (int i = 0 ; i < 12 ; i ++)
  {
    if (iosByMonth[i] > maxIos)
    {
      maxIos = iosByMonth[i];
    }
  }
  
  float scaleFactor = (float) height / maxIos;
  
  for (int i = 0 ; i < 12 ; i ++)
  {
    stroke(0, 0, 255);
    fill(0, 0, 255);
    rect(i * (gap * 2.0f), height, gap, - (androidByMonth[i] * scaleFactor));

    stroke(255, 0, 0);
    fill(255, 0, 0);
    rect(i * (gap * 2.0f) + gap, height, gap, - (iosByMonth[i] * scaleFactor));
  }
  
}
