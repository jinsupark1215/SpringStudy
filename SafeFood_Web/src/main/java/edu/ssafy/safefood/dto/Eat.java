package edu.ssafy.safefood.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Eat implements Comparable<Eat> {
	private int code;
	private int count;
	private String date;

	public Eat() {

	}

	public Eat(int code, String date) {
		this.code = code;
		this.date = date;
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

	@Override
	public int compareTo(Eat o) {
		if(this.date == null && o.date == null) {
			if(this.count < o.count) {
				return 1;
			} else if (this.count == o.count) {
				return this.code - o.code;
			} else {
				return -1;
			}
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date one;
		try {
			one = df.parse(this.date);
			Date two = df.parse(o.date);
			if (one.getTime() < two.getTime()) {
				return -1;
			} else if (one.getTime() == two.getTime()) {
				return this.code - o.code;
			} else {
				return 1;
			}
		} catch (ParseException e) {
			e.printStackTrace();
			return 0;
		}
	}

}
