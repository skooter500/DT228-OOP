package ie.dit;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.WebRowSet;

public class WebcoursesGitClone 
{
	private String src;
	private String dest;
	
	public WebcoursesGitClone(String src, String dest)
	{
		this.src = src;
		this.dest = dest;
	}
	
	public static void main(String[] args)
	{
		if (args.length != 2)
		{
			System.out.println("Usage: java ie.dit.WebcoursesGitClone SOURCE_PATH DESTINATION_PATH");
			return;
		}
		
		WebcoursesGitClone wgc = new WebcoursesGitClone(args[0], args[1]);
		
		wgc.doWork();
		
	}

	private void doWork()
	{
		File[] files = new File(src).listFiles(new FileFilter()
		{
			public boolean accept(File f)
			{
				return (f.getName().toLowerCase().endsWith(".txt"));
			}
		});
		if (files == null)
		{
			System.out.println("No files found");
			return;
		}
		for (File file : files) 
		{
		    if (file.isFile()) 
		    {
		        processFile(file);
		    }
		}				
	}

	private void processFile(File file)
	{
		String studentNumber = "";
		String studentName = "";
		String url = "";
		try
		{
			int start_ = file.getName().indexOf("_");
			int end_ = file.getName().indexOf("_", start_ + 1);
			studentNumber = file.getName().substring(start_ + 1, end_);
			String current;
			
			BufferedReader reader = new BufferedReader(new FileReader(file));
			
			while ((current = reader.readLine()) != null) 
			{
				if (current.contains("Name: "))
				{
					int i = current.indexOf("(");
					studentName = current.substring(6, i - 1);
				}
				if (current.contains("http"))
				{
					current = current.replaceAll("\\<[^>]*>","");
					int i = current.indexOf("http");
					url = current.substring(i, current.length());
					System.out.println(studentNumber + "\t" + current);
					cloneRepo(studentNumber, studentName, url);
					break;
				}
			}
			reader.close();
			studentNumber = "";
			studentName = "";
			url = "";
		} 
		catch (Exception e)
		{
			System.out.println("Error cloning:  " + url + " Student: " + studentNumber + " Name: " + studentName);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void cloneRepo(String studentNumber, String studentName, String url)
	{
		int i = url.lastIndexOf("/");
		String projectName = url.substring(i + 1, url.length());
		String destPath = dest + "\\" + studentNumber + " " + studentName + "\\" + projectName;
		String[] cmd = {
				"git"
				, "clone"
				, url
				, destPath
		};			
		
		File test = new File(destPath);
		if (test.exists())
		{
			System.out.println("Skipping: " + destPath);
			return;
		}
		
		try
		{
			Process process;
			process = Runtime.getRuntime().exec(cmd,null);
			
			InputStream in = process.getErrorStream();
	        int c;
	        while ((c = in.read()) != -1) {
	            System.out.print((char)c);
	        }
	        in.close();
			
			/*InputStream stream = process.getInputStream();
			BufferedReader reader = new BufferedReader(new InputStreamReader(stream));
			String line;
			while ((line = reader.readLine()) != null)
			{
				System.out.println(line);
			}
			reader.close();
			*/
			while(process.isAlive())
			{
				Thread.sleep(1000);
			}
			
		} 
		catch (Exception e)
		{
			System.out.println("Could not spawn git process");
			e.printStackTrace();
			return;
		}		
	}
}
