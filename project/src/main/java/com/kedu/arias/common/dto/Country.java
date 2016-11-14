package com.kedu.arias.common.dto;

public class Country {
	
	private String country_id;
	private String country_name_eng;
	private String country_name_kor;
	private String country_num;
	
	public String getCountry_id() {
		return country_id;
	}
	public void setCountry_id(String country_id) {
		this.country_id = country_id;
	}
	public String getCountry_name_eng() {
		return country_name_eng;
	}
	public void setCountry_name_eng(String country_name_eng) {
		this.country_name_eng = country_name_eng;
	}
	public String getCountry_name_kor() {
		return country_name_kor;
	}
	public void setCountry_name_kor(String country_name_kor) {
		this.country_name_kor = country_name_kor;
	}
	public String getCountry_num() {
		return country_num;
	}
	public void setCountry_num(String country_num) {
		this.country_num = country_num;
	}
	
	@Override
	public String toString() {
		return "CountryDto [country_id=" + country_id + ", country_name_eng=" + country_name_eng + ", country_name_kor="
				+ country_name_kor + ", country_num=" + country_num + "]";
	}
}
