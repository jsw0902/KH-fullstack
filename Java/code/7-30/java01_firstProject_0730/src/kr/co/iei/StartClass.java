package kr.co.iei;
//(1) import: 다른 클래스를 사용하겠다는 의미
import kr.co.iei.TestClass1; // 패키지 경로 + 클래스 이름 
import kr.co.iei.TestClass2;

/* 실행 클래스: 실행 메소드를 포함한 클래스
 * - 실행 클래스는 프로젝트당 1개만 존재한다. (단, 수업할때는 여러개 존재)
 * - 프로젝트를 실행시키기 위해서 존재한다.
 */
public class StartClass { // 메소드가 있는 클래스는 실행 클래스
	public static void main(String[] args) { // 실행 메소드: 프로젝트를 실행시키기 위한 기능을 포함
		
		TestClass1 tc1 = new TestClass1();// (2) 약어 설정 ex)TestClass1을 tc1로 선언, [표현법] 클래스 이름 약어 = new 클래스이름();
		TestClass2 tc2 = new TestClass2();
		
		tc1.printTest(); // (3) 약어.기능메소드() 기능 호출
		tc1.printTest2();
		tc2.test1();
	}

}
