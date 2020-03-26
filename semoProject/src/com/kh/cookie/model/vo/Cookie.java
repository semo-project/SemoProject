package com.kh.cookie.model.vo;

import java.sql.Date;

public class Cookie {
	
	private int memberNo;
	private int paymentNo;
	private String paymentMethod;
	private int chargedCookies;
	private Date chargedDate;
	private int paymentAmount;
	private int listNo;
	
	public Cookie() {
		
	}
	
	public Cookie(int memberNo, int paymentNo, String paymentMethod, int chargedCookies, Date chargedDate) {
		super();
		this.memberNo = memberNo;
		this.paymentNo = paymentNo;
		this.paymentMethod = paymentMethod;
		this.chargedCookies = chargedCookies;
		this.chargedDate = chargedDate;
	}
	
	// 마이페이지-쿠키충전내역 조회용 생성자
	public Cookie(int listNo, Date chargedDate, String paymentMethod, int chargedCookies, int paymentAmount) {
		super();
		this.listNo = listNo;
		this.chargedDate = chargedDate;
		this.paymentMethod = paymentMethod;
		this.chargedCookies = chargedCookies;
		this.paymentAmount = paymentAmount;
	}
	
	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public int getChargedCookies() {
		return chargedCookies;
	}

	public void setChargedCookies(int chargedCookies) {
		this.chargedCookies = chargedCookies;
	}

	public Date getChargedDate() {
		return chargedDate;
	}

	public void setChargedDate(Date chargedDate) {
		this.chargedDate = chargedDate;
	}

	@Override
	public String toString() {
		return "Cookie [memberNo=" + memberNo + ", paymentNo=" + paymentNo + ", paymentMethod=" + paymentMethod
				+ ", chargedCookies=" + chargedCookies + ", chargedDate=" + chargedDate + "]";
	}
	
	

}
