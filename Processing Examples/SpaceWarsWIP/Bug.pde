class Bug extends GameObject
{
  float bugWidth = 30;
  float halfBugWidth;
  Bug()
  {
    x = width / 2;
    y = height / 2;
    halfBugWidth = bugWidth / 2;
  }
  
  void move()
  {
    //theta += 0.1f;
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    // Draw the bug
    stroke(255);
    float saucerHeight = bugWidth * 0.7f;
    line(halfBugWidth, 0, 0, saucerHeight);
    line(halfBugWidth, 0, bugWidth, saucerHeight);
    line(0, saucerHeight, bugWidth, saucerHeight);
    float feet = bugWidth * 0.2f;
    line(feet, saucerHeight, 0, bugWidth);
    line(bugWidth - feet, saucerHeight, bugWidth, bugWidth);
    feet = bugWidth * 0.4f;
    line(feet, saucerHeight, 0, bugWidth);
    line(bugWidth - feet, saucerHeight, bugWidth, bugWidth);
    line(feet, feet, feet, feet * 1.1f);  
    line(bugWidth - feet, feet, bugWidth - feet, feet * 1.1f);
    line(feet, feet * 1.4f, bugWidth - feet, feet * 1.4f); 
    popMatrix();
  }
}
