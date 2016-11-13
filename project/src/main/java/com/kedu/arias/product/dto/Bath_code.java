package com.kedu.arias.product.dto;

public class Bath_code {

	private String bath_id;
	private String bath_name;
	public String getBath_id() {
		return bath_id;
	}
	public void setBath_id(String bath_id) {
		this.bath_id = bath_id;
	}
	public String getBath_name() {
		return bath_name;
	}
	public void setBath_name(String bath_name) {
		this.bath_name = bath_name;
	}
	@Override
	public String toString() {
		return "Bath_code [bath_id=" + bath_id + ", bath_name=" + bath_name + "]";
	}
	
	
	
}
