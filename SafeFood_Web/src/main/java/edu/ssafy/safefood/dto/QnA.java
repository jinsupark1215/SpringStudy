package edu.ssafy.safefood.dto;

public class QnA {
	private int seq;
	private String title;
	private String writer;
	private String question;
	private String answer;
	private String qDate;
	private String aDate;
	private int viewCnt;

	public QnA() {
	}

	// insert 용
	public QnA(String title, String writer, String question) {
		this.title = title;
		this.writer = writer;
		this.question = question;
	}

	// update 용
	public QnA(int seq, String title, String question) {
		this.seq = seq;
		this.title = title;
		this.question = question;
	}

	// answer 용
	public QnA(int seq, String answer) {
		this.seq = seq;
		this.answer = answer;
	}

	// 조회 카운트 용
	public QnA(int seq, int viewCnt) {
		this.seq = seq;
		this.viewCnt = viewCnt;
	}

	public QnA(int seq, String title, String writer, String question, String answer, String qDate, String aDate,
			int viewCnt) {
		super();
		this.seq = seq;
		this.title = title;
		this.writer = writer;
		this.question = question;
		this.answer = answer;
		this.qDate = qDate;
		this.aDate = aDate;
		this.viewCnt = viewCnt;
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

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getqDate() {
		return qDate;
	}

	public void setqDate(String qDate) {
		this.qDate = qDate;
	}

	public String getaDate() {
		return aDate;
	}

	public void setaDate(String aDate) {
		this.aDate = aDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return "QnA [seq=" + seq + ", title=" + title + ", writer=" + writer + ", question=" + question + ", answer="
				+ answer + ", qDate=" + qDate + ", aDate=" + aDate + ", viewCnt=" + viewCnt + "]";
	}

}
