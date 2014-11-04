void setup()
{
  size(500, 500);
  player1 = new Player(100, 100); 
}

Player player1;

void draw()
{
  background(0);
  player1.move();
  player1.draw();  
}

