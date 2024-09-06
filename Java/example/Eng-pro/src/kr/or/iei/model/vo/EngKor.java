package kr.or.iei.model.vo;

public class EngKor {

	private String engWord;
	private String kor1;
	private String kor2;
	public EngKor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EngKor(String engWord, String kor1, String kor2) {
		super();
		this.engWord = engWord;
		this.kor1 = kor1;
		this.kor2 = kor2;
	}
	public String getEngWord() {
		return engWord;
	}
	public void setEngWord(String engWord) {
		this.engWord = engWord;
	}
	public String getKor1() {
		return kor1;
	}
	public void setKor1(String kor1) {
		this.kor1 = kor1;
	}
	public String getKor2() {
		return kor2;
	}
	public void setKor2(String kor2) {
		this.kor2 = kor2;
	}
	@Override
	public String toString() {
		return engWord + "/" + kor1 + "/" + kor2 + "\n";
	}
	
}
