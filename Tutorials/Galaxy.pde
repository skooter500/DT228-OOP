class Object
{
  String name;
  float size;
  float timeDelta;
  int[] colour;
  boolean held;
  
  Object()
  {
    name = "nothing";
    size = 1.0f;
    timeDelta = 1.0f / 60.0f;
    colour = new int[3];
    held = false;
  }
  
  Object(String Name, float Size)
  {
    name = Name;
    size = Size;
    timeDelta = 1.0f / 60.0f;
    held = false;
    
    colour = new int[3];
    colour[0] = (int)random(0, 255);
    colour[1] = (int)random(0, 255);
    colour[2] = (int)random(0, 255);
  }
  
  Object(String Name)
  {
    name = Name;
    size = 1.0f;
    timeDelta = 1.0f / 60.0f;
    held = false;
    
    colour = new int[3];
    colour[0] = (int)random(0, 255);
    colour[1] = (int)random(0, 255);
    colour[2] = (int)random(0, 255);
  }
  
  boolean detectClick(PVector location)//the object's location needs to be specified because of translations
  {
    if(mouseX > location.x - (size / 2.0f) && mouseX < location.x + (size / 2.0f))
    {
      if(mouseY > location.y - (size / 2.0f) && mouseY < location.y + (size / 2.0f))
      {
        if (mousePressed && mouseButton == LEFT)
        {
          return true;
        }
      }
    }
    
    return false;
  }
  
  boolean detectMouse(PVector location)
  {
    if(mouseX > location.x - (size / 2.0f) && mouseX < location.x + (size / 2.0f))
    {
      if(mouseY > location.y - (size / 2.0f) && mouseY < location.y + (size / 2.0f))
      {
        return true;
      }
    }
    
    return false;
  }
  
  boolean detectMouseAdjust(PVector location)//used when the detection is being done outside the drawing, so an adjustment must be made to accommodate for the translation
  {
    if(mouseX - galaxyTranslate.x > location.x - (size / 1.5f) && mouseX - galaxyTranslate.x < location.x + (size / 1.5f))
    {
      if(mouseY - galaxyTranslate.y > location.y - (size / 1.5f) && mouseY - galaxyTranslate.y < location.y + (size / 1.5f))
      {
        return true;
      }
    }
    
    return false;
  }
  
  boolean detectAnything(PVector location, PVector anything)//a more general version of detectMouse - for this one, the location of whatever needs to be detected is also required
  {
    if(anything.x > location.x - (size / 2.0f) && anything.x < location.x + (size / 2.0f))
    {
      if(anything.y > location.y - (size / 2.0f) && anything.y < location.y + (size / 2.0f))
      {
        return true;
      }
    }
    
    return false;
  }
  
  String nameGenerator()
  {
    String[] lines = loadStrings("names.txt");
    String[] parts = new String[2];
    parts[0] = lines[(int)random(0, lines.length)];
    
    int ran = (int)random(0, 4);
    
    if (ran > 0)
    {
      parts[1] = lines[(int)random(0, lines.length)];
    }
    else
    {
      parts[1] = "";
    }
    
    String Name = join(parts, " ");
    return Name;
  }
}


class Star extends Object
{
  Star()
  {
    super("A Star", random(25.0f, 50.0f));
    
    name = nameGenerator();
  }
  
  Star(String Name, float Size)
  {
    super(Name, Size);
  }
  
  void draw(PVector pos, float scale)
  {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale);
    
    stroke(colour[0], colour[1], colour[2]);
    fill(colour[0], colour[1], colour[2]);

    ellipse(0, 0, size, size);
    
    popMatrix();
  }
}


class Planet extends Object
{
  float distance;
  float orbit;
  float angle;
  boolean destroyed;
  float price;//if it's inhabited, you can buy fuel and ammo from it
  
  Planet next;
  
  Planet()
  {
    super("dummy", 0.0f);
    distance = 0.0f;
    angle = 0.0f;
    destroyed = false;
    price = 0.0f;
  }
  
  Planet(float prevDistance, int planetNumber, String starName)
  {
    super("Name", random(5.0f, 15.0f));
    
    String[] nameComponents = {starName, str(planetNumber)};
    String Name = join(nameComponents, " - ");
    
    name = Name;
    
    distance = random(prevDistance + 30.0f, prevDistance + 100.0f);
    orbit = random(0.1f, 0.5f);
    angle = random(0.0f, TWO_PI);
    destroyed = false;
    price = random(0.9f , 2.5f);
    
    int ran = (int)random(0, 6);
    
    if (ran > 0)
    {
      next = new Planet(distance, planetNumber + 1, starName);
    }
    else
    {
      next = new Planet();
    }
  }
  
  void draw(PVector pos, float scale)
  {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale);
    
    noFill();
    stroke(outlineColour[0], outlineColour[1], outlineColour[2]);
    ellipse(0, 0, distance, distance);
    
    stroke(colour[0], colour[1], colour[2]);
    fill(colour[0], colour[1], colour[2]);
    
    float px, py;
    px = (distance / 2) * cos(angle * PI);
    py = (distance / 2) * sin(angle * PI);
    
    if ( detectClick( new PVector(px + pos.x, py + pos.y) ) )
    {
      interf.displayer.planet = this;
      fill(0, 0, 0);
    }
    
    ellipse(px, py, size, size);
    
    popMatrix();
  }
  
  void update()
  {
    angle += orbit / distance ;
  }
  
   boolean detectClick(PVector location)//this modified version of detectClick will make small planets easier to click on.
  {
    if(mouseX > location.x - (size / 1.5f) && mouseX < location.x + (size / 1.5f))
    {
      if(mouseY > location.y - (size / 1.5f) && mouseY < location.y + (size / 1.5f))
      {
        if (mousePressed && mouseButton == LEFT)
        {
          return true;
        }
      }
    }
    
    return false;
  }
}


class Solar extends Object
{
  PVector pos;
  
  Star star;
  Planet planets;//it's a linked list
  
  int numPlanets;
  boolean inhabited;
  float safe;//used when costructing highways to show what planets need to be demolished
  
  Solar()
  {
    super();
    
    star = new Star();
    planets = new Planet(star.size, 1, star.name);
    
    colour = star.colour;
    
    updateInfo();
    
    pos = new PVector(random(1, 640), random(1, 480));
    
    name = star.name;
    
    if ((int)random(0, 5) == 0)
    {
      inhabited = true;
    }
    else
    {
      inhabited = false;
    }
    
    safe = (size * 40.0f) + 10.0f;
  }
  
  void draw(PVector pos, float scale)
  {
    star.draw(pos, scale);
    
    Planet cur = planets;
    
    while(cur.size != 0.0f)
    {
      if (!cur.destroyed)
      {
        cur.draw(pos, scale);
      }
      
      float px, py;
      px = (cur.distance / 2) * cos(cur.angle * PI);
      py = (cur.distance / 2) * sin(cur.angle * PI);
      
      if (detectAnything(new PVector(px + pos.x, py + pos.y), fleet.laser.end) && fleet.laser.hit && !cur.destroyed)//if the laser has hit the planet
      {
        Destroy(cur);
        interf.exp = new Explosion(new PVector(px, py));
      }
      
      cur = cur.next;
    }
    
    noFill();
    stroke(255, 0, 0);
    ellipse(pos.x, pos.y, safe, safe);//indicates a point beyond which planets will need to be destroyed to allow a highway to pass closeby
  }
  
  void update()
  {
    Planet cur = planets;
    
    while(cur.size != 0.0f)
    {
      cur.update();
      cur = cur.next;
    }
  }
  
  void updateInfo()
  {
    Planet cur = planets;
    numPlanets = 0;
    
    while (cur.size != 0.0f)
    {
      if (!cur.destroyed)
      {
        size = cur.distance / 40.0f;
        numPlanets++;
      }
      
      cur = cur.next;
    }
  }
  
  void Destroy(Planet pla)
  {
    Planet cur = planets;
    
    while(cur.size != 0.0f)
    {
      if (cur == pla)
      {
        cur.destroyed = true;
        
        updateInfo();
      }
      
      cur = cur.next;
    }
  }
}


class Galaxy
{
  Solar[] systems = new Solar[42];
  
  Galaxy()
  {
    int inhabitedSystemsCount = 0;
    Solar[] inhabitedSystems = new Solar[3];
    inhabitedSystems[0] = new Solar();
    inhabitedSystems[1] = new Solar();
    inhabitedSystems[2] = new Solar();
    
    for(int i = 0; i < systems.length; i++)
    {
      systems[i] = new Solar();
      
      if (systems[i].inhabited)
      {
        if (inhabitedSystemsCount < 3)
        {
          inhabitedSystems[inhabitedSystemsCount] = systems[i];
        }
        
        inhabitedSystemsCount++;
      }
    }
    
    if (inhabitedSystemsCount < 3)
    {
      inhabitedSystemsCount = 0;
      
      while (inhabitedSystemsCount < 3)
      {
        int ran = (int)random(0, 42);
        
        systems[ran].inhabited = true;
        
        for(int i = 0; i < systems.length; i++)
        {
          if (systems[i].inhabited)
          {
            if (inhabitedSystemsCount < 3)
            {
              inhabitedSystems[inhabitedSystemsCount] = systems[i];
            }
            
            inhabitedSystemsCount++;
          }
        }
      }
    }
    
    for (int i = 0; i < systems.length; i++)
    {
      for (int j = 0; j < systems.length; j++)
      {
        if (PVector.dist(systems[i].pos, systems[j].pos) < 30.0f)
        {
          systems[j].pos = new PVector(random(1, 640), random(1, 480));//this won't eliminate overlapping systems, but it will reduce them
        }
      }
    }
    
    objective = new Objective(inhabitedSystems);
  }
  
  void update()
  {
    for(int i = 0; i < systems.length; i++)
    {
      systems[i].update();
    }
  }
  
  void draw(PVector Pos)
  {
    pushMatrix();
    translate(Pos.x, Pos.y);
    
    interf.displayer.solar = null;
    
    for(int i = 0; i < systems.length; i++)
    {
      fill(systems[i].colour[0], systems[i].colour[1], systems[i].colour[2]);
      
      if (fleet.isNear(systems[i]))
      {
        stroke(255, 255, 0);//need to add different outlines for if a system is inhabited
      }
      else if (systems[i].inhabited)
      {
        stroke(255, 255, 255);
      }
      else
      {
        stroke(systems[i].colour[0], systems[i].colour[1], systems[i].colour[2]);//need to add different outlines for if a system is inhabited
      }
      
      if (systems[i].detectClick(new PVector(Pos.x + systems[i].pos.x, Pos.y + systems[i].pos.y)))
      {
        fill(0, 0, 0);
        
        if (interf.curScreen.screenType != 1)//this will prevent a bug which can occur if two systems overlap
        {
          interf.push(systems[i]);
        }
      }
      
      if (systems[i].detectMouse(new PVector(Pos.x + systems[i].pos.x, Pos.y + systems[i].pos.y)))
      {
        interf.displayer.solar = systems[i];
        interf.displayer.star = systems[i].star;
        
        if (keyPressed && (key == 'h' || key == 'H'))
        {
          if (!planner.held)
          {
            planner.Plan(systems[i]);
          }
          
          planner.held = true;
        }
        else
        {
          planner.held = false;
        }
      }
      
      ellipse(systems[i].pos.x, systems[i].pos.y, systems[i].size, systems[i].size);
    }
    
    fleet.draw();
    
    popMatrix();
  }
}
