package ie.dit;

public class Spider implements Comparable<Spider>
{
	private String species;
	private String colour;
	private int numEyes;
	
	public Spider(String species, String colour, int numEyes)
	{
		this.species = species;
		this.colour = colour;
		this.numEyes = numEyes;
	}

	public String getSpecies() {
		return species;
	}
	public void setSpecies(String species) {
		this.species = species;
	}
	public String getColour() {
		return colour;
	}
	public void setColour(String colour) {
		this.colour = colour;
	}
	public int getNumEyes() {
		return numEyes;
	}
	@Override
	public String toString() {
		return "Spider [species=" + species + ", colour=" + colour
				+ ", numEyes=" + numEyes + "]";
	}
	public void setNumEyes(int numEyes) {
		this.numEyes = numEyes;
	}

	public int compareTo(Spider other) {
		//return other.numEyes - this.numEyes;
		return other.getSpecies().compareTo(this.getSpecies());
	}
}
