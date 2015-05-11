package ie.dit;

public class Matrix2DException extends Exception
{
	public Matrix2DException(String message)
	{
		this.message = message; 
	}
	private String message;
	
	public void setMessage(String message)
	{
		this.message = message;
	}
	
	public String getMessage()
	{
		return message;
	}
}