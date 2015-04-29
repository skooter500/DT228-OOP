package ie.dit;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Tune 
{
	private String title;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public float getEd() {
		return ed;
	}
	public void setEd(float ed) {
		this.ed = ed;
	}
	private String searchKey;
	private float ed;
	
	public String toString() 
	{
		return "Tune [title=" + title + ", searchKey=" + searchKey + ", ed="
				+ ed + "]";
	}
	
	public Tune(ResultSet r) throws SQLException
	{
		title = r.getString("title");
		searchKey = r.getString("search_key");		
	}
}
