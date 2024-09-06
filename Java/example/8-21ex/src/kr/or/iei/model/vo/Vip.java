package kr.or.iei.model.vo;

public class Vip extends Grade {

	public Vip() {
	}

	public Vip(String grade,String name , int point) {
		super(grade, name, point);
	}

	public double getBonus() {
		return super.getPoint() * 0.07;
	}
}
