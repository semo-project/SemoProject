package com.kh.episode.model.vo;

import java.sql.Date;

public class EpNotice {
	
	private int NoticeNo;
	private int MemberNo;
	private String Title;
	private String Content;
	private Date WriterDate;

	
	public EpNotice() {
		
	}


	public EpNotice(int noticeNo, int memberNo, String title, String content, Date writerDate) {
		super();
		NoticeNo = noticeNo;
		MemberNo = memberNo;
		Title = title;
		Content = content;
		WriterDate = writerDate;
	}


	public int getNoticeNo() {
		return NoticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		NoticeNo = noticeNo;
	}


	public int getMemberNo() {
		return MemberNo;
	}


	public void setMemberNo(int memberNo) {
		MemberNo = memberNo;
	}


	public String getTitle() {
		return Title;
	}


	public void setTitle(String title) {
		Title = title;
	}


	public String getContent() {
		return Content;
	}


	public void setContent(String content) {
		Content = content;
	}


	public Date getWriterDate() {
		return WriterDate;
	}


	public void setWriterDate(Date writerDate) {
		WriterDate = writerDate;
	}


	@Override
	public String toString() {
		return "EpNotice [NoticeNo=" + NoticeNo + ", MemberNo=" + MemberNo + ", Title=" + Title + ", Content=" + Content
				+ ", WriterDate=" + WriterDate + "]";
	}

}