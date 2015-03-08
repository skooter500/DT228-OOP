package ie.dit;

import java.sql.*;
import java.util.ArrayList;

public class TuneSearcher {
	
	ArrayList<Tune> tunes = new ArrayList<Tune>();
	
	public Tune closestMatch(String notes)
	{
		float closest = Float.MAX_VALUE;
		int closestIndex = -1;
		for(int i = 0 ; i < tunes.size() ; i ++)
		{
			float ed = EditDistance.substringEditDistance(notes, tunes.get(i).getSearchKey());
			if (ed < closest)
			{
				closest = ed;
				closestIndex = i;
			}
		}
		return tunes.get(closestIndex);
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
