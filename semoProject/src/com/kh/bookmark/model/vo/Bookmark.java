package com.kh.bookmark.model.vo;

public class Bookmark {
	
	private int MemberNo;
	private int WorkNo;
	private String workTitle;
	private String thumbnailModify;
	private String memberNickname;
	
	public Bookmark() {
		
	}

	public Bookmark(int memberNo, int workNo) {
		super();
		this.MemberNo = memberNo;
		this.WorkNo = workNo;
	}

	public Bookmark( int workNo, String workTitle, String thumbnailModify, String memberNickname) {
		super();
		this.WorkNo = workNo;
		this.workTitle = workTitle;
		this.thumbnailModify = thumbnailModify;
		this.memberNickname = memberNickname;
	}

	public int getMemberNo() {
		return MemberNo;
	}

	public void setMemberNo(int memberNo) {
		MemberNo = memberNo;
	}

	public int getWorkNo() {
		return WorkNo;
	}

	public void setWorkNo(int workNo) {
		WorkNo = workNo;
	}

	public String getWorkTitle() {
		return workTitle;
	}

	public void setWorkTitle(String workTitle) {
		this.workTitle = workTitle;
	}

	public String getThumbnailModify() {
		return thumbnailModify;
	}

	public void setThumbnailModify(String thumbnailModify) {
		this.thumbnailModify = thumbnailModify;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	@Override
	public String toString() {
		return "Bookmark [MemberNo=" + MemberNo + ", WorkNo=" + WorkNo + ", workTitle=" + workTitle
				+ ", thumbnailModify=" + thumbnailModify + ", memberNickname=" + memberNickname + "]";
	}
	
}
