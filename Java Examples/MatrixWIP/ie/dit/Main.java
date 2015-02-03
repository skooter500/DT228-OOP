package ie.dit;

public class Main
{
	public static void main(String[] args)
	{
		Matrix2D m = new Matrix2D(5, 3);
		
		m.setCell(3, 2, 5);
		System.out.println(m.getCell(3, 2));
		
		System.out.println(m.getRows());
		System.out.println(m.getCols());
		m.identity();
		System.out.println(m); // The toString method gets called implicitly
		
	}
}