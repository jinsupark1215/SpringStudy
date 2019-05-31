package edu.ssafy.safefood.dto;

public class Exercise {
	private String name;
	private int kcal;
	private String url;

	public Exercise() {
	}

	public Exercise(String name, int kcal, String url) {
		this.name = name;
		this.kcal = kcal;
		this.url = url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "Exercise [name=" + name + ", kcal=" + kcal + ", url=" + url + "]";
	}

}
