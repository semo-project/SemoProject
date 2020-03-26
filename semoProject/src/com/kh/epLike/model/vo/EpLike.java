package com.kh.epLike.model.vo;

public class EpLike {
	
	private int memberNo;
	private int episodeNo;
	private String workTitle;
	private String thumbnailModify;
	private String memberNickname;
	
	public EpLike() {
		
	}

	public EpLike(int memberNo, int episodeNo) {
		super();
		this.memberNo = memberNo;
		this.episodeNo = episodeNo;
	}

	public EpLike( int episodeNo, String workTitle, String thumbnailModify, String memberNickname) {
		super();
		this.episodeNo = episodeNo;
		this.workTitle = workTitle;
		this.thumbnailModify = thumbnailModify;
		this.memberNickname = memberNickname;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getEpisodeNo() {
		return episodeNo;
	}

	public void setEpisodeNo(int episodeNo) {
		this.episodeNo = episodeNo;
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
		return "EpLike [memberNo=" + memberNo + ", episodeNo=" + episodeNo + ", workTitle=" + workTitle
				+ ", thumbnailModify=" + thumbnailModify + ", memberNickname=" + memberNickname + "]";
	}
	
	
	

}
