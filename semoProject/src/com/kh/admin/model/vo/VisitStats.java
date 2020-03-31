package com.kh.admin.model.vo;

public class VisitStats {
	
	private String date;
	private int count;
	
	public VisitStats() {}

	public VisitStats(String date, int count) {
		super();
		this.date = date;
		this.count = count;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "VisitStats [date=" + date + ", count=" + count + "]";
	}

}
