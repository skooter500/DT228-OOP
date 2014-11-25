void setup()
{
  size(500, 500);
  objects.add(new Player(100, 100)); 
  objects.add(new Player(200, 200)); 
  objects.add(new Polygon(400, 400, 50, 5));
  
  star = new BigStar(200, 200, 50, 5);
  objects.add(star);
  objects.add(new Bug());
}

// Better to use an array list!
ArrayList<GameObject> objects = new ArrayList<GameObject>();

BigStar star;

void draw()
{
  background(0);
  for (int i = 0 ; i < objects.size() ; i ++)
  {
    objects.get(i).move();
    objects.get(i).display();
  }  
}

