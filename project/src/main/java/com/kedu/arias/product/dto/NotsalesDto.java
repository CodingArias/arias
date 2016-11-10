package com.kedu.arias.product.dto;

public class NotsalesDto {
	private String ns_start_dt;
	private String ns_end_dt;
	
	public String getNs_start_dt() {
		return ns_start_dt;
	}
	public void setNs_start_dt(String ns_start_dt) {
		this.ns_start_dt = ns_start_dt;
	}
	public String getNs_end_dt() {
		return ns_end_dt;
	}
	public void setNs_end_dt(String ns_end_dt) {
		this.ns_end_dt = ns_end_dt;
	}
	@Override
	public String toString() {
		return "NotsalesDto [ns_start_dt=" + ns_start_dt + ", ns_end_dt=" + ns_end_dt + "]";
	}
	

	
	
}
