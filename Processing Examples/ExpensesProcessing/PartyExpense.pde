class PartyExpense
{
  String name;
  float total;
  color colour;
  
  PartyExpense(String name)
  {
    this.name = name;
    total = 0.0f;
    println("New party " + name);
    colour = color(random(0, 255), random(0, 255), random(0, 255));
  }
}
