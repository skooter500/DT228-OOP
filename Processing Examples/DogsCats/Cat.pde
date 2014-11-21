class Cat extends Animal
{
  int lives;
  
  AudioPlayer meow;
  PImage image;
  
  Cat()
  {
    meow = minim.loadFile("meow.wav");
    image = loadImage("cat.jpg");
  }
  
  void die()
  {
    lives --;
    if (lives == 0)
    {
      isAlive = false;
    }
  }
  
  void speak()
  {
    meow.rewind();
    meow.play();
  }
  
  void display()
  {
    image(image, x, y);
  }  
}
