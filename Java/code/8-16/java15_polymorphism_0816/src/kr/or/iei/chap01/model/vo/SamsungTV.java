package kr.or.iei.chap01.model.vo;

public class SamsungTV extends TV{

	@Override
	public void overrideMethod() {
		System.out.println("this is override Method ! And i am SamsungTV");
	}
	
	public String getSamsungFunc() {
		return "this is getSamsungFunc()";
	}
}
