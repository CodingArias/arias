package com.kedu.arias.product.dto;

public class ReservationDto {
	private Integer reservation_seq;
	private Integer product_seq;
	private String member_id;
	private String member_name;
	private String member_img;
	private Integer reserv_count;
	private String checkin_dt;
	private String checkout_dt;
	private String reg_dt;
	private String member_intro;
	private Integer reserv_status;
	private String product_name;
	private String product_addr;
	private String product_addr_detail;
	
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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
	public String getMember_img() {
		return member_img;
	}
	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public Integer getReservation_seq() {
		return reservation_seq;
	}
	public void setReservation_seq(Integer reservation_seq) {
		this.reservation_seq = reservation_seq;
	}
	public Integer getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(Integer product_seq) {
		this.product_seq = product_seq;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Integer getReserv_count() {
		return reserv_count;
	}
	public void setReserv_count(Integer reserv_count) {
		this.reserv_count = reserv_count;
	}
	public String getCheckin_dt() {
		return checkin_dt;
	}
	public void setCheckin_dt(String checkin_dt) {
		this.checkin_dt = checkin_dt;
	}
	public String getCheckout_dt() {
		return checkout_dt;
	}
	public void setCheckout_dt(String checkout_dt) {
		this.checkout_dt = checkout_dt;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getMember_intro() {
		return member_intro;
	}
	public void setMember_intro(String member_intro) {
		this.member_intro = member_intro;
	}
	public Integer getReserv_status() {
		return reserv_status;
	}
	public void setReserv_status(Integer reserv_status) {
		this.reserv_status = reserv_status;
	}
	@Override
	public String toString() {
		return "ReservationDto [reservation_seq=" + reservation_seq + ", product_seq=" + product_seq + ", member_id="
				+ member_id + ", member_name=" + member_name + ", member_img=" + member_img + ", reserv_count="
				+ reserv_count + ", checkin_dt=" + checkin_dt + ", checkout_dt=" + checkout_dt + ", reg_dt=" + reg_dt
				+ ", member_intro=" + member_intro + ", reserv_status=" + reserv_status + "]";
	}
	
	
	
	
}
