package com.kedu.arias.product.dto;

public class Regulation_code {
	private String regulation_id;
	private String regulation_name;
	public String getRegulation_id() {
		return regulation_id;
	}
	public void setRegulation_id(String regulation_id) {
		this.regulation_id = regulation_id;
	}
	public String getRegulation_name() {
		return regulation_name;
	}
	public void setRegulation_name(String regulation_name) {
		this.regulation_name = regulation_name;
	}
	@Override
	public String toString() {
		return "Regulation_code [regulation_id=" + regulation_id + ", regulation_name=" + regulation_name + "]";
	}
	
	
	
	

}
