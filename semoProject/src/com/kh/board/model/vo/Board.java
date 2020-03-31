package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int boardCnt;
	private Date boardWriteDate;
	private int groupType;
	private String status;
	private String boardWriter;
	
	// KJY
	private int memberId;
	private int listNo;
	
	public Board() {
			
	}

	public Board(int boardNo, String boardTitle, String boardContent, int boardCnt, Date boardWriteDate,
	         int groupType, String status, String boardWriter) {
	      super();
	      this.boardNo = boardNo;
	      this.boardTitle = boardTitle;
	      this.boardContent = boardContent;
	      this.boardCnt = boardCnt;
	      this.boardWriteDate = boardWriteDate;
	      this.groupType = groupType;
	      this.status = status;
	      this.boardWriter = boardWriter;
	   }
	   
   public Board(int listNo, int boardNo, String boardTitle, Date boardWriteDate, int boardCnt) {
		super();
		this.listNo = listNo;
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardWriteDate = boardWriteDate;
		this.boardCnt = boardCnt;
	}
   
   public Board(int boardNo, String boardTitle, String boardContent, int boardCnt, Date boardWriteDate,
			int groupType, int memberId) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCnt = boardCnt;
		this.boardWriteDate = boardWriteDate;
		this.groupType = groupType;
		this.memberId = memberId;
	}

	public Board(int boardNo, String boardTitle, int boardCnt, String boardWriter, Date boardWriteDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardCnt = boardCnt;
		this.boardWriter = boardWriter;
		this.boardWriteDate = boardWriteDate;
	}
	  
	public Board(int boardNo, String boardTitle, String boardContent, int boardCnt, Date boardWriteDate,
			int groupType, String status) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCnt = boardCnt;
		this.boardWriteDate = boardWriteDate;
		this.groupType = groupType;
		this.status = status;
		
	}
	
	//게시판 내용 조회
	public Board(int boardNo, String boardTitle, String boardContent, int boardCnt, String boardWriter,
			Date boardWriteDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCnt = boardCnt;
		this.boardWriter = boardWriter;
		this.boardWriteDate = boardWriteDate;
	}
	
	

	public Board(int boardNo, String boardTitle, String boardWriter, Date boardWriteDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
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
	public int getgroupType() {
		return groupType;
	}
	public void setgroupType(int groupType) {
		this.groupType = groupType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardCnt=" + boardCnt + ", boardWriteDate=" + boardWriteDate + ", groupType=" + groupType
				+ ", status=" + status + ", boardWriter=" + boardWriter + "]";
	}	
}
