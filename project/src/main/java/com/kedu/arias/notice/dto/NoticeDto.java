package com.kedu.arias.notice.dto;

import java.util.Date;

public class NoticeDto {
	
	private Integer notice_seq;
	private String member_id;
	private String notice_title;
	private String notice_content;
	private Date notice_regdate;
	private int notice_count;
	private String notice_file;
	
	public Integer getNotice_seq() {
		return notice_seq;
	}
	public void setNotice_seq(Integer notice_seq) {
		this.notice_seq = notice_seq;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	public int getNotice_count() {
		return notice_count;
	}
	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}

	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	@Override
	public String toString() {
		return "NoticeDto [notice_seq=" + notice_seq + ", member_id=" + member_id + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_regdate=" + notice_regdate + ", notice_count="
				+ notice_count + ", notice_file=" + notice_file + "]";
	}
	
	

}
