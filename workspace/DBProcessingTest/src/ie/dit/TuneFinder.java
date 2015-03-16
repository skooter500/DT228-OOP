package ie.dit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TuneFinder {
	 ArrayList<Tune> tunes;
	
	public TuneFinder()
	{
		tunes = new ArrayList<Tune>();
	}
	
	public void loadTunes()
	{
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet results = null;
		
		try
		{
			Class.forName("org.sqlite.JDBC");
			conn = DriverManager.getConnection("jdbc:sqlite:tunes.sqlite");
			statement = conn.prepareStatement("select * from tunes"); 
			results = statement.executeQuery();
			while(results.next())
			{
				Tune tune = new Tune();
				tune.setSearchKey(results.getString("search_key"));
				tune.setTitle(results.getString("title"));
				tunes.add(tune);
			}
		}
		catch(ClassNotFoundException e)
		{
			System.out.println("Cant load the driver");
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			System.out.println("SQL Error");
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
					System.out.println("Could not close the database");
					e.printStackTrace();
				}
			}
		}
		
	}
	
	
}
