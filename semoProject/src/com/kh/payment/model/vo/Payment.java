package com.kh.payment.model.vo;

import java.sql.Date;

public class Payment {
	
	private int listNo;				// ROWNUM 컬럼을 담을 변수
	private int memberNo;			// 회원 번호
	private int episodeNo;			// 에피소드 번호
	private Date purchasedDate;		// 구매일
	private String episodeTitle;	// 에피소드 제목인데 아직 컬럼이 없음;;;
	
	public Payment() {
		
	}
	
	public Payment(int listNo, int episodeNo, Date purchasedDate) {
		super();
		this.listNo = listNo;
		this.episodeNo = episodeNo;
		this.purchasedDate = purchasedDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getEpisodeNo() {
		return episodeNo;
	}

	public void setEpisodeNo(int episodeNo) {
		this.episodeNo = episodeNo;
	}

	public Date getPurchasedDate() {
		return purchasedDate;
	}

	public void setPurchasedDate(Date purchasedDate) {
		this.purchasedDate = purchasedDate;
	}
	
	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	@Override
	public String toString() {
		return "Payment [memberNo=" + memberNo + ", episodeNo=" + episodeNo + ", purchasedDate=" + purchasedDate + "]";
	}
	
	

}
