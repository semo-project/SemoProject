package com.kh.report.model.vo;

import java.sql.Date;

public class Report {

	private int reportNo;				// 신고 번호
	private String reportClassName;		// 신고 분류 (광고성/음란성/욕설/기타)
	private String reportContent;		// 신고 내용
	private Date reportDate;			// 신고 날짜
	private int reportGroupNo;			// 신고 분류 (1:게시글/2:게시글댓글/3:웹툰에피소드댓글)
	private int writingNo;				// 신고된 게시글 혹은 댓글 번호
	private String confirmFlag;			// 확인 여부
	private int memberNo;				// 신고된 회원 번호
	
	// 조회 시 필요한 컬럼들
	private String memberId;			// 신고된 회원 아이디
	private String boardTitle;			// 신고된 게시글 제목
	// 모달에서 글 넘어갈 때 필요한 board 어쩌고
	private String boardGroupName;		// 게시글의 게시판 구분
	// 모달 켤 때 댓글 내용
	private String commentContent;		// 댓글 내용
	
	public Report() {}

	public Report(int reportNo, String reportClassName, String reportContent, Date reportDate, int reportGroupNo,
			int writingNo, String confirmFlag, int memberNo, String memberId, String boardTitle, String boardGroupName,
			String commentContent) {
		super();
		this.reportNo = reportNo;
		this.reportClassName = reportClassName;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportGroupNo = reportGroupNo;
		this.writingNo = writingNo;
		this.confirmFlag = confirmFlag;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.boardTitle = boardTitle;
		this.boardGroupName = boardGroupName;
		this.commentContent = commentContent;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportClassName() {
		return reportClassName;
	}

	public void setReportClassName(String reportClassName) {
		this.reportClassName = reportClassName;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public int getReportGroupNo() {
		return reportGroupNo;
	}

	public void setReportGroupNo(int reportGroupNo) {
		this.reportGroupNo = reportGroupNo;
	}

	public int getWritingNo() {
		return writingNo;
	}

	public void setWritingNo(int writingNo) {
		this.writingNo = writingNo;
	}

	public String getConfirmFlag() {
		return confirmFlag;
	}

	public void setConfirmFlag(String confirmFlag) {
		this.confirmFlag = confirmFlag;
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

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardGroupName() {
		return boardGroupName;
	}

	public void setBoardGroupName(String boardGroupName) {
		this.boardGroupName = boardGroupName;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportClassName=" + reportClassName + ", reportContent="
				+ reportContent + ", reportDate=" + reportDate + ", reportGroupNo=" + reportGroupNo + ", writingNo="
				+ writingNo + ", confirmFlag=" + confirmFlag + ", memberNo=" + memberNo + ", memberId=" + memberId
				+ ", boardTitle=" + boardTitle + ", boardGroupName=" + boardGroupName + ", commentContent="
				+ commentContent + "]";
	}
	
}
