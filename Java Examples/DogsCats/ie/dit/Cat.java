package ie.dit;

public class Cat extends Animal
{
	int numLives;
	
	public Cat(String name)
	{
		super(name, 4);
		numLives = 9;
	}
	
	public void kill()
	{
		if (numLives > 0)
		{
			System.out.println("Ouch!!");
			-- numLives;
		}
		else
		{
			System.out.println("I am dead!!");		
		}
	}
	
	public void speak()
	{
		System.out.println(getName() + "Says Meow!!");
	}
}