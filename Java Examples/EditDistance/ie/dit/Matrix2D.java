package ie.dit;

public class Matrix2D
{
	private int rows;
	private int cols;
	private float[][] cells;
	
	Matrix2D(int rows, int cols)
	{
		this.rows = rows;
		this.cols = cols;
		cells = new float[rows][cols];
	}
	
	public String toString()
	{
		String ret = "";
		for (int row = 0 ; row < rows ; row ++)
		{
			for (int col = 0 ; col < cols ; col ++)
			{
				ret += getCell(row, col) + " ";
			}
			ret += "\n";
		}
		return ret;
	}
	
	
	public static Matrix2D add(Matrix2D a, Matrix2D b)
	{
		Matrix2D c = new Matrix2D(a.getRows(), a.getCols());
		
		for (int row = 0 ; row < a.getRows() ; row ++)
		{
			for (int col = 0 ; col < a.getCols() ; col ++)
			{
				c.setCell(row, col
					, a.getCell(row, col) + b.getCell(row, col));
			}
		}
		return c;
	}
	
	public void add(Matrix2D b)
	{
		for (int row = 0 ; row < rows ; row ++)
		{
			for (int col = 0 ; col < cols ; col ++)
			{
				setCell(row, col, getCell(row, col) + b.getCell(row, col));
				cells[row][col] = cells[row][col] + b.cells[row][col];
			}
		}
	}
	
	public void identity()
	{
		for (int row = 0 ; row < rows ; row ++)
		{
			for (int col = 0 ; col < cols ; col ++)
			{
				setCell(row, col, (row == col) ? 1 : 0);
				
				// This does the same thing as the line above
				if (row == col)
				{
					setCell(row, col, 1);
				}
				else
				{
					setCell(row, col, 0);
				}
			}
		}
	}
	
	public static Matrix2D mult(Matrix2D a, Matrix2D b)
	{
		Matrix2D c = new Matrix2D(a.getRows(), b.getCols());

		for (int row = 0; row < a.getRows(); row++)
		{
			for (int col = 0; col < b.getCols(); col++)
			{
				float sum = 0.0f;
				for (int i = 0; i < a.getCols(); i++)
				{
					sum += a.getCell(row, i) * b.getCell(i, col);
				}
				c.setCell(row, col, sum);
			}
		}
		return c;
	}
	
	public void mult(Matrix2D b)
	{
		for (int row = 0; row < getRows(); row++)
		{
			for (int col = 0; col < b.getCols(); col++)
			{
				float sum = 0.0f;
				for (int i = 0; i < getCols(); i++)
				{
					sum += getCell(row, i) * b.getCell(i, col);
				}
				setCell(row, col, sum);
			}
		}
	}
	
	public int getRows()
	{
		return rows;
	}
	
	public int getCols()
	{
		return cols;
	}
	
	public void setCell(int row, int col, float value)
	{
		cells[row][col] = value;
	}
	
	public float getCell(int row, int col)
	{
		return cells[row][col];
	}
	
}