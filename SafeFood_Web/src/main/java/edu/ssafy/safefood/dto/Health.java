package edu.ssafy.safefood.dto;

public class Health {
	protected int care_id;
	protected String care_type;
	protected String care_name;
	protected String care_q1;
	protected String care_q2;
	protected String care_q3;
	protected String care_a1;
	protected String care_a2;
	protected String care_a3;
	protected String care_food;
	
	public int getId() {
		return care_id;
	}
	public void setId(int care_id) {
		this.care_id = care_id;
	}
	public String getCare_type() {
		return care_type;
	}
	public void setCare_type(String care_type) {
		this.care_type = care_type;
	}
	public String getCare_name() {
		return care_name;
	}
	public void setCare_name(String care_name) {
		this.care_name = care_name;
	}
	public String getCare_q1() {
		return care_q1;
	}
	public void setCare_q1(String care_q1) {
		this.care_q1 = care_q1;
	}
	public String getCare_q2() {
		return care_q2;
	}
	public void setCare_q2(String care_q2) {
		this.care_q2 = care_q2;
	}
	public String getCare_q3() {
		return care_q3;
	}
	public void setCare_q3(String care_q3) {
		this.care_q3 = care_q3;
	}
	public String getCare_a1() {
		return care_a1;
	}
	public void setCare_a1(String care_a1) {
		this.care_a1 = care_a1;
	}
	public String getCare_a2() {
		return care_a2;
	}
	public void setCare_a2(String care_a2) {
		this.care_a2 = care_a2;
	}
	public String getCare_a3() {
		return care_a3;
	}
	public void setCare_a3(String care_a3) {
		this.care_a3 = care_a3;
	}
	public String getCare_food() {
		return care_food;
	}
	public void setCare_food(String care_food) {
		this.care_food = care_food;
	}

	@Override
	public String toString() {
		return "Health [care_id=" + care_id + ", care_type=" + care_type + ", care_name=" + care_name + ", care_q1=" + care_q1
				+ ", care_q2=" + care_q2 + ", care_q3=" + care_q3 + ", care_a1=" + care_a1 + ", care_a2=" + care_a2
				+ ", care_a3=" + care_a3 + ", care_food=" + care_food + "]";
	}
	public Health(int care_id, String care_type, String care_name, String care_q1, String care_q2, String care_q3,
			String care_a1, String care_a2, String care_a3, String care_food) {
		super();
		this.care_id = care_id;
		this.care_type = care_type;
		this.care_name = care_name;
		this.care_q1 = care_q1;
		this.care_q2 = care_q2;
		this.care_q3 = care_q3;
		this.care_a1 = care_a1;
		this.care_a2 = care_a2;
		this.care_a3 = care_a3;
		this.care_food = care_food;
	}
	public Health() {
		super();
	}
	
	
	
}
