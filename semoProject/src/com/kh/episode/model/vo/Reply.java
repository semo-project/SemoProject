package com.kh.episode.model.vo;

import java.sql.Date;

public class Reply {

	private int epCommentNo;
	private String content;
	private Date creationDate;
	private int likeCnt;
	private int hateCnt;
	private String blindStatus;
	private String reportStatus;
	private int episodeNo;
	private int memberNo;
	private int epLike;
	private int epHate;
	private String memberId;
	public Reply () {
		
	}
	public Reply(String content, Date creationDate, String memberId) {
		super();
		this.content = content;
		this.creationDate = creationDate;
		this.memberId = memberId;
	}
	public Reply(int epCommentNo, String content, Date creationDate, int likeCnt, int hateCnt, String blindStatus,
			String reportStatus, int episodeNo, int memberNo, int epLike, int epHate, String memberId) {
		super();
		this.epCommentNo = epCommentNo;
		this.content = content;
		this.creationDate = creationDate;
		this.likeCnt = likeCnt;
		this.hateCnt = hateCnt;
		this.blindStatus = blindStatus;
		this.reportStatus = reportStatus;
		this.episodeNo = episodeNo;
		this.memberNo = memberNo;
		this.epLike = epLike;
		this.epHate = epHate;
		this.memberId = memberId;
	}
	public int getEpCommentNo() {
		return epCommentNo;
	}
	public void setEpCommentNo(int epCommentNo) {
		this.epCommentNo = epCommentNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
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
	public String getBlindStatus() {
		return blindStatus;
	}
	public void setBlindStatus(String blindStatus) {
		this.blindStatus = blindStatus;
	}
	public String getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}
	public int getEpisodeNo() {
		return episodeNo;
	}
	public void setEpisodeNo(int episodeNo) {
		this.episodeNo = episodeNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getEpLike() {
		return epLike;
	}
	public void setEpLike(int epLike) {
		this.epLike = epLike;
	}
	public int getEpHate() {
		return epHate;
	}
	public void setEpHate(int epHate) {
		this.epHate = epHate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "Reply [epCommentNo=" + epCommentNo + ", content=" + content + ", creationDate=" + creationDate
				+ ", likeCnt=" + likeCnt + ", hateCnt=" + hateCnt + ", blindStatus=" + blindStatus + ", reportStatus="
				+ reportStatus + ", episodeNo=" + episodeNo + ", memberNo=" + memberNo + ", epLike=" + epLike
				+ ", epHate=" + epHate + ", memberId=" + memberId + "]";
	}
}