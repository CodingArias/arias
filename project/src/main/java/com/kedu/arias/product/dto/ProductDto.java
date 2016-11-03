package com.kedu.arias.product.dto;

/*
	PRODUCT_SEQ					NOT NULL	NUMBER
	P_MAIN_IMG					NOT NULL	VARCHAR2(1000)
	MEMBER_ID					NOT NULL	VARCHAR2(30)
	PRODUCT_NAME				NOT NULL	VARCHAR2(100)
	PRODUCT_PRICE				NOT NULL	NUMBER
	COUNTRY_ID								VARCHAR2(30)
	PRODUCT_ADDR				NOT NULL	VARCHAR2(300)
	PRODUCT_ADDR_DETAIL			NOT NULL	VARCHAR2(300)
	ACCOM_ID								VARCHAR2(10)
	BATH_ID									VARCHAR2(10)
	BED_ID									VARCHAR2(10)
	BUILDING_ID								VARCHAR2(10)
	SGUEST_ID								VARCHAR2(10)
	PRODUCT_INFO				NOT NULL	VARCHAR2(3000)
	PRODUCT_SIMPLE_INFO						VARCHAR2(1000)
	PRODUCT_LAT					NOT NULL	NUMBER
	PRODUCT_LNG					NOT NULL	NUMBER
	PRODUCT_SCORE							NUMBER
	PRODUCT_MINDT							NUMBER
	PRODUCT_MAXDT							NUMBER
	PRODUCT_READYDT							NUMBER
	PRODUCT_PREPDT							NUMBER
	PRODUCT_STEP				NOT NULL	NUMBER
	PRODUCT_REGDT							DATE
 */
public class ProductDto {
	private int product_seq;
	private String member_id;
	private String product_name;
	private int product_price;
	private String country_id;
	private String country_name;
	private String city_id;
	private String city_name;
	private String product_addr;
	private String product_addr_detail;
	private String product_info;
	private String product_simple_info;
	private double product_lat;
	private double product_lng;
	private double product_score;
	private int product_mindt;
	private int product_maxdt;
	private int product_readydt;
	private int product_prepdt;
	private int product_step;
	private String p_main_img;
	private String product_regdt;
	
	private String accom_id;
	private String accom_name;
	private String bath_id;
	private String bath_name;								
	private String bed_id;								
	private String bed_name;									
	private String building_id;							
	private String building_name;								
	private String sguest_id;								
	private String sguest_name;
	
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
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getCountry_id() {
		return country_id;
	}
	public void setCountry_id(String country_id) {
		this.country_id = country_id;
	}
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	public String getCity_id() {
		return city_id;
	}
	public void setCity_id(String city_id) {
		this.city_id = city_id;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public String getProduct_addr() {
		return product_addr;
	}
	public void setProduct_addr(String product_addr) {
		this.product_addr = product_addr;
	}
	public String getProduct_addr_detail() {
		return product_addr_detail;
	}
	public void setProduct_addr_detail(String product_addr_detail) {
		this.product_addr_detail = product_addr_detail;
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
	public String getBuilding_id() {
		return building_id;
	}
	public void setBuilding_id(String building_id) {
		this.building_id = building_id;
	}
	public String getBuilding_name() {
		return building_name;
	}
	public void setBuilding_name(String building_name) {
		this.building_name = building_name;
	}
	public String getSguest_id() {
		return sguest_id;
	}
	public void setSguest_id(String sguest_id) {
		this.sguest_id = sguest_id;
	}
	public String getSguest_name() {
		return sguest_name;
	}
	public void setSguest_name(String sguest_name) {
		this.sguest_name = sguest_name;
	}
	@Override
	public String toString() {
		return "ProductDto [product_seq=" + product_seq + ", member_id=" + member_id + ", product_name=" + product_name
				+ ", product_price=" + product_price + ", country_id=" + country_id + ", country_name=" + country_name
				+ ", city_id=" + city_id + ", city_name=" + city_name + ", product_addr=" + product_addr
				+ ", product_addr_detail=" + product_addr_detail + ", product_info=" + product_info
				+ ", product_simple_info=" + product_simple_info + ", product_lat=" + product_lat + ", product_lng="
				+ product_lng + ", product_score=" + product_score + ", product_mindt=" + product_mindt
				+ ", product_maxdt=" + product_maxdt + ", product_readydt=" + product_readydt + ", product_prepdt="
				+ product_prepdt + ", product_step=" + product_step + ", p_main_img=" + p_main_img + ", product_regdt="
				+ product_regdt + ", accom_id=" + accom_id + ", accom_name=" + accom_name + ", bath_id=" + bath_id
				+ ", bath_name=" + bath_name + ", bed_id=" + bed_id + ", bed_name=" + bed_name + ", building_id="
				+ building_id + ", building_name=" + building_name + ", sguest_id=" + sguest_id + ", sguest_name="
				+ sguest_name + "]";
	}	
	
	
	
	
}
