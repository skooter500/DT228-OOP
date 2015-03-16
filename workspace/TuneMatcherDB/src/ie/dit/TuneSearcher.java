package ie.dit;

import java.sql.*;
import java.util.ArrayList;

public class TuneSearcher {
	public void loadTunes()
	{
		Connection conn = null;
        PreparedStatement s = null;
        ResultSet r = null;
        
       try
       {
    	  Class.forName("org.sqlite.JDBC");
    	  conn = DriverManager.getConnection("jdbc:sqlite:tunes.sqlite");
    	  s = conn.prepareStatement("select * from tunes");
          r = s.executeQuery();   
          while (r.next())
          {
        	  System.out.println(r.getString("title"));
        	  System.out.println(r.getString("search_key"));

          }          
       }
       catch (ClassNotFoundException e)
       {
    	   System.out.println("Could not load driver");
    	   e.printStackTrace();
       }
       catch (SQLException e)
       {
    	   System.out.println("SQL error occured");
    	   e.printStackTrace();
       }
       finally
       {
    	   if (conn != null)
    	   {
    		   try 
    		   {
				conn.close();
    		   } 
    		   catch (SQLException e) 
    		   {
				e.printStackTrace();
    		   }
    	   }
       }
       
	}
	
}
