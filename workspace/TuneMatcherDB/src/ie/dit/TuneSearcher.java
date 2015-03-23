package ie.dit;

import java.sql.*;
import java.util.ArrayList;

public class TuneSearcher {
	
	ArrayList<Tune> tunes = new ArrayList<Tune>();
	
	public Tune findTune(String notes)
	{
		float min = Float.MAX_VALUE;
		int minIndex = 0;
		for (int i = 0 ; i < tunes.size() ; i ++)
		{
			Tune tune = tunes.get(i);
			float dist = EditDistance.substringEditDistance(notes, tune.getSearchKey());
			if (dist < min)
			{
				min = dist;
				minIndex = i;
			}
		}
		return tunes.get(minIndex);
	}
	
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
        	  Tune tune = new Tune(r);
        	  tunes.add(tune);
        	  //System.out.println(tune);
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
