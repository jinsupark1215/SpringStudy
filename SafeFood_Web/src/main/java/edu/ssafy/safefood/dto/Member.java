package edu.ssafy.safefood.dto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Set;
import java.util.TreeSet;

public class Member {
	private String id;
	private String pw;
	private String name;
	private String addr;
	private String phone;
	private String[] allergy;
	private ArrayList<Eat> eat = new ArrayList<Eat>();
	private Set<Integer> zzim = new TreeSet<Integer>();

	public Member() {

	}

	public Member(String id, String pw, String name, String addr, String phone, String[] allergy) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.allergy = allergy;
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

	public String[] getAllergy() {
		return allergy;
	}

	public void setAllergy(String[] allergy) {
		this.allergy = allergy;
	}

	public ArrayList<Eat> getEat() {
		return eat;
	}

	public void setEat(ArrayList<Eat> eat) {
		this.eat = eat;
	}

	public void setZzim(Set<Integer> zzim) {
		this.zzim = zzim;
	}

	public Set<Integer> getZzim() {
		return zzim;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", name=" + name + ", addr=" + addr + ", phone=" + phone
				+ ", allergy=" + Arrays.toString(allergy) + "]";
	}

}