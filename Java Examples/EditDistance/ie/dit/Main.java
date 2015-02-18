package ie.dit;

public class Main
{
	public static void main(String[] args)
	{
		String sa = "I love DIT";
		String sb = "I love Tunepal";
		System.out.println("Edit distance between: " + sa + " and: " + sb + " is " + EditDistance.MinimumEditDistance(sa, sb));

		sa = "Games Fleadh";
		sb = "Imagine Cup";
		System.out.println("Edit distance between: " + sa + " and: " + sb + " is " + EditDistance.MinimumEditDistance(sa, sb));

	}
}