package com.kedu.arias.product.dto;

public class Accom_code {
	private String accom_id;
	private String accom_name;
	public String getAccom_id() {
		return accom_id;
	}
	public void setAccom_id(String accom_id) {
		this.accom_id = accom_id;
	}
	public String getAccom_name() {
		return accom_name;
	}
	public void setAccom_name(String accom_name) {
		this.accom_name = accom_name;
	}
	@Override
	public String toString() {
		return "Accom_code [accom_id=" + accom_id + ", accom_name=" + accom_name + "]";
	}
	
	
	

}
