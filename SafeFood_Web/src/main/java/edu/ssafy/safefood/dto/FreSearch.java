package edu.ssafy.safefood.dto;

public class FreSearch implements Comparable<FreSearch> {
	private String searchWord;
	private int cnt;
	
	public FreSearch() {
	
	}
	
	
	
	public FreSearch(String searchWord, int cnt) {
		super();
		this.searchWord = searchWord;
		this.cnt = cnt;
	}



	@Override
	public String toString() {
		return "FreSearch [searchWord=" + searchWord + ", cnt=" + cnt + "]";
	}



	public String getSearchWord() {
		return searchWord;
	}



	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}



	public int getcnt() {
		return cnt;
	}



	public void setcnt(int cnt) {
		this.cnt = cnt;
	}



	@Override
	public int compareTo(FreSearch o) {
		// TODO Auto-generated method stub
		if(this.cnt > o.cnt)return -1;
		else if(this.cnt == o.cnt)return 0;
		return 1;
	}
	
	
	
	
	
	
	
}
