package com.kh.writer.model.vo;

import java.sql.Date;

public class Writer  {
	
	private int writerNo;			// 회원 번호 (작가 번호)
	private String accountNo;		// 계좌 번호
	private String restFlag;		// 휴면 여부
	private String repWorkExp;		// 작품 설명
	private String approvalFlag;	// 승인 여부
	private Date approvalDate;		// 승인 날짜
	private String bankName;		// 은행명
	private String originalName;	// 원본파일명
	private String changeName;		// 수정파일명
	
	// 관리자 - 작가 승인 조회 시 이름, 닉네임, 아이디 받아와야 됨
	private String writerName;
	private String writerNickname;
	private String writerId;
	
	public Writer () {}

	public Writer (int writerNo, String accountNo, String restFlag, String repWorkExp, String approvalFlag,
			Date approvalDate, String bankName, String originalName, String changeName) {
		super();
		this.writerNo = writerNo;
		this.accountNo = accountNo;
		this.restFlag = restFlag;
		this.repWorkExp = repWorkExp;
		this.approvalFlag = approvalFlag;
		this.approvalDate = approvalDate;
		this.bankName = bankName;
		this.originalName = originalName;
		this.changeName = changeName;
	}
	
	// 작가 신청용
	public Writer(int writerNo, String accountNo, String restFlag, String repWorkExp, String bankName, String originalName,
			String changeName) {
		super();
		this.writerNo = writerNo;
		this.accountNo = accountNo;
		this.restFlag = restFlag;
		this.repWorkExp = repWorkExp;
		this.bankName = bankName;
		this.originalName = originalName;
		this.changeName = changeName;
	}

	// 작가 승인 대기 회원 조회용
	public Writer (int writerNo, String writerName, String writerId, String writerNickname) {
		super();
		this.writerNo = writerNo;
		this.writerName = writerName;
		this.writerNickname = writerNickname;
		this.writerId = writerId;
	}
	
	// 작가 승인 대기 회원 세부조회용
	public Writer (int writerNo, String repWorkExp, String originalName, String changeName, String writerNickname) {
		super();
		this.writerNo = writerNo;
		this.repWorkExp = repWorkExp;
		this.originalName = originalName;
		this.changeName = changeName;
		this.writerNickname = writerNickname;
	}
	
	// 작가 조회용
	public Writer(int writerNo, String accountNo, String bankName, String writerName, String writerNickname,
			String writerId) {
		super();
		this.writerNo = writerNo;
		this.accountNo = accountNo;
		this.bankName = bankName;
		this.writerName = writerName;
		this.writerNickname = writerNickname;
		this.writerId = writerId;
	}

	@Override
	public String toString() {
		return "Writer [writerNo=" + writerNo + ", accountNo=" + accountNo + ", restFlag=" + restFlag + ", repWorkExp="
				+ repWorkExp + ", approvalFlag=" + approvalFlag + ", approvalDate=" + approvalDate + ", bankName="
				+ bankName + ", originalName=" + originalName + ", changeName=" + changeName + "]";
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getWriterNickname() {
		return writerNickname;
	}

	public void setWriterNickname(String writerNickname) {
		this.writerNickname = writerNickname;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public int getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getRestFlag() {
		return restFlag;
	}

	public void setRestFlag(String restFlag) {
		this.restFlag = restFlag;
	}

	public String getRepWorkExp() {
		return repWorkExp;
	}

	public void setRepWorkExp(String repWorkExp) {
		this.repWorkExp = repWorkExp;
	}

	public String getApprovalFlag() {
		return approvalFlag;
	}

	public void setApprovalFlag(String approvalFlag) {
		this.approvalFlag = approvalFlag;
	}

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

}
