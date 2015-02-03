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