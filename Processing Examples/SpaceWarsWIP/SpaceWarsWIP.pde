void setup()
{
  size(500, 500);
  player1 = new Player(100, 100); 
  
  star = new Star();
}

Player player1;
Star star;

void draw()
{
  background(0);
  player1.move();
  player1.draw();  
  
  star.move();
  star.draw();
}

