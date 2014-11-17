void setup()
{
  gameObjects = new GameObject[6];
  size(500, 500);
  gameObjects[0] = new Player(100, 100); 
  gameObjects[1] = new Player(200, 200); 
  gameObjects[2] = new Polygon(400, 400, 50, 5);
  
  star = new BigStar(200, 200, 50, 5);
  gameObjects[3] = star;
  gameObjects[4] = new Bug();
  gameObjects[5] = new Bullet();
}

GameObject[] gameObjects;

// Better to use an array list!
ArrayList<GameObject> objects = new ArrayList<GameObject>();

BigStar star;

void draw()
{
  background(0);
  for (int i = 0 ; i < gameObjects.length ; i ++)
  {
    gameObjects[i].move();
    gameObjects[i].display();
    // Use instance of to check to see if an instance is an instance of a particular class
    if (gameObjects[i] instanceof BigStar)
    {
      BigStar star = (BigStar) gameObjects[i];
      star.radius += 1;
    }
  }  
}

