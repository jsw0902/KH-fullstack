package kr.co.iei;

/* ()는 메소드
 * 메소드: 1개의 기능을 담당한다.
 */
public class TestClass1 {// 일반 클래스 or 기능 클래스(일반 클래스말고 기능 클래스로 기억하는게 이해하기 편함), 기능 메소드가 있으면 기능 메소드
	
	public void printTest() { // 기능 메소드 
		System.out.println("Hello KH"); //("Hello KH") 출력을 담당함.
	}
	
	public void printTest2() { // 기능 메소드는 실행 메소드와 달리 여러개 존재할 수 있음.
		System.out.println("이름: 장승원");
		System.out.println("주소: 경기도 남양주시");
	}
}
