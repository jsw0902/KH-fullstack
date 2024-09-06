package kr.or.iei.model.vo;

public class Silver extends Grade{

	public Silver() {
	}

	public Silver(String grade, String name, int point) {
		super(grade, name, point);
	}
	
	public double getBonus() {
		return super.getPoint() * 0.02;
	}

	/*
	@Override
	public double getBonus() {
		return super.getPoint() * 0.02;
	}
	*/
}
