package com.kedu.arias.product.dto;

public class Safety_code {
	private String product_seq;
	private String safety_id;
	private String safety_name;
	
	
	public String getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(String product_seq) {
		this.product_seq = product_seq;
	}
	public String getSafety_id() {
		return safety_id;
	}
	public void setSafety_id(String safety_id) {
		this.safety_id = safety_id;
	}
	public String getSafety_name() {
		return safety_name;
	}
	public void setSafety_name(String safety_name) {
		this.safety_name = safety_name;
	}
	@Override
	public String toString() {
		return "Safety_code [safety_id=" + safety_id + ", safety_name=" + safety_name + "]";
	}
	
	
	

}
