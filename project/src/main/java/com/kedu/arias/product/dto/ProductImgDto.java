package com.kedu.arias.product.dto;

public class ProductImgDto {
	private int product_seq;
	private int pimg_seq;
	private String pimg_name;
	
	
	public int getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}
	public int getPimg_seq() {
		return pimg_seq;
	}
	public void setPimg_seq(int pimg_seq) {
		this.pimg_seq = pimg_seq;
	}
	public String getPimg_name() {
		return pimg_name;
	}
	public void setPimg_name(String pimg_name) {
		this.pimg_name = pimg_name;
	}
	@Override
	public String toString() {
		return "ProductImgDto [product_seq=" + product_seq + ", pimg_seq=" + pimg_seq + ", pimg_name=" + pimg_name
				+ "]";
	}
	
	
	
}
