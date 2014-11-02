class GameObject
{
  PVector position;
  PVector look;
  PVector right;
  PVector velocity;
  PVector force;
  float w;
  float h;
  float theta;
  float scaleF = 1.0f;
  float speed = 100.0f;
  float timeDelta = 1.0f / 60.0f;
  boolean alive;
  boolean drawVectors;
  float mass;
  color colour;
  PVector basis = new PVector(0, -1);
  
  GameObject()
  {
    position = new PVector();
    look = new PVector(0, -1);    
    right = new PVector(1, 0);    
    velocity = new PVector(0,0);
    force = new PVector(0,0);
    colour = color(255,255,255);
    theta = 0.0f;
    mass = 1.0f;
    alive = true;
  }    
  
  void update()
  {
    // Calculate the vectors
    look.x = sin(theta);
    look.y = -cos(theta);  
    
    right.x = sin(theta + HALF_PI);
    right.y = -cos(theta + HALF_PI);  
    
    
    // Could also use this:
    //look = PVector.fromAngle(theta - HALF_PI);
    //right = PVector.fromAngle(theta);
  }
  
  void draw()
  {
    if (drawVectors)
    {
      float lineLength = 50.0f;
      pushMatrix();
      translate(position.x, position.y);
      //rotate(theta);
      scale(scaleF);    
      stroke(0, 255, 0);
      line(0, 0, look.x * lineLength, look.y * lineLength);      
      stroke(255, 0, 0);
      line(0, 0, right.x * lineLength, right.y * lineLength);
      popMatrix();      
    }   
  }
  
  boolean collides(GameObject entity)
  {
    float combinedRadii = (w / 2.0f) + (entity.w / 2.0f);
    return PVector.dist(position, entity.position) < combinedRadii;
  }
  
  boolean collides(PVector point)
  {
    return PVector.dist(point, position) < w / 2.0f;
  }  
}
