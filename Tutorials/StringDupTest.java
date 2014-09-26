package org.tunepal.tests;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.tunepal.QuickAndDirtyABCParser;

public class StringDupTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		System.out.println("setUpBeforClass called");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception 
	{
		System.out.println("tearDownAfterClass called");
	}

	@Before
	public void setUp() throws Exception {
		System.out.println("setUp called");
	}

	@After
	public void tearDown() throws Exception 
	{
		System.out.println("tearDown called");
	}

	@Test
	public void test() 
	{
		String s = QuickAndDirtyABCParser.removeDuplicateCharacters("AABBCCD");
		assertEquals("ABCD", s);	
		
		s = QuickAndDirtyABCParser.removeDuplicateCharacters("ABCD");
		assertEquals("ABCD", s);	
		
		s = QuickAndDirtyABCParser.removeDuplicateCharacters("");
		assertEquals("", s);	
		
		s = QuickAndDirtyABCParser.removeDuplicateCharacters(null);
		assertEquals(null, s);	
		
		s = QuickAndDirtyABCParser.removeDuplicateCharacters("AB");
		assertEquals("AB", s);	

		s = QuickAndDirtyABCParser.removeDuplicateCharacters("AA");
		assertEquals("A", s);	
		
		s = QuickAndDirtyABCParser.removeDuplicateCharacters("ABB");
		assertEquals("AB", s);	
		
		
	}

}
