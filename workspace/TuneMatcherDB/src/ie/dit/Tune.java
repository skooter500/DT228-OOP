package ie.dit;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Tune {
	public Tune(ResultSet r)
	{
		try
		{
			setTitle(r.getString("title"));
			setSearchKey(r.getString("search_key"));
		}
		catch (SQLException e)
		{
			
		}
	}
	
	public String getTitle() 
	{
		return title;
	}
	public void setTitle(String title) 
	{
		this.title = title;
	}

	String getSearchKey() {
		return searchKey;
	}

	void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public int getEd() 
	{
		return ed;
	}
	public void setEd(int ed) 
	{
		this.ed = ed;
	}
	
	public String toString()
	{
		return title + "\t" + searchKey + "\t" + ed;
	}

	private int ed;
	private String title;
	private String searchKey;
}
