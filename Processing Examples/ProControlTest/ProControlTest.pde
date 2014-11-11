import procontroll.*;

ControllIO controll;

ArrayList<ControllDevice> devices = new ArrayList<ControllDevice>();

void setup()
{
  controll = ControllIO.getInstance(this);
}

void checkForNewControllers()
{
  // Add all the xbox controllers
  for(int i = 0; i < controll.getNumberOfDevices(); i++){
    ControllDevice device = controll.getDevice(i);
    if (device.getName().toUpperCase().indexOf("XBOX 360") != -1)
    {
      if (! devices.contains(device))
      {        
        devices.add(device);
      }
    }    
  }
}

void draw()
{
  checkForNewControllers();
  
  for(int i = 0 ; i < devices.size() ; i ++)
  {
    ControllDevice device = devices.get(i);
    for (int j = 0 ; j < device.getNumberOfSticks() ; j ++)
    {
      ControllStick stick = device.getStick(j);
      println("Stick: " + j + ": " + stick.getX() + "\t" + stick.getY()); 
    }    
  }  
  
  
  for(int i = 0 ; i < devices.size() ; i ++)
  {
    ControllDevice device = devices.get(i);
    for (int j = 0 ; j < device.getNumberOfSliders() ; j ++)
    {
      ControllSlider slider = device.getSlider(j);
      println("Slider: " + j + ": " + slider.getValue()); 
    }    
  }  
  
}
