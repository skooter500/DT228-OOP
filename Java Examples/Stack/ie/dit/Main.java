package ie.dit;

public class Main
{
	public static void main(String[] args)
	{
		Stack<int> iStack = new Stack<I>();
		
		iStack.push(10);
		iStack.push(20);
		iStack.push(30);
		
		while (! iStack.isEmpty())
		{
			System.out.println(iStack.pull());
		}
	}
}
