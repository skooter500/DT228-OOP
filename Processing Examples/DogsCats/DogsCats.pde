import ddf.minim.*;

Minim minim;

void setup()
{
  minim = new Minim(this);
  size(800, 600);
  setupAnimals();
   
}

void setupAnimals()
{
  animals.clear();
  for (int i = 0 ; i < 3 ; i ++)
  {
    int r = (int)random(0, 3);
    Animal a = null;
    switch (r)
    {
      case 0:
        a = new Dog();
        break;
      case 1:
        a = new Cat();
        break;
      case 2:
        a = new Sheep();
        break;  
    }
    a.x = 10 + (i * 220);
    a.y = 200;
    animals.add(a);
  }
}

ArrayList<Animal> animals = new ArrayList<Animal>();

void draw()
{
  background(0);
  for(Animal a: animals)
  {    
    a.display();
  }
}

void keyPressed()
{
  int k = key - '0';
  
  if (k >= 0 && k < animals.size())
  {
    animals.get(k).speak();
  }
  
  if (key == ' ')
  {
    setupAnimals();
  }
}
