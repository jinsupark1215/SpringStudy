package edu.ssafy.board.dto;

public class Board {
	private int seq;
	private String title;
	private String writer;
	private String content;
	private String regDate;
	private int cnt;

	public Board() {
	}

	// 업데이트 용
	public Board(int seq, String title, String content) {
		this.seq = seq;
		this.title = title;
		this.content = content;
	}

	// 리스트 용
	public Board(int seq, String title, String writer, String regDate, int cnt) {
		this.seq = seq;
		this.title = title;
		this.writer = writer;
		this.regDate = regDate;
		this.cnt = cnt;
	}

	// 조회 용
	public Board(int seq, String title, String writer, String content, String regDate, int cnt) {
		this.seq = seq;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
		this.cnt = cnt;
	}

	// insert 용
	public Board(String title, String writer, String content) {
		this.title = title;
		this.writer = writer;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "Board [seq=" + seq + ", title=" + title + ", writer=" + writer + ", content=" + content + ", regDate="
				+ regDate + ", cnt=" + cnt + "]";
	}

}