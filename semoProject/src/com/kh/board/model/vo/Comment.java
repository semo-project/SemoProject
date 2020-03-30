package com.kh.board.model.vo;

import java.sql.Date;

public class Comment {

	private int commentNo;
	private int comBoardNo;
	private String commentWriter;
	private String commentContent;
	private Date commentDate;
	private Date modifyDate;
	private int likeCnt;
	private int hateCnt;
	private String status;
	
	public Comment() {
		
	}

	public Comment(int commentNo, int comBoardNo, String commentWriter, String commentContent, Date commentDate,
			Date modifyDate, int likeCnt, int hateCnt, String status) {
		super();
		this.commentNo = commentNo;
		this.comBoardNo = comBoardNo;
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
		this.modifyDate = modifyDate;
		this.likeCnt = likeCnt;
		this.hateCnt = hateCnt;
		this.status = status;
	}
	
	//댓글 신고하기 위해 정보 가져오는 생성자
	public Comment(String commentWriter, String commentContent) {
		super();
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
	}
	
	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getComBoardNo() {
		return comBoardNo;
	}

	public void setComBoardNo(int comBoardNo) {
		this.comBoardNo = comBoardNo;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getHateCnt() {
		return hateCnt;
	}

	public void setHateCnt(int hateCnt) {
		this.hateCnt = hateCnt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", comBoardNo=" + comBoardNo + ", commentWriter=" + commentWriter
				+ ", commentContent=" + commentContent + ", commentDate=" + commentDate + ", modifyDate=" + modifyDate
				+ ", likeCnt=" + likeCnt + ", hateCnt=" + hateCnt + ", status=" + status + "]";
	}
	
	
	
}
