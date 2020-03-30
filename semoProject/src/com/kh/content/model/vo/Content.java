package com.kh.content.model.vo;

public class Content {
	
	private int contactNo;
	private String contactTitle;
	private String contatctContent;
	
	public Content() {}

	public Content(int contactNo, String contactTitle, String contatctContent) {
		super();
		this.contactNo = contactNo;
		this.contactTitle = contactTitle;
		this.contatctContent = contatctContent;
	}

	public int getContactNo() {
		return contactNo;
	}

	public void setContactNo(int contactNo) {
		this.contactNo = contactNo;
	}

	public String getContactTitle() {
		return contactTitle;
	}

	public void setContactTitle(String contactTitle) {
		this.contactTitle = contactTitle;
	}

	public String getContatctContent() {
		return contatctContent;
	}

	public void setContatctContent(String contatctContent) {
		this.contatctContent = contatctContent;
	}

	@Override
	public String toString() {
		return "Content [contactNo=" + contactNo + ", contactTitle=" + contactTitle + ", contatctContent="
				+ contatctContent + "]";
	}

}
