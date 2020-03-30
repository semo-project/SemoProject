package com.kh.qna.model.vo;

import java.sql.Date;

public class QNA {
	
	private int qnaNo;					// 문의글 번호
	private String qnaTitle;			// 문의 제목
	private String qnaContent;			// 문의 내용
	private String qnaAnswerState;		// 문의 상태
	private String qnaAnswerContent;	// 답변 내용	
	private Date qnaAnswerDate;			// 답변 등록 날짜
	private int qnaContentNo;			// 문의글 분류 번호
	private Date qnaDate;				// 문의 작성일
	private int memberNo;				// 문의한 회원 번호
	
	private int listNo;
	
	//LSH
	private String memberId;			// 문의한 회원 아이디
	
	public QNA() {
		
	}
	
	public QNA(int qnaNo, String qnaTitle, String qnaContent, String qnaAnswerState, String qnaAnswerContent,
			Date qnaAnswerDate, int qnaContentNo, Date qnaDate, int memberNo) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaAnswerState = qnaAnswerState;
		this.qnaAnswerContent = qnaAnswerContent;
		this.qnaAnswerDate = qnaAnswerDate;
		this.qnaContentNo = qnaContentNo;
		this.qnaDate = qnaDate;
		this.memberNo = memberNo;
	}
	
	public QNA(int listNo, Date qnaDate, String qnaTitle, String qnaAnswerState, String qnaContent, String qnaAnswerContent) {
		super();
		this.listNo = listNo;
		this.qnaDate = qnaDate;
		this.qnaTitle = qnaTitle;
		this.qnaAnswerState = qnaAnswerState;
		this.qnaContent = qnaContent;
		this.qnaAnswerContent = qnaAnswerContent;
	}

	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaAnswerState() {
		return qnaAnswerState;
	}
	public void setQnaAnswerState(String qnaAnswerState) {
		this.qnaAnswerState = qnaAnswerState;
	}
	public String getQnaAnswerContent() {
		return qnaAnswerContent;
	}
	public void setQnaAnswerContent(String qnaAnswerContent) {
		this.qnaAnswerContent = qnaAnswerContent;
	}
	public Date getQnaAnswerDate() {
		return qnaAnswerDate;
	}
	public void setQnaAnswerDate(Date qnaAnswerDate) {
		this.qnaAnswerDate = qnaAnswerDate;
	}
	public int getQnaContentNo() {
		return qnaContentNo;
	}
	public void setQnaContentNo(int qnaContentNo) {
		this.qnaContentNo = qnaContentNo;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getListNo() {
		return listNo;
	}
	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "QNA [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaAnswerState="
				+ qnaAnswerState + ", qnaAnswerContent=" + qnaAnswerContent + ", qnaAnswerDate=" + qnaAnswerDate
				+ ", qnaContentNo=" + qnaContentNo + ", qnaDate=" + qnaDate + ", memberNo=" + memberNo + "]";
	}

}
