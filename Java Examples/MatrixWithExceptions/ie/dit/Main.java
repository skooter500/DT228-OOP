package ie.dit;

public class Main
{
    public static void main(String[] args)
    {       
        try
        {
            Matrix2D a = new Matrix2D(4, 4);
            a.identity();
            Matrix2D b = new Matrix2D(4, 1);
            b.randomise(10);
            Matrix2D c = null;
            c = Matrix2D.mult(a, b);
            System.out.println(a);
            System.out.println(b);
            System.out.println(c);          
        }
        catch (Matrix2DException me)
        {
            // Should not get thrown...
            me.printStackTrace();
        }

        try
        {
            Matrix2D d = new Matrix2D(4, 4);
            d.identity();
            Matrix2D e = new Matrix2D(3, 1);
            e.randomise(10);
            Matrix2D f = null;
            // This should throw an exception
            f = Matrix2D.mult(d, e);
            // This code will never be reached because the exception will be thrown and caught
            System.out.println(d);
            System.out.println(e);
            System.out.println(f); // f will be null
        }
        catch (Matrix2DException me)
        {
            // Catch the exception thrown above 
            me.printStackTrace();
        }

        try
        {
            Matrix2D g = new Matrix2D(2, 2);
            g.setCell(2, 2, 100); // This should throw an exception
        }
        catch (Matrix2DException me)
        {
            // Catch the exception thrown above 
            me.printStackTrace();
        }

    }
}