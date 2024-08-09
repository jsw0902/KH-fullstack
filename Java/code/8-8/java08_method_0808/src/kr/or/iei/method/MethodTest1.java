package kr.or.iei.method;

/*
 [메소드 표현식]
 
 public void test1(){
 	실행코드;
 }
 접근제어지시자 반환형 메소드명칭(매개변수1, 매개변수2, 매개변수3......){
 	실행코드;
 }
 
 - 접근제어지시자 : 메소드를 호출할 수 있는 점위를 지정하는 예약어.
 	1) public : 해당 프로젝트 내부에서 호출 가능.
 	2) protected : 후손관계 or 동일 패키지 내부에서 호출 가능.
 	3) default : 동일 패키지 내부에서 호출 가능.
 	4) private : 동일 클래스 내부에서 호출 가능.
 	
 	범위) public > protected > default > private
 */

public class MethodTest1 {
	
	public void publicMethod() {
		System.out.println("이건 publicMethod야. 어디에서나 호출 가능하지");
	}
	
	protected void protectedMethod() {
		System.out.println("이건 protectedMethod야. 후손관계 or 동일 패키지 내부에서 호출 가능해");
	}
	
	//접근제어지시자 작성하지 않으면 -> default
	void DefaltMethod() {
		System.out.println("이건 DefaltMethod야 동일 패키지 내부에서 호출 가능해");
	}
	
	private void privateMethod() { //노란줄로 표시되는 이유 : 이 클래스 내부에서 밖에 호출을 못한다고 안내해주는 것
		System.out.println("이건 privateMethod야. 동일 클래스 내부에서만 호출 가능해");
	}
	
	//메소드 내부에서 또 다른 메소드 호출 가능.
	public void test() {
		publicMethod();
		protectedMethod();
		DefaltMethod();
		privateMethod();
		
	}
	
}
