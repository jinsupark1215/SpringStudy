package edu.ssafy.safefood.dto;

public class Board {
	private int seq;
	private String title;
	private String content;
	private String regDate;

	public Board() {
	}

	public Board(int seq, String title, String content) {
		this.seq = seq;
		this.title = title;
		this.content = content;
	}

	// 조회 용
	public Board(int seq, String title, String content, String regDate, int cnt) {
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
	}

	// insert 용
	public Board(String title, String content) {
		this.title = title;
		this.content = content;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Board [seq=" + seq + ", title=" + title + ", content=" + content + ", regDate=" + regDate + "]";
	}

}