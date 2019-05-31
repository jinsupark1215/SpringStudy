package edu.ssafy.safefood.dto;

import java.util.ArrayList;

public class Member {
	private String id;
	private String pw;
	private String name;
	private String addr;
	private String phone;
	private String allergy;
	private char gender;
	private String birth;
	private int kpd;
	private ArrayList<Eat> eat = new ArrayList<Eat>();

	public Member() {

	}

	public Member(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public Member(String id, String name, String phone) {
		this.id = id;
		this.name = name;
		this.phone = phone;
	}

	public Member(String id, String pw, String name, String addr, String phone, String allergy, char gender, String birth) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.allergy = allergy;
		this.gender = gender;
		this.birth = birth;
	}
	
	public Member(String name, int kpd) {
		this.name = name;
		this.kpd = kpd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public ArrayList<Eat> getEat() {
		return eat;
	}

	public void setEat(ArrayList<Eat> eat) {
		this.eat = eat;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getKpd() {
		return kpd;
	}

	public void setKpd(int kpd) {
		this.kpd = kpd;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", name=" + name + ", addr=" + addr + ", phone=" + phone
				+ ", allergy=" + allergy + ", gender=" + gender + ", birth=" + birth + ", kpd=" + kpd + ", eat=" + eat
				+ "]";
	}

}