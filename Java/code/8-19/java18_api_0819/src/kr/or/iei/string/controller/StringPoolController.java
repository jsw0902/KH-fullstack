package kr.or.iei.string.controller;

public class StringPoolController {
	
	public void test1() {
		//기본 자료형 or 참조 자료형
		//String == 문자열 저장하는 변수
		//참조 자료형 : 기본 자료형과 다르게, 실제 값을 저장하는것이 아닌 참조하는 주소값을 저장하는 자료형 
		
		String str1 = new String("hello");
		String str2 = new String("hello");
		
		 //Object 클래스의 toString()을 String 클래스에서 오버라이딩(재정의) 하여, 내부 문자열을 반환하도록 변경.
		System.out.println("str1 : " + str1);
		System.out.println("str1.toString() : " + str1.toString());
		
		System.out.println("str1 == str2 : " + (str1 == str2)); //주소값 비교 == false
		System.out.println("str1.equals(str2) : " + str1.equals(str2)); //Object 클래스 메소드 재정의
		
		//내부 문자열로 해시코드를 생성하기 때문에, 다른 주소값을 가진 2개의 String 변수의 문자열이 같다면 동일한 해시코드값 출력
		System.out.println("str1.hashCode() : " + str1.hashCode());
		System.out.println("str2.hashCode() : " + str2.hashCode());
		
		//실제 주소값을 확인하고 싶을 때
		System.out.println("str1 address : " + System.identityHashCode(str1));
		System.out.println("str2 address : " + System.identityHashCode(str2));
		
	}
	
	public void test2() {
		String str = new String("hello");
		
		String str1 = "hello";
		String str2 = "hello";
		
		System.out.println("str1 : " + str1);
		System.out.println("str2 : " + str2);
		
		//내부 문자열로 해시코드를 생성하기 때문에, 동일한 문자열이면 동일한 해시코드값을 가진다.
		System.out.println("str1 hashCode : " + str1.hashCode());
		System.out.println("str2 hashCode : " + str2.hashCode());
		
		//문자열 비교
		System.out.println("str1.equals(str2) : " + str1.equals(str2));
		System.out.println("str1 == str2 : " + (str1 == str2)); //true
		
		/*
		
		ex)
		String str = "hello"; // 주소값은 A
		String str2 = "java"; // 주소값은 F

		str2 = "hello"; //주소 F에 존재하는 문자열이 java -> hello로 변경되는 것이 아니고,
						//hello 문자열이 위치하는 주소 A 값을 할당한다.

		==========================================================================
		 ----------String Pool----------
		 |	hello		hi			   |
		 |		month		java	   |
		 | c++		python		vs	   |
		 -------------------------------
		 
		 문자열을 new 연산자가 아닌, 리터럴값으로 생성하게 되면, String Pool에 동일한 문자열이 존재하는지 파악한 후,
		 존재하면 해당 문자열의 주소값을 사용하는 개념.
		 
		 */
		
		System.out.println("str1 address : " + System.identityHashCode(str1));
		System.out.println("str2 address : " + System.identityHashCode(str2));
		System.out.println("str address : " + System.identityHashCode(str)); //new 연산자를 통해 생성한 String은 String Pool에 존재하지 않아, 별도의 주소값을 참조
		
		String str3 = "hi";
		System.out.println("str1 == str3 : " + (str1 == str3));
		System.out.println("str3 address : " + System.identityHashCode(str3));
		
		//String 클래스 == 불변클래스(변하지 않는다)
		str3 = "bye";
		System.out.println("str3 address : " + System.identityHashCode(str3)); //주소값이 변경됨.
		
		str3 = "hello";
		System.out.println("str3 address : " + System.identityHashCode(str3)); 
		//내부 문자열을 재할당하면, 기존 주소값의 문자열을 변경하는 것이 아니고,
		//변경한 문자열이 위치한 주소값을 가지게 된다.
		
		
	}
}
