/*
A person flying a kite has released 176m of string. The string makes an angle of 27° with the ground. How high is the kite? How far away is the kite horizontally?
*/

void setup()
{
  size(500, 500);
  kHeight = sin(radians(theta)) * stringLen;
  kDist = cos(radians(theta)) * stringLen;
}

float stringLen = 176.0f;
float theta = 27.0f;
float kHeight;
float kDist;
float left = 100;
float bottom = 300;
  
void draw()
{
  background(0);
  stroke(255);
  fill(0);
  
  triangle(left, bottom, left + kDist, bottom, left + kDist, bottom - kHeight);
  
  fill(255);
  text(theta, left + 10, bottom);
  
  text("Opposite: " + kHeight, left + kDist, bottom - (kHeight / 2));
  text("Adjacent: " + kDist, left + (kDist / 2), bottom + 10);
  
}
