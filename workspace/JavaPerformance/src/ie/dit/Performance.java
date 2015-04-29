package ie.dit;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

public class Performance {

	public static long startTime = 0;
	public static long ellapsed = 0;
	
	public static void start()
	{
		startTime = System.nanoTime();
	}
	
	public static void stop()
	{
		ellapsed = System.nanoTime() - startTime;
		float millies = (float) ellapsed / 1000000.0f;
		System.out.println("Ellapsed: " + ellapsed + " Millies: " + millies);
	}
	
	public static void main(String[] args) 
	{
		int size = 10000;
		int[] array = new int[size];	
		System.out.println("Insert 10000 elements into an array");
		start();
		for (int i = 0 ; i < size ; i ++)
		{
			array[i] = i;
		}				
		stop();
			
		start();
		System.out.println("Insert 10000 elements into an arraylist");

		ArrayList<Integer> arrayList = new ArrayList<Integer>();
		for (int i = 0 ; i < size ; i ++)
		{
			arrayList.add(i);
		}
		stop();
		start();
		ArrayList<String> sArrayList = new ArrayList<String>();
		for (int i = 0 ; i < size ; i ++)
		{
			sArrayList.add("" +i);
		}
		stop();
		
		System.out.println("Searching the arraylist using a for loop");
		int toFind = size -1;
		boolean found = false;
		start();		
		for(int i = 0 ; i < size ; i ++)
		{
			if (arrayList.get(i) == toFind)
			{
				found = true;
			}
		}
		stop();

		found = false;
		System.out.println("Searching the arraylist using a foreach loop");
		start();
		for (int i:arrayList)
		{
			if (i == toFind)
			{
				found = true;
			}
		}
		stop();
		System.out.println("Insert into an array list at the begining");
		start();
		arrayList.add(0, 99);
		stop();	
		System.out.println("Insert into an array list in the middle");
		start();
		arrayList.add(size / 2, 99);
		stop();
		System.out.println("Insert into an array list at the end");
		start();
		arrayList.add(99);
		stop();
		
		System.out.println("Insert 10000 elements into a hashmap");		
		HashMap<Integer, Integer> hashMap = new HashMap<Integer, Integer>();
		start();
		for (int i = 0 ; i < size ; i ++)
		{
			hashMap.put(i, i);
		}
		stop();		
		System.out.println("Search the hashmap for a key");		
		start();		
		hashMap.containsKey(9999);
		stop();	

		System.out.println("Search the hashmap for a value");		
		start();		
		hashMap.containsValue(9999);
		stop();	
		
		ArrayList<Spider> spiders = new ArrayList<Spider>();
		
		spiders.add(new Spider("Daddy Long Legs", "Brown", 1000));
		spiders.add(new Spider("Tarantula", "Black", 10000));
		spiders.add(new Spider("Black Widow", "Purple", 10));
		spiders.add(new Spider("Funnel Web", "Orange", 76));
		spiders.add(new Spider("Trap Door", "Green", 18));
		spiders.add(new Spider("Spider Man", "Red & Black", 2));
		
		for (Spider spider:spiders)
		{
			System.out.println(spider);
		}
		
		Collections.sort(spiders);
		System.out.println("Sorted spiders");
		for (Spider spider:spiders)
		{
			System.out.println(spider);
		}

	}
}
