package com.kh.work.model.vo;

import java.sql.Date;
import java.util.Arrays;

public class Work {
	
	private int workNo;
	private Date updateDay;
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
	private String worktitle;
	private String workUpdateDay;
	private int[] workGenre;
	
	//LSH
	private String nickName;
	private String genre;
	
	public Work() {

	}

	public Work(String workSummary, String workPlot, String thumbnailModify, String worktitle, String workUpdateDay,
			int[] workGenre) {
		super();
		this.workSummary = workSummary;
		this.workPlot = workPlot;
		this.thumbnailModify = thumbnailModify;
		this.worktitle = worktitle;
		this.workUpdateDay = workUpdateDay;
		this.workGenre = workGenre;
	}

	public Work(int workNo, Date startDay, Date requestDate, Date approvalDate, String workSummary, String workPlot,
			String approvalStatus, int serialCnt, int bookmarkCnt, String thumbnailModify, String thumbnailOriginal,
			String secretFlag, int writerNo, String worktitle, String workUpdateDay, int[] workGenre) {
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
		this.worktitle = worktitle;
		this.workUpdateDay = workUpdateDay;
		this.workGenre = workGenre;
	}
	
	public Work(int workNo, Date updateDay, Date requestDate, Date approvalDate, String workSummary, String workPlot,
			String approvalStatus, int serialCnt, int bookmarkCnt, String thumbnailModify, String thumbnailOriginal,
			String secretFlag, int writerNo) {
		super();
		this.workNo = workNo;
		this.updateDay = updateDay;
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
	}

	public int getWorkNo() {
		return workNo;
	}

	public void setWorkNo(int workNo) {
		this.workNo = workNo;
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

	public String getWorktitle() {
		return worktitle;
	}

	public void setWorktitle(String worktitle) {
		this.worktitle = worktitle;
	}

	public String getWorkUpdateDay() {
		return workUpdateDay;
	}

	public void setWorkUpdateDay(String workUpdateDay) {
		this.workUpdateDay = workUpdateDay;
	}

	public int[] getWorkGenre() {
		return workGenre;
	}

	public void setWorkGenre(int[] workGenre) {
		this.workGenre = workGenre;
	}

	public Date getUpdateDay() {
		return updateDay;
	}

	public void setUpdateDay(Date updateDay) {
		this.updateDay = updateDay;
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

}
