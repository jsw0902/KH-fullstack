package kr.or.iei.model.vo;

public class Gold extends Grade{

	public Gold() {
	}

	public Gold(String grade, String name, int point) {
		super(grade, name, point);
	}

	
	public double getBonus() {
		return super.getPoint() * 0.05;
	}

}