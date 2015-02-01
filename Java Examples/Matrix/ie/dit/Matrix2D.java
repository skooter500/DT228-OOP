package ie.dit;

import java.util.*;

public class Matrix2D
{
	private int[][] cells;
	private int rows;
	private int cols;
	
	public int getRows()
	{
		return rows;
	}
	
	public int getCols()
	{
		return cols;
	}
	
	public void identity()
	{
		for (int row = 0; row < rows; row++)
		{
			for (int col = 0; col < cols; col++)
			{
				setValue(row, col, (row == col) ? 1 : 0);
			}
		}
	}
	
	public Matrix2D(int rows, int cols)
	{
		this.rows = rows;
		this.cols = cols;
		cells = new int[rows][cols];
		identity();
	}
	
	public int getValue(int row, int col)
	{
		return cells[row][col];
	}
	
	public void setValue(int row, int col, int value)
	{
		cells[row][col] = value;
	}
	
	public Matrix2D add(Matrix2D b)
	{
		for (int row = 0; row < rows; row++)
		{
			for (int col = 0; col < cols; col++)
			{
				setValue(row, col, getValue(row, col) + b.getValue(row, col));
			}
		}
		return this;
	}
	
	public static Matrix2D add(Matrix2D a, Matrix2D b)
	{
		Matrix2D ret = new Matrix2D(a.rows, a.cols);
		for (int row = 0; row < a.rows; row++)
		{
			for (int col = 0; col < a.cols; col++)
			{
				ret.setValue(row, col, a.getValue(row, col) + b.getValue(row, col));
			}
		}
		return ret;
	}
	
	public String toString()
	{
		StringBuilder sb = new StringBuilder();
		for (int row = 0; row < rows; row++)
		{
			for (int col = 0; col < cols; col++)
			{
				sb.append(getValue(row, col) + " ");
			}
			sb.append("\n");
		}
		return "" + sb;
	}	
}