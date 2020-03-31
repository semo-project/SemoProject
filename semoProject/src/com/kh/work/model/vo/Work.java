package com.kh.work.model.vo;

import java.sql.Date;

public class Work {
	
	private int workNo;
	private String updateDay;
	private Date startDay;
	private Date requestDate;
	private Date approvalDate;
	private String workSummary;
	private String workPlot;
	private String approvalStatus;
	private int serialCnt;
	private int bookmarkCnt;
	private String thumbnailModify;
	private String thumbnailOriginal;
	private String secretFlag;
	private int writerNo;
	private String workTitle;
	private int genreNo;
	private String genreName;
	private String starGrade;
	//LSH
	private String nickName;
	private String genre;
	private int episodeNo;
	private String episodeTitle;
	
	public Work() {

	
	}
	public Work(int workNo, int writerNo, String starGrade) {
		super();
		this.workNo = workNo;
		this.writerNo = writerNo;
		this.starGrade = starGrade;
	}




	public Work(String workSummary, String thumbnailModify, String workTitle) {
		super();
		this.workSummary = workSummary;
		this.thumbnailModify = thumbnailModify;
		this.workTitle = workTitle;
	}

	
	//mondayList
	public Work(int workNo, String updateDay, Date approvalDate, int serialCnt, int writerNo,
			String workTitle, String thumbnailModify) {
		super();
		this.workNo = workNo;
		this.updateDay = updateDay;
		this.approvalDate = approvalDate;
		this.serialCnt = serialCnt;
		this.writerNo = writerNo;
		this.workTitle = workTitle;
		this.thumbnailModify = thumbnailModify;
	}
	public Work(int workNo, String updateDay, Date startDay, Date requestDate, Date approvalDate, String workSummary,
			String workPlot, String approvalStatus, int serialCnt, int bookmarkCnt, String thumbnailModify,
			String thumbnailOriginal, String secretFlag, int writerNo, String workTitle, int genreNo,
			String genreName) {
		super();
		this.workNo = workNo;
		this.updateDay = updateDay;
		this.startDay = startDay;
		this.requestDate = requestDate;
		this.approvalDate = approvalDate;
		this.workSummary = workSummary;
		this.workPlot = workPlot;
		this.approvalStatus = approvalStatus;
		this.serialCnt = serialCnt;
		this.bookmarkCnt = bookmarkCnt;
		this.thumbnailModify = thumbnailModify;
		this.thumbnailOriginal = thumbnailOriginal;
		this.secretFlag = secretFlag;
		this.writerNo = writerNo;
		this.workTitle = workTitle;
		this.genreNo = genreNo;
		this.genreName = genreName;
	}
	
	// selectList
	public Work(int workNo, String workTitle, int writerNo, int serialCnt, Date approvalDate ,String thumbnailModify) {
		super();
		this.workNo = workNo;
		this.workTitle = workTitle;
		this.writerNo = writerNo;
		this.serialCnt = serialCnt;
		this.approvalDate = approvalDate;
		this.thumbnailModify = thumbnailModify;
	}
	
	
	

	//selectGenreList
	public Work(int workNo, String workTitle, int writerNo, int serialCnt, Date approvalDate) {
		super();
		this.workNo = workNo;
		this.workTitle = workTitle;
		this.writerNo = writerNo;
		this.serialCnt = serialCnt;
		this.approvalDate = approvalDate;
	}
	//selectSerial
	
	
	public Work(int workNo, Date approvalDate, String workSummary, int writerNo, String workTitle, String genreName ,String thumbnailModify) {
		super();
		this.workNo = workNo;
		this.approvalDate = approvalDate;
		this.workSummary = workSummary;
		this.writerNo = writerNo;
		this.workTitle = workTitle;
		this.genreName = genreName;
		this.thumbnailModify = thumbnailModify;
	}
	
	//PJH
	public Work(int workNo, String workSummary, String thumbnailModify, String worktitle) {
		super();
		this.workNo = workNo;
		this.workSummary = workSummary;
		this.thumbnailModify = thumbnailModify;
		this.workTitle = worktitle;
	}
	
	public Work(String updateDay, Date startDay, String workSummary, String workPlot, String thumbnailModify,
			int writerNo, String worktitle) {
		super();
		this.updateDay = updateDay;
		this.startDay = startDay;
		this.workSummary = workSummary;
		this.workPlot = workPlot;
		this.thumbnailModify = thumbnailModify;
		this.writerNo = writerNo;
		this.workTitle = worktitle;
	}
	
	public Work(int workNo, Date startDay, Date requestDate, Date approvalDate, String workSummary, String workPlot,
			String approvalStatus, int serialCnt, int bookmarkCnt, String thumbnailModify, String thumbnailOriginal,
			String secretFlag, int writerNo, String worktitle, String updateDay, int[] workGenre) {
		super();
		this.workNo = workNo;
		this.startDay = startDay;
		this.requestDate = requestDate;
		this.approvalDate = approvalDate;
		this.workSummary = workSummary;
		this.workPlot = workPlot;
		this.approvalStatus = approvalStatus;
		this.serialCnt = serialCnt;
		this.bookmarkCnt = bookmarkCnt;
		this.thumbnailModify = thumbnailModify;
		this.thumbnailOriginal = thumbnailOriginal;
		this.secretFlag = secretFlag;
		this.writerNo = writerNo;
		this.workTitle = worktitle;
		this.updateDay = updateDay;

	}

	public int getWorkNo() {
		return workNo;
	}

	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}

	public String getUpdateDay() {
		return updateDay;
	}

	public void setUpdateDay(String updateDay) {
		this.updateDay = updateDay;
	}

	public Date getStartDay() {
		return startDay;
	}

	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

	public String getWorkSummary() {
		return workSummary;
	}

	public void setWorkSummary(String workSummary) {
		this.workSummary = workSummary;
	}

	public String getWorkPlot() {
		return workPlot;
	}

	public void setWorkPlot(String workPlot) {
		this.workPlot = workPlot;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public int getSerialCnt() {
		return serialCnt;
	}

	public void setSerialCnt(int serialCnt) {
		this.serialCnt = serialCnt;
	}

	public int getBookmarkCnt() {
		return bookmarkCnt;
	}

	public void setBookmarkCnt(int bookmarkCnt) {
		this.bookmarkCnt = bookmarkCnt;
	}

	public String getThumbnailModify() {
		return thumbnailModify;
	}

	public void setThumbnailModify(String thumbnailModify) {
		this.thumbnailModify = thumbnailModify;
	}

	public String getThumbnailOriginal() {
		return thumbnailOriginal;
	}

	public void setThumbnailOriginal(String thumbnailOriginal) {
		this.thumbnailOriginal = thumbnailOriginal;
	}

	public String getSecretFlag() {
		return secretFlag;
	}

	public void setSecretFlag(String secretFlag) {
		this.secretFlag = secretFlag;
	}

	public int getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}

	public String getWorkTitle() {
		return workTitle;
	}

	public void setWorkTitle(String workTitle) {
		this.workTitle = workTitle;
	}

	public int getGenreNo() {
		return genreNo;
	}

	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

	public String getStarGrade() {
		return starGrade;
	}

	public void setStarGrade(String starGrade) {
		this.starGrade = starGrade;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getEpisodeNo() {
		return episodeNo;
	}

	public void setEpisodeNo(int episodeNo) {
		this.episodeNo = episodeNo;
	}

	public String getEpisodeTitle() {
		return episodeTitle;
	}

	public void setEpisodeTitle(String episodeTitle) {
		this.episodeTitle = episodeTitle;
	}

	@Override
	public String toString() {
		return "Work [workNo=" + workNo + ", updateDay=" + updateDay + ", startDay=" + startDay + ", requestDate="
				+ requestDate + ", approvalDate=" + approvalDate + ", workSummary=" + workSummary + ", workPlot="
				+ workPlot + ", approvalStatus=" + approvalStatus + ", serialCnt=" + serialCnt + ", bookmarkCnt="
				+ bookmarkCnt + ", thumbnailModify=" + thumbnailModify + ", thumbnailOriginal=" + thumbnailOriginal
				+ ", secretFlag=" + secretFlag + ", writerNo=" + writerNo + ", workTitle=" + workTitle + ", genreNo="
				+ genreNo + ", genreName=" + genreName + ", starGrade=" + starGrade + ", nickName=" + nickName
				+ ", genre=" + genre + ", episodeNo=" + episodeNo + ", episodeTitle=" + episodeTitle + "]";
	}
}
	
	
	