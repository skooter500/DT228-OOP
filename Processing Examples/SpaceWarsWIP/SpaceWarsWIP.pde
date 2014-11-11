void setup()
{
  size(500, 500);
  player1 = new Player(100, 100); 
  player2 = new Player(200, 200); 
  p = new Polygon(400, 400, 50, 5);
}

Player player1;
Player player2;
Polygon p;

void draw()
{
  background(0);
  player1.move();
  player1.draw();  

  player2.move();
  player2.draw();  
  
  p.move();
  p.draw();
}

