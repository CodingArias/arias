package com.kedu.arias.product.dto;

public class NotsalesDto {
	private int product_seq;
	private int notsales_seq;//NOTSALES_SEQ
	private String ns_start_dt;
	private String ns_end_dt;
	

	public int getProduct_seq() {
		return product_seq;
	}


	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}


	public int getNotsales_seq() {
		return notsales_seq;
	}


	public void setNotsales_seq(int notsales_seq) {
		this.notsales_seq = notsales_seq;
	}


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
		return "NotsalesDto [product_seq=" + product_seq + ", notsales_seq=" + notsales_seq + ", ns_start_dt="
				+ ns_start_dt + ", ns_end_dt=" + ns_end_dt + "]";
	}
	

	
	
}
