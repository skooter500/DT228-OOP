package ie.dit;

public class EditDistance
{
	 private static float min3(float a, float b, float c)
	{
		if ((a < b) && (a < c))
		{
			return a;
		}
		if ((b < a) && (b < c))
		{
			return b;
		}
		return c;
	}
	 
	public static float substringEditDistance(String needle, String haystack)
	{
		int rows = needle.length() + 1;
		int cols = haystack.length() + 1;
		Matrix2D m = new Matrix2D(rows, cols);
		
		for (int row = 0 ; row < rows; row ++)
		{
			m.setCell(row, 0, row);
		}	
		for (int col = 0 ; col < cols; col ++)
		{
			m.setCell(0, col, 0);
		}	

		for (int row = 1 ; row < rows ; row ++)
		{
			for (int col = 1 ; col < cols ; col ++)
			{
				if (haystack.charAt(col -1) == needle.charAt(row -1))
				{
					m.setCell(row, col, m.getCell(row -1 , col -1));
				}
				else
				{
					float min = min3(m.getCell(row -1 , col -1), m.getCell(row , col -1), m.getCell(row -1 , col ));
					m.setCell(row, col, min + 1);
				}
			}
		}
		//System.out.println(m);
		float min = Float.MAX_VALUE;
		for(int col = 0 ; col < cols ; col ++)
		{
			float ed = m.getCell(rows - 1, col);
			if (ed < min)
			{
				min = ed;
			}
		}
		return min;
	}

	public static float MinimumEditDistance(String needle, String haystack)
	{
		int rows = needle.length() + 1;
		int cols = haystack.length() + 1;
		Matrix2D m = new Matrix2D(rows, cols);
		
		for (int row = 0 ; row < rows; row ++)
		{
			m.setCell(row, 0, row);
		}	
		for (int col = 0 ; col < cols; col ++)
		{
			m.setCell(0, col, col);
		}	

		for (int row = 1 ; row < rows ; row ++)
		{
			for (int col = 1 ; col < cols ; col ++)
			{
				if (haystack.charAt(col -1) == needle.charAt(row -1))
				{
					m.setCell(row, col, m.getCell(row -1 , col -1));
				}
				else
				{
					float min = min3(m.getCell(row -1 , col -1), m.getCell(row , col -1), m.getCell(row -1 , col ));
					m.setCell(row, col, min + 1);
				}
			}
		}
		System.out.println(m);
		return (int) m.getCell(rows - 1, cols - 1);
	}
}