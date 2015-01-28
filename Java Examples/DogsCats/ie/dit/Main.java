package ie.dit;

import java.util.*;

public class Main
{
	ArrayList<Animal> animals = new ArrayList<Animal>();
	
	Main()
	{
		System.out.println("Hello world!");
		Animal dog = new Dog("Misty");		
		dog.speak();
	}
	
	public static void main(String[] args)
	{
		Main main = new Main();
	}
}