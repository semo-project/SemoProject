package com.kh.admin.model.vo;

// 회원의 연령별 성별 통계를 나타내기 위한 객체 클래스
public class MemberStats {
	
	private String gender;		// 성별 (F/M)
	private int age;			// 연령 (0, 1, 2...)
	private String ageString; 	// 연령 (소아, 10대, 20대...)
	private int count;			// 회원 수
	
	public MemberStats() {
	}

	public MemberStats(String gender, int age, String ageString, int count) {
		super();
		this.gender = gender;
		this.age = age;
		this.ageString = ageString;
		this.count = count;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getAgeString() {
		return ageString;
	}

	public void setAgeString(String ageString) {
		this.ageString = ageString;
	}

	@Override
	public String toString() {
		return "MemberStats [gender=" + gender + ", age=" + age + ", ageString=" + ageString + ", count=" + count + "]";
	}

}
