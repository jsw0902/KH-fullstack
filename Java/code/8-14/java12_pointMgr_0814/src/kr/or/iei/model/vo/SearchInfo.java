package kr.or.iei.model.vo;

public class SearchInfo {
	private String srchGrade; //조회 정보가 어느 객체 배열에 속하는지
	private int srchIndex; //조회 정보가 몇번째 인덱스에 존재하는지
	public SearchInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchInfo(String srchGrade, int srchIndex) {
		super();
		this.srchGrade = srchGrade;
		this.srchIndex = srchIndex;
	}
	public String getSrchGrade() {
		return srchGrade;
	}
	public void setSrchGrade(String srchGrade) {
		this.srchGrade = srchGrade;
	}
	public int getSrchIndex() {
		return srchIndex;
	}
	public void setSrchIndex(int srchIndex) {
		this.srchIndex = srchIndex;
	}
	
	
}
