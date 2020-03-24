package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int memberNo;				// 회원 번호
	private String memberId;			// 회원 아이디
	private String memberPwd;			// 회원 비밀번호
	private String memberName;			// 회원 이름
	private String memberNickname;		// 회원 닉네임
	private String memberAddress;		// 주소
	private String phone;				// 전화번호
	private int age;					// 나이
	private String gender;				// 성별
	private String email;				// 이메일
	private Date enrollDate;			// 가입일
	private int myCookieCount;			// 내 쿠키 수
	private String entYN;				// 탈퇴여부
	private Date entDate;				// 탈퇴일
	private String accusationFlag;		// 활동중지여부
	private int accusationCount;		// 누적된 신고 수
	
	private Date modifyDate;			// 회원 수정일
	private Date accusationDate;		// 활동중지일
	
	private String approvalFlag;
	
	public Member() {
		
	}

	public Member(int memberNo, String memberId, String memberPwd, String memberName, String memberNickname,
			String memberAddress, String phone, int age, String gender, String email, Date enrollDate,
			int myCookieCount, String entYN, Date entDate, String accusationFlag, int accusationCount, Date modifyDate,
			Date accusationDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberAddress = memberAddress;
		this.phone = phone;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.enrollDate = enrollDate;
		this.myCookieCount = myCookieCount;
		this.entYN = entYN;
		this.entDate = entDate;
		this.accusationFlag = accusationFlag;
		this.accusationCount = accusationCount;
		this.modifyDate = modifyDate;
		this.accusationDate = accusationDate;
	}

	// LSH 관리자 페이지 처리용 생성자
	public Member(int memberNo, String memberId, String memberName, String phone, int age, String gender,
			Date enrollDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.phone = phone;
		this.age = age;
		this.gender = gender;
		this.enrollDate = enrollDate;
	}
	
	// LSH 관리자 페이지 블랙리스트 조회용 생성자
	public Member(int memberNo, String memberId, int accusationCount, Date accusationDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.accusationCount = accusationCount;
		this.accusationDate = accusationDate;
	}
	
	// KJY
	public Member(int memberNo, String memberId, String memberPwd, String memberName, String memberNickname,
			String memberAddress, String phone, int age, String gender, String email, Date enrollDate,
			int myCookieCount, String entYN, Date entDate, String accusationFlag, int accusationCount) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberAddress = memberAddress;
		this.phone = phone;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.enrollDate = enrollDate;
		this.myCookieCount = myCookieCount;
		this.entYN = entYN;
		this.entDate = entDate;
		this.accusationFlag = accusationFlag;
		this.accusationCount = accusationCount;
	}
	
	// KJY 
	public Member(String memberId, String memberNickname, String memberAddress, String phone, String email) {
		super();
		this.memberId = memberId;
		this.memberNickname = memberNickname;
		this.memberAddress = memberAddress;
		this.phone = phone;
		this.email = email;
	}
	
	// KJH
	public Member(String memberId, String memberPwd, String memberName, String memberNickname, String memberAddress,
			String phone, int age, String gender, String email) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberAddress = memberAddress;
		this.phone = phone;
		this.age = age;
		this.gender = gender;
		this.email = email;
	}
	
	// KJH
	public Member(String memberId, Date enrollDate) {
		this.memberId = memberId;
		this.enrollDate = enrollDate;
	}

	// KJH
	public Member(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getMyCookieCount() {
		return myCookieCount;
	}

	public void setMyCookieCount(int myCookieCount) {
		this.myCookieCount = myCookieCount;
	}

	public String getEntYN() {
		return entYN;
	}

	public void setEntYN(String entYN) {
		this.entYN = entYN;
	}

	public Date getEntDate() {
		return entDate;
	}

	public void setEntDate(Date entDate) {
		this.entDate = entDate;
	}

	public String getAccusationFlag() {
		return accusationFlag;
	}

	public void setAccusationFlag(String accusationFlag) {
		this.accusationFlag = accusationFlag;
	}

	public int getAccusationCount() {
		return accusationCount;
	}

	public void setAccusationCount(int accusationCount) {
		this.accusationCount = accusationCount;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Date getAccusationDate() {
		return accusationDate;
	}

	public void setAccusationDate(Date accusationDate) {
		this.accusationDate = accusationDate;
	}

	public String getApprovalFlag() {
		return approvalFlag;
	}

	public void setApprovalFlag(String approvalFlag) {
		this.approvalFlag = approvalFlag;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", memberNickname=" + memberNickname + ", memberAddress=" + memberAddress + ", phone="
				+ phone + ", age=" + age + ", gender=" + gender + ", email=" + email + ", enrollDate=" + enrollDate
				+ ", myCookieCount=" + myCookieCount + ", entYN=" + entYN + ", entDate=" + entDate + ", accusationFlag="
				+ accusationFlag + ", accusationCount=" + accusationCount + ", modifyDate=" + modifyDate
				+ ", accusationDate=" + accusationDate + ", approvalFlag=" + approvalFlag + "]";
	}
}
