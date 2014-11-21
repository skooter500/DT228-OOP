class Dog extends Animal
{
  AudioPlayer bark;
  PImage image;
  
  Dog()
  {
    bark = minim.loadFile("bark.wav");
    image = loadImage("dog.jpg");
  }
    
  void speak()
  {
    bark.rewind();
    bark.play();
  }
  
  void display()
  {
    image(image, x, y);
  }  
}
