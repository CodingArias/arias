package com.kedu.arias.member.dto;

public class LoginDto {
	private String member_email;
	private String member_pwd;
	private boolean useCookie;
	
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
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	@Override
	public String toString() {
		return "LoginDto [member_email=" + member_email + ", member_pwd=" + member_pwd + ", useCookie=" + useCookie
				+ "]";
	}
}
