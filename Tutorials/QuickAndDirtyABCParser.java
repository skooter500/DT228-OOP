package org.tunepal;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import android.app.Activity;
import android.telephony.TelephonyManager;
import android.widget.Toast;

public class QuickAndDirtyABCParser {
	
	public static void main(String args[])
	{
		/*
		 System.out.println(removeDuplicateCharacters("ABCDEFG"));
			
		System.out.println(removeDuplicateCharacters("AABCDEFG"));
		System.out.println(removeDuplicateCharacters("ABBBBBBCDEEEEEFG"));
		System.out.println(removeDuplicateCharacters("ABCCDDEFGGGG"));
		System.out.println(removeDuplicateCharacters("A"));
		System.out.println(removeDuplicateCharacters(""));
		System.out.println(removeDuplicateCharacters("AB"));
		System.out.println(removeDuplicateCharacters("AA"));
		*/
	}
	
	public static String removeDuplicateCharacters(String s)
	{
		StringBuffer sb = new StringBuffer();
		
		if ((s == null) || (s.length() < 2))
		{
			return s;
		}
		char previous = s.charAt(0);
		sb.append(previous);
		for(int i = 1 ; i < s.length() ; i ++)
		{
			char current = s.charAt(i);
			if (current != previous)
			{
				sb.append(current);
			}
			previous = current;
		}
		
		return "" + sb;
	}
	
	static ArrayList<Tune> parse(Activity parent, File file)
	{
		ArrayList<Tune> tunes = new ArrayList<Tune>();
		 try
		 {
			 BufferedReader in = new BufferedReader(new FileReader(file));
			 String strLine;
			 StringBuffer tuneString = new StringBuffer();
			 boolean inTune = false;
			 while ((strLine = in.readLine()) != null)
			 {
				 if (strLine.startsWith("X:") || strLine.startsWith("x:"))
				 {
					 inTune = true;
				 }
				 if (inTune)
				 {
					 tuneString.append(strLine + "\n");
				 }
				 if ("".equals(strLine))
				 {
					 if (inTune)
					 {
						 Tune tune = createTune(tuneString, file.getName());
						 tunes.add(tune); 											
						 tuneString.setLength(0);
					 }
					 inTune = false;
				 }
			 }
			 // Catch the last one
			 if (inTune)
			 {
				 Tune tune = createTune(tuneString, file.getName());
				 tunes.add(tune); 				 
			 }						
		 }
		 catch (Exception e)
		 {
			 //Toast.makeText(Tunepal.instance(), Tunepal.instance().getText(R.string.problem_importing), Toast.LENGTH_LONG).show();
			 e.printStackTrace();
		 }
		 return tunes;
	}

	private static Tune createTune(StringBuffer tuneString, String filename) {
		Tune tune = new Tune();
		tune.setContext(Tunepal.instance());
		tune.setNotation("" + tuneString);
		boolean needsId = tune.updateFromNotation();
		if (needsId)
		{
			String tunepalid = filename + tune.getX() + tune.getTitle();    			
			tune.setTunepalid(tunepalid);
			tune.setSrc(0);
		}
		else
		{
			tune.removeTunepalHeaderFromNotation();
		}
		tune.getKeys().add("DUMMY");
		tune.setFileName(filename);
		return tune;
	}
}
