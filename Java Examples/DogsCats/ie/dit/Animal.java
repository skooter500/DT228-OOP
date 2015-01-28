package ie.dit;

public class Animal
{
	private String name;
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	private int numLegs;
	
	public int getNumLegs()
	{
		return numLegs;
	}
	
	public void setNumLegs(int numLegs)
	{
		this.numLegs = numLegs;
	}
	
	public Animal(String name, int numLegs)
	{
		setName(name);
		setNumLegs(numLegs);
	}
	
	public Animal()
	{
		this("", 0);
	}
	
	public void speak()
	{
		System.out.println("I can't speak!");
	}
}