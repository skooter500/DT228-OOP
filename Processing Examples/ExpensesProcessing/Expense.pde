class Expense
{
  String name;
  String party;
  String region;
  float returned;
  float claimed;
  float total;
  color colour;
   
  Expense(String line)
  {
    String[] parts = line.split("\t");
    name = parts[0];
    party = parts[1];
    region = parts[2];
    returned = Float.parseFloat(parts[3]);
    claimed = Float.parseFloat(parts[4]);
    total = claimed - returned;
    colour = color(random(0, 255), random(0, 255), random(0, 255));
  }  
}

