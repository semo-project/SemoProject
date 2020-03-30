package com.kh.episode.model.vo;

import java.sql.Date;

public class Episode {

	private int episodeNo;
	private Date registDate;
	private Date approvalDate;
	private String approvalStatus;
	private int viewsCnt;
	private Date modificationDate;
	private int starGrade;
	private int likeCnt;
	private int serialCnt;
	private String writerComment;
	private String secretFlag;
	private int workNo;
	
	private int fileNo;
	private String episodeModify;
	private int fileLevel;
	private String workTitle;
	private String episodeTitle;
	
	// LSH
	private String nickName;
	
	
	public Episode () {
		
	}

	public Episode(int episodeNo, Date registDate, Date approvalDate, String approvalStatus, int viewsCnt,
			Date modificationDate, int starGrade, int likeCnt, int serialCnt, String writerComment, String secretFlag,
			int workNo) {
		super();
		this.episodeNo = episodeNo;
		this.registDate = registDate;
		this.approvalDate = approvalDate;
		this.approvalStatus = approvalStatus;
		this.viewsCnt = viewsCnt;
		this.modificationDate = modificationDate;
		this.starGrade = starGrade;
		this.likeCnt = likeCnt;
		this.serialCnt = serialCnt;
		this.writerComment = writerComment;
		this.secretFlag = secretFlag;
		this.workNo = workNo;
	}
	
	public Episode(int episodeNo, Date approvalDate, int viewsCnt, String workTitle, String episodeTitle) {
		super();
		this.episodeNo = episodeNo;
		this.approvalDate = approvalDate;
		this.viewsCnt = viewsCnt;
		this.workTitle = workTitle;
		this.episodeTitle = episodeTitle;
	}
	
	public Episode(int episodeNo, String workTitle, String episodeTitle) {
		super();
		this.episodeNo = episodeNo;
		this.workTitle = workTitle;
		this.episodeTitle = episodeTitle;
	}
	
	public Episode(int episodeNo, Date registDate, Date approvalDate, String approvalStatus, int viewsCnt,
			Date modificationDate, int starGrade, int likeCnt, int serialCnt, String writerComment, String secretFlag,
			int workNo, int fileNo, String episodeModify, int fileLevel, String workTitle, String episodeTitle) {
		super();
		this.episodeNo = episodeNo;
		this.registDate = registDate;
		this.approvalDate = approvalDate;
		this.approvalStatus = approvalStatus;
		this.viewsCnt = viewsCnt;
		this.modificationDate = modificationDate;
		this.starGrade = starGrade;
		this.likeCnt = likeCnt;
		this.serialCnt = serialCnt;
		this.writerComment = writerComment;
		this.secretFlag = secretFlag;
		this.workNo = workNo;
		this.fileNo = fileNo;
		this.episodeModify = episodeModify;
		this.fileLevel = fileLevel;
		this.workTitle = workTitle;
		this.episodeTitle = episodeTitle;
	}
	
	
	

	public Episode(int episodeNo, Date approvalDate, String workTitle, String episodeTitle) {
			super();
			this.episodeNo = episodeNo;
			this.approvalDate = approvalDate;
			this.workTitle = workTitle;
			this.episodeTitle = episodeTitle;
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
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		approvalStatus = this.approvalStatus;
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
	
	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getEpisodeModify() {
		return episodeModify;
	}

	public void setEpisodeModify(String episodeModify) {
		this.episodeModify = episodeModify;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getWorkTitle() {
		return workTitle;
	}

	public void setWorkTitle(String workTitle) {
		this.workTitle = workTitle;
	}

	public String getEpisodeTitle() {
		return episodeTitle;
	}

	public void setEpisodeTitle(String episodeTitle) {
		this.episodeTitle = episodeTitle;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Episode [episodeNo=" + episodeNo + ", registDate=" + registDate + ", approvalDate=" + approvalDate
				+ ", approvalStatus=" + approvalStatus + ", viewsCnt=" + viewsCnt + ", modificationDate="
				+ modificationDate + ", starGrade=" + starGrade + ", likeCnt=" + likeCnt + ", serialCnt=" + serialCnt
				+ ", writerComment=" + writerComment + ", secretFlag=" + secretFlag + ", workNo=" + workNo + ", fileNo="
				+ fileNo + ", episodeModify=" + episodeModify + ", fileLevel=" + fileLevel + ", workTitle=" + workTitle
				+ ", episodeTitle=" + episodeTitle + "]";
	}
}
