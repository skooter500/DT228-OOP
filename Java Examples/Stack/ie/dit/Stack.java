package ie.dit;

public class Stack<T>
{
	T[] elements;
	int top = 0;
	int capacity = 0;

	public Stack(int capacity)
	{
		elements = (T[]) new Object[capacity]; // create array
		this.capacity = capacity;
	}
	
	public boolean isEmpty()
	{
		return (top == 0);
	}

	public void push(T what) throws ArrayIndexOutOfBoundsException
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

	public T pop()  throws ArrayIndexOutOfBoundsException
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
