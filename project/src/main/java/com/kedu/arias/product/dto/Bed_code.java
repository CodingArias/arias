package com.kedu.arias.product.dto;

public class Bed_code {
	private String bed_id;
	private String bed_name;
	public String getBed_id() {
		return bed_id;
	}
	public void setBed_id(String bed_id) {
		this.bed_id = bed_id;
	}
	public String getBed_name() {
		return bed_name;
	}
	public void setBed_name(String bed_name) {
		this.bed_name = bed_name;
	}
	@Override
	public String toString() {
		return "Bed_code [bed_id=" + bed_id + ", bed_name=" + bed_name + "]";
	}
	
	
	
	

}
