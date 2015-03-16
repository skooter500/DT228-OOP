package ie.dit;

public class Tune 
{
	private String title;
	private String searchKey;
	private float ed;
	
	public Tune()
	{
		
	}
	
	public String toString()
	{
		return title + "\t" + searchKey + "\t" + ed;
	}

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
}
