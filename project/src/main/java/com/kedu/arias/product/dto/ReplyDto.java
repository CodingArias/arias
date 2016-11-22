package com.kedu.arias.product.dto;


public class ReplyDto {
	private int product_seq;
	private String member_id;
	private String preply_content;
	private double member_score;
	private String preply_regdt;
	private double avg_member_score;
	private String member_last_name;
	private String member_first_name;
	private String member_img;

	
	
	public String getMember_last_name() {
		return member_last_name;
	}
	public void setMember_last_name(String member_last_name) {
		this.member_last_name = member_last_name;
	}
	public String getMember_first_name() {
		return member_first_name;
	}
	public void setMember_first_name(String member_first_name) {
		this.member_first_name = member_first_name;
	}
	public String getMember_img() {
		return member_img;
	}
	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}
	public double getAvg_member_score() {
		return avg_member_score;
	}
	public void setAvg_member_score(double avg_member_score) {
		this.avg_member_score = avg_member_score;
	}
	public int getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPreply_content() {
		return preply_content;
	}
	public void setPreply_content(String preply_content) {
		this.preply_content = preply_content;
	}
	public double getMember_score() {
		return member_score;
	}
	public void setMember_score(double member_score) {
		this.member_score = member_score;
	}
	public String getPreply_regdt() {
		return preply_regdt;
	}
	public void setPreply_regdt(String preply_regdt) {
		this.preply_regdt = preply_regdt;
	}
	@Override
	public String toString() {
		return "ReplyDto [product_seq=" + product_seq + ", member_id=" + member_id + ", preply_content="
				+ preply_content + ", member_score=" + member_score + ", preply_regdt=" + preply_regdt + "]";
	}
	
	
}
