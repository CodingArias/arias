package com.kedu.arias.product.dto;

/*
         product_id 				VARCHAR2(30) 
      ,  member_id				  VARCHAR2(30)
      ,  product_name			VARCHAR2(100)			NOT NULL 
      ,  product_price			  NUMBER					  NOT NULL 
      ,  country_id					VARCHAR2(30)
      ,  city_id						VARCHAR2(30)
      ,  product_addr			  VARCHAR2(300)			 NOT NULL
      ,  product_info				VARCHAR2(3000)		  NOT NULL
      ,  product_simple_info   VARCHAR2(1000)		 NOT NULL 	
      ,  product_lat				 NUMBER 					NOT NULL
      ,  product_lng				NUMBER 						NOT NULL
      ,  product_score		     NUMBER 					DEFAULT 0
      ,  product_mindt			  NUMBER 
      ,  product_maxdt			NUMBER 
      ,  product_readydt		NUMBER 	
      ,  product_prepdt			NUMBER 
      ,  product_step			NUMBER 					NOT NULL	
      ,  p_main_img				VARCHAR2(1000)		NOT NULL
      ,  product_regdt			DATE 						DEFAULT SYSDATE
 */
public class ProductDto {
	String product_id;
	String member_id;
	String product_name;
	String product_price;
	String country_id;
	String country_name;
	String city_id;
	String city_name;
	String product_addr;
	String product_info;
	String product_simple_info;
	double product_lat;
	double product_lng;
	double product_score;
	int product_mindt;
	int product_maxdt;
	int product_readydt;
	int product_prepdt;
	int product_step;
	String p_main_img;
	String product_regdt;
	
	
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getCountry_id() {
		return country_id;
	}
	public void setCountry_id(String country_id) {
		this.country_id = country_id;
	}
	public String getCity_id() {
		return city_id;
	}
	public void setCity_id(String city_id) {
		this.city_id = city_id;
	}
	public String getProduct_addr() {
		return product_addr;
	}
	public void setProduct_addr(String product_addr) {
		this.product_addr = product_addr;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	public String getProduct_simple_info() {
		return product_simple_info;
	}
	public void setProduct_simple_info(String product_simple_info) {
		this.product_simple_info = product_simple_info;
	}
	public double getProduct_lat() {
		return product_lat;
	}
	public void setProduct_lat(double product_lat) {
		this.product_lat = product_lat;
	}
	public double getProduct_lng() {
		return product_lng;
	}
	public void setProduct_lng(double product_lng) {
		this.product_lng = product_lng;
	}
	public double getProduct_score() {
		return product_score;
	}
	public void setProduct_score(double product_score) {
		this.product_score = product_score;
	}
	public int getProduct_mindt() {
		return product_mindt;
	}
	public void setProduct_mindt(int product_mindt) {
		this.product_mindt = product_mindt;
	}
	public int getProduct_maxdt() {
		return product_maxdt;
	}
	public void setProduct_maxdt(int product_maxdt) {
		this.product_maxdt = product_maxdt;
	}
	public int getProduct_readydt() {
		return product_readydt;
	}
	public void setProduct_readydt(int product_readydt) {
		this.product_readydt = product_readydt;
	}
	public int getProduct_prepdt() {
		return product_prepdt;
	}
	public void setProduct_prepdt(int product_prepdt) {
		this.product_prepdt = product_prepdt;
	}
	public int getProduct_step() {
		return product_step;
	}
	public void setProduct_step(int product_step) {
		this.product_step = product_step;
	}
	public String getP_main_img() {
		return p_main_img;
	}
	public void setP_main_img(String p_main_img) {
		this.p_main_img = p_main_img;
	}
	public String getProduct_regdt() {
		return product_regdt;
	}
	public void setProduct_regdt(String product_regdt) {
		this.product_regdt = product_regdt;
	}
	
	@Override
	public String toString() {
		return "ProductDto [product_id=" + product_id + ", member_id=" + member_id + ", product_name=" + product_name
				+ ", product_price=" + product_price + ", country_id=" + country_id + ", country_name=" + country_name
				+ ", city_id=" + city_id + ", city_name=" + city_name + ", product_addr=" + product_addr
				+ ", product_info=" + product_info + ", product_simple_info=" + product_simple_info + ", product_lat="
				+ product_lat + ", product_lng=" + product_lng + ", product_score=" + product_score + ", product_mindt="
				+ product_mindt + ", product_maxdt=" + product_maxdt + ", product_readydt=" + product_readydt
				+ ", product_prepdt=" + product_prepdt + ", product_step=" + product_step + ", p_main_img=" + p_main_img
				+ ", product_regdt=" + product_regdt + "]";
	}
}
