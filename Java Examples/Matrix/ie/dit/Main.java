package ie.dit;

import java.util.*;

public class Main
{
	
	Main()
	{
		System.out.println("Hello world!");
		Matrix2D m1  = new Matrix2D(4, 4);		
		Matrix2D m2  = new Matrix2D(4, 4);		
		System.out.println(m1);
		System.out.println(m2);
		m2.add(m1);
		System.out.println(m1);
		System.out.println(m2);		
		
		Matrix2D m3 = Matrix2D.add(m2, m1);
		System.out.println(m1);
		System.out.println(m2);		
		System.out.println(m3);		
		
		//System.out.println(m1);
	}
	
	public static void main(String[] args)
	{
		Main main = new Main();
	}
}