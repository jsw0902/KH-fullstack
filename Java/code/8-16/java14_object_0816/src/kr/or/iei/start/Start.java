package kr.or.iei.start;

import kr.or.iei.model.vo.*;

public class Start {

	public static void main(String[] args) {
		
		TestClass test1= new TestClass();
		
		// (1) toString() => 패키지경로.클래스명@인스턴스 식별값
		System.out.println("test1 toString() : " + test1.toString());
		System.out.println("test1 : " + test1);
		
		// (2) equals() => 인스턴스의 식별값을 비교하는 메소드
		TestClass test2 = new TestClass();
		System.out.println("test1.equals(test2) : " + test1.equals(test2)); //false
		System.out.println("test1 : " + test1);
		System.out.println("test2 : " + test2);
		
		String str1 = "Hello";
		String str2 = "Hello";
		System.out.println("str1 == str2 : " + (str1==str2));
		System.out.println("str1.equals(str2) : " + str1.equals(str2));
		
		String str3 = new String("Hello");
		String str4 = new String("Hello");
		System.out.println("str3.equals(str4) : " + str3.equals(str4));
		System.out.println("str3 == str4 : " + (str3 == str4));
		System.out.println("str3 : " + str3.hashCode()); //주소값을 보고 싶으면 hashCode 사용
		System.out.println("str4 : " + str4.hashCode());
		System.out.println("str1 : " + str1.hashCode());
		System.out.println("str2 : " + str2.hashCode());
		
		// (3) hashCode() => 인스턴스 식별값을 10진수로 출력 
		System.out.println(test1.hashCode()); 
		System.out.println(test2.hashCode());
		
		//얕은 복사 : 동일한 식별값을 가진다.
		TestClass test3 = test1;
		test1.setA("Test1의 setA()를 통해 문자열 할당");
		System.out.println("test1.getA() : " + test1.getA());
		System.out.println("test3.getA() : " + test3.getA());
		System.out.println("test1 : " + test1); //@7a81197d
		System.out.println("test2 : " + test3);
		
		//깊은 복사 : 별도의 식별값을 가진다.
		CloneTestClass clone1 = new CloneTestClass();
		clone1.setA("clone1 test");
		System.out.println("clone1.getA() : " + clone1.getA());

		CloneTestClass clone2 = (CloneTestClass)clone1.clone();
		System.out.println("clone2.getA() : " + clone2.getA());
		
		System.out.println("clone1 : " + clone1); //@72ea2f77
		System.out.println("clone1 : " + clone2); //@33c7353a
		
		clone1.setB("clone1 setB");
		System.out.println("clone1 getB() : " + clone1.getB());
		System.out.println("clone1 getB() : " + clone2.getB());
	}

	/*
	 * 정리)
	 * 
	 * Object class
	 * 1) 자바에서의 최상위 클래스
	 * 2) 모든 클래스는 암묵적으로 Object 클래스를 상속 받는다. 즉, 모든 클래스는 object의 후손 클래스
	 * 3) 아무것도 상속 받지 않더라도, Object 클래스를 상속 받으니, equals(), hasCode()와 같은 메소드를 사용할 수 있다.
	 * 4) 객체를 직접 복사하기 위해서는 Cloneable 인터페이스를 implements(구현) 해야 한다.
	 * 
	 * equals() : 객체의 식별값을 비교하기 위한 메소드
	 * toString() : 객체의 식별값을 반환. (객체 자체를 출력문에 작성해도, 내부적으로 toString()을 호출)	
	 * hashCode() : 객체의 식별값을 10진수 형태로 반환.
	 * 
	 * 
	 * 
	 */
	
	
	
	
	
	
}
