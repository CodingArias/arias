package com.kedu.arias.product.dto;


public class ReplyDto {
	private int product_seq;
	private String member_id;
	private String preply_content;
	private int member_score;
	private String preply_regdt;
	private double avg_member_score;
	
	
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
	public int getMember_score() {
		return member_score;
	}
	public void setMember_score(int member_score) {
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
