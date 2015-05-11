package ie.dit;

public class Matrix2DException extends Exception
{
	private String message;
	
	public String getMessage()
	{
		return message;
	}
	
	public void setMessage(String message)
	{
		this.message = message;
	}
	
	public Matrix2DException(String message)
	{
		setMessage(message);
	}
	
	public String toSTring()
	{
		return getMessage();
	}
}