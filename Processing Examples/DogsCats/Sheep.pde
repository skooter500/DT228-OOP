class Sheep extends Animal
{
  AudioPlayer bleet;
  PImage image;
  
  Sheep()
  {
    bleet = minim.loadFile("bleet.wav");
    image = loadImage("sheep.jpg");
  }
    
  void speak()
  {
    bleet.rewind();
    bleet.play();
  }
  
  void display()
  {
    image(image, x, y);
  }  
}
