package com.kedu.arias.member.dto;

import java.util.Date;

public class MemberDto {
	private int member_id;
	private String member_first_name;
	private String member_last_name;
	private String member_country;
	private String member_img;
	private String member_email;
	private String member_pwd;
	private String member_phone;
	private String member_birthday;
	private String member_reg_date;
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getMember_first_name() {
		return member_first_name;
	}
	public void setMember_first_name(String member_first_name) {
		this.member_first_name = member_first_name;
	}
	public String getMember_last_name() {
		return member_last_name;
	}
	public void setMember_last_name(String member_last_name) {
		this.member_last_name = member_last_name;
	}
	public String getMember_country() {
		return member_country;
	}
	public void setMember_country(String member_country) {
		this.member_country = member_country;
	}
	public String getMember_img() {
		return member_img;
	}
	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_birthday() {
		return member_birthday;
	}
	public void setMember_birthday(String member_birthday) {
		this.member_birthday = member_birthday;
	}
	public String getMember_reg_date() {
		return member_reg_date;
	}
	public void setMember_reg_date(String member_reg_date) {
		this.member_reg_date = member_reg_date;
	}
	@Override
	public String toString() {
		return "MemberDto [member_id=" + member_id + ", member_first_name=" + member_first_name + ", member_last_name="
				+ member_last_name + ", member_country=" + member_country + ", member_img=" + member_img
				+ ", member_email=" + member_email + ", member_pwd=" + member_pwd + ", member_phone=" + member_phone
				+ ", member_birthday=" + member_birthday + ", member_reg_date=" + member_reg_date + "]";
	}
}
