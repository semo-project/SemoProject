package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int boardCnt;
	private Date boardWriteDate;
	private String groupName;
	private String status;
	private int btype;
	private String boardWriter;
	
	public Board() {
		
	}

	public Board(int boardNo, String boardTitle, String boardContent, int boardCnt, Date boardWriteDate,
			String groupName, String status, int btype, String boardWriter) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCnt = boardCnt;
		this.boardWriteDate = boardWriteDate;
		this.groupName = groupName;
		this.status = status;
		this.btype = btype;
		this.boardWriter = boardWriter;
	}

	

	public Board(int boardNo, String boardTitle, int boardCnt, String boardWriter, Date boardWriteDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardCnt = boardCnt;
		this.boardWriter = boardWriter;
		this.boardWriteDate = boardWriteDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardCnt() {
		return boardCnt;
	}

	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}

	public Date getBoardWriteDate() {
		return boardWriteDate;
	}

	public void setBoardWriteDate(Date boardWriteDate) {
		this.boardWriteDate = boardWriteDate;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getBtype() {
		return btype;
	}

	public void setBtype(int btype) {
		this.btype = btype;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardCnt=" + boardCnt + ", boardWriteDate=" + boardWriteDate + ", groupName=" + groupName
				+ ", status=" + status + ", btype=" + btype + ", boardWriter=" + boardWriter + "]";
	}
	
	
	
}
