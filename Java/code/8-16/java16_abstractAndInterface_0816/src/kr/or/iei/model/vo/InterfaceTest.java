package kr.or.iei.model.vo;


/*
 * 인터페이스 : 상수와 abstract 메소드만으로 이루어진 클래스의 변형체
 * 
 */
public interface InterfaceTest {

	public final double PI = 3.14;
	public final int HOURS_OF_DAY = 24;
	
	public abstract void testMtd1();
	public abstract int testMtd2();
	
	//final 키워드를 붙이지 않아도, 상수로 처리된다.
	public int DAYS_OF_MONTH = 31;
	
	//abstract 키둬드를 메소드에 작성하지 않아도, 추상메소드로 처리한다.
	public void testMtd3();
}
