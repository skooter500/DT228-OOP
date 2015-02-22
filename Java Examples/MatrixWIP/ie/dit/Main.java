package ie.dit;

public class Main
{
	public static void main(String[] args)
	{
		Matrix2D a = new Matrix2D(4, 2);
		a.identity();
		a.setCell(0, 1, -2);
		a.setCell(2, 0, 7);
		a.setCell(2, 1, -3);
		a.setCell(3, 1, 2);
		a.setCell(3, 0, 4);
		
		Matrix2D b = new Matrix2D(2, 3);
		b.identity();
		b.setCell(0, 2, 1);
		b.setCell(1, 1, 9);
		b.setCell(1, 0, -7);
		
		Matrix2D c;
		c = Matrix2D.mult(a, b); // How to call a static method
		
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		
		
		
	}
}