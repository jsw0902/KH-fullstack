package kr.or.iei.chap01.model.vo;

public class LgTV extends TV{
	
	@Override
	public void overrideMethod() {
		System.out.println("this is override Method ! And i am LGTV");
	}
	
	public String getLgTVFunc() {
		return "this is getLgTVFunc()";
	}
}
