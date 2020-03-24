package com.kh.episode.model.vo;

import java.sql.Date;

public class Episode {

	private int episodeNo;
	private Date registDate;
	private Date approvalDate;
	private String ApprovalStatus;
	private int viewsCnt;
	private Date modificationDate;
	private int starGrade;
	private int likeCnt;
	private int serialCnt;
	private String writerComment;
	private String secretFlag;
	private int workNo;
	
	public Episode () {
		
	}

	public Episode(int episodeNo, Date registDate, Date approvalDate, String approvalStatus, int viewsCnt,
			Date modificationDate, int starGrade, int likeCnt, int serialCnt, String writerComment, String secretFlag,
			int workNo) {
		super();
		this.episodeNo = episodeNo;
		this.registDate = registDate;
		this.approvalDate = approvalDate;
		ApprovalStatus = approvalStatus;
		this.viewsCnt = viewsCnt;
		this.modificationDate = modificationDate;
		this.starGrade = starGrade;
		this.likeCnt = likeCnt;
		this.serialCnt = serialCnt;
		this.writerComment = writerComment;
		this.secretFlag = secretFlag;
		this.workNo = workNo;
	}

	public int getEpisodeNo() {
		return episodeNo;
	}

	public void setEpisodeNo(int episodeNo) {
		this.episodeNo = episodeNo;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

	public String getApprovalStatus() {
		return ApprovalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		ApprovalStatus = approvalStatus;
	}

	public int getViewsCnt() {
		return viewsCnt;
	}

	public void setViewsCnt(int viewsCnt) {
		this.viewsCnt = viewsCnt;
	}

	public Date getModificationDate() {
		return modificationDate;
	}

	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}

	public int getStarGrade() {
		return starGrade;
	}

	public void setStarGrade(int starGrade) {
		this.starGrade = starGrade;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getSerialCnt() {
		return serialCnt;
	}

	public void setSerialCnt(int serialCnt) {
		this.serialCnt = serialCnt;
	}

	public String getWriterComment() {
		return writerComment;
	}

	public void setWriterComment(String writerComment) {
		this.writerComment = writerComment;
	}

	public String getSecretFlag() {
		return secretFlag;
	}

	public void setSecretFlag(String secretFlag) {
		this.secretFlag = secretFlag;
	}

	public int getWorkNo() {
		return workNo;
	}

	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}

	@Override
	public String toString() {
		return "Episode [episodeNo=" + episodeNo + ", ApprovalStatus=" + ApprovalStatus + ", viewsCnt=" + viewsCnt
				+ ", starGrade=" + starGrade + ", likeCnt=" + likeCnt + ", serialCnt=" + serialCnt + ", writerComment="
				+ writerComment + ", secretFlag=" + secretFlag + ", workNo=" + workNo + "]";
	}
}
