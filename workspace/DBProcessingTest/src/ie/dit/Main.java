package ie.dit;

import processing.core.PApplet;


public class Main extends PApplet{

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	
	public void start()
	{
		TuneFinder tuneFinder = new TuneFinder();
		tuneFinder.loadTunes();
	}
	
	public void draw()
	{
	}
}
