package kr.or.iei.model.vo;

public class Basketball extends Sports{

	private String howToMove; //어떻게 움직이는지
	private int peopleCount;  //몇명이서 플레이하는지
	private String whatClothes; //어떤 옷을 입는지
	
	public Basketball() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Basketball(String howToMove, int peopleCount, String whatClothes) {
		super();
		this.howToMove = howToMove;
		this.peopleCount = peopleCount;
		this.whatClothes = whatClothes;
	}
	public String getHowToMove() {
		return howToMove;
	}
	public void setHowToMove(String howToMove) {
		this.howToMove = howToMove;
	}
	public int getPeopleCount() {
		return peopleCount;
	}
	public void setPeopleCount(int peopleCount) {
		this.peopleCount = peopleCount;
	}
	public String getWhatClothes() {
		return whatClothes;
	}
	public void setWhatClothes(String whatClothes) {
		this.whatClothes = whatClothes;
	}
	
	
	
}
