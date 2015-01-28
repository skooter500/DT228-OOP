package ie.dit;


public class Dog extends Animal
{
	public Dog(String name)
	{
		super(name, 4);
	}
	
	public void speak()
	{
		System.out.println(getName() + " says Woof!");
	}	
	
	public void fetch()
	{
		System.out.println(getName() + " is fetching");
	}
}