package edu.ssafy.safefood.dto;

public class Eat {
	private int code;
	private int count;
	private String date;

	public Eat() {

	}

	public Eat(int code, int count, String date) {
		this.code = code;
		this.count = count;
		this.date = date;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Eat [code=" + code + ", count=" + count + ", date=" + date + "]";
	}

}
