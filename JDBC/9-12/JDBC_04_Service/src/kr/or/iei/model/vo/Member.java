package kr.or.iei.model.vo;

import java.sql.Date;

public class Member {
	private String memberId; 		// 회원ID
	private String memberPw; 		// 회원 비밀번호
	private String memberName; 		// 회원 이름
	private String memberPhone;  	//회원 전화번호(OB에서의 CHAR는 문자열을 저장하는 자료형 JAVA에서의 CHAR는 1개의 문자를 저장하는 자료형)
	private int memberAge;		 	//회원 나이
	private String memberGender;	//회원 성별(char로 저장해도 무방) 
	private Date enrolDate;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String memberId, String memberPw, String memberName, String memberPhone, int memberAge,
			String memberGender, Date enrolDate) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberAge = memberAge;
		this.memberGender = memberGender;
		this.enrolDate = enrolDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public int getMemberAge() {
		return memberAge;
	}

	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public Date getEnrolDate() {
		return enrolDate;
	}

	public void setEnrolDate(Date enrolDate) {
		this.enrolDate = enrolDate;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberPhone=" + memberPhone + ", memberAge=" + memberAge + ", memberGender=" + memberGender
				+ ", enrolDate=" + enrolDate + "]";
	}
	
	
}
