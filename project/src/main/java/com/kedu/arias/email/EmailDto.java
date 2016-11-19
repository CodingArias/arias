package com.kedu.arias.email;

public class EmailDto {
	
	private String subject;
	private String content;
	private String receiver;
	private String regDate;
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "EmailDto [subject=" + subject + ", content=" + content + ", receiver=" + receiver + ", regDate="
				+ regDate + "]";
	}
}
