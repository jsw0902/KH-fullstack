package kr.or.iei.oop.chap05;

public class Member {
	
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberGender;
	private String memberAddr;
	private String enrollDate;
	private int memberAge;
	
	public Member() {
		
	}
	
	public Member(String memberId,String memberPw,String memberName,String memberGender, String memberAddr, int memberAge, String enrollDate){ {
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberGender = memberGender;
		this.memberAddr = memberAddr;
		this.memberAge = memberAge;
		this.enrollDate = enrollDate;
	}
		
	}
	
	public String getMemberID() {
		return this.memberId;
	}
	
	public String getMemberPw() {
		return this.memberPw;
	}
	
	public String getMemberName() {
		return this.memberName;
	}
	
	public String getMemberAddr() {
		return this.memberAddr;
	}
	
	public String getMemberGender() {
		return this.memberGender;
	}
	public String getEnrollDate() {
		return this.enrollDate;
	}
	public int getMemberAge() {
		return this.memberAge;
	}
	
	public void setMemberId(String memberID) {
		this.memberId = memberID;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}
}
