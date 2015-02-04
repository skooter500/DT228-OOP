package ie.dit;

public class Main
{
	public static void main(String[] args)
	{
		Matrix2D m = new Matrix2D(5, 3);
		
		m.setCell(3, 2, 5);
		m.identity();
		
		
		Matrix2D a = new Matrix2D(4, 4);
		a.identity();
		
		Matrix2D b = new Matrix2D(4, 4);
		b.identity();
		
		Matrix2D c;
		c = Matrix2D.add(a, b); // How to call a static method
		
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		
		
	}
}