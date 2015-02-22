package ie.dit;

public class Stack<T>
{
	T[] elements;
	int top = 0;
	int capacity = 0;

	public Stack(int capacity)
	{
		elements = new T[capacity];
		this.capacity = capacity;
	}

	public void Push(T what) throws ArrayIndexOutOfBoundsException
	{
		if (top < capacity)
		{
			elements[top++] = what;
		}
		else
		{
			throw new ArrayIndexOutOfBoundsException("Tried to push too many elements onto the stack");
		}
	}
	
	public boolean isEmpty()
	{
		return (top != 0)
	}

	public T Pop() throws ArrayIndexOutOfBoundsException
	{
		if (top > 0)
		{
			return elements[--top];
		}
		else
		{
			throw new ArrayIndexOutOfBoundsException("Tried to pop too many elements from the stack");
		}
	}
}
