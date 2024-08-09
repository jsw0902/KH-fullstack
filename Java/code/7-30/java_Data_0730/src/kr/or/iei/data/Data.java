package kr.or.iei.data;

public class Data {
	/*
	 * Java에서 숫자와 문자를 어떻게 표현하는가?
	 * 숫자: 정수(소수점이 없는 수) or  실수(소수점이 있는 수)
	 * 문자: 문자('' 외따움표 안에 표현한 문자) or 문자열("" 쌍따옴표 안에 표현한 문자들의 집합)
	 */
	
	//숫자와 문자 출력
	public void dataTest1() { 
		
		//정수 출력
		System.out.println(10); 
		
		//실수 출력
		System.out.println(1.253); 
		
		//문자 출력(문자는(외따옴표) 한글자만 가능하다. ex)'AB' 두글자는 안됨)
		System.out.println('A');
		//System.out.println('AB');
		
		//쌍따옴표 안에 아무것도 안넣어도 상관 없음
		System.out.println("AB");
		System.out.println("");
		
		
		System.out.println(10.0); //자바에서는 10.0도 실수임 
		
	}
	
	// 동일 타입끼리의 연산
	public void dataTest2() { 
		
		//정수간의 연산
		System.out.println(10+5); 
		System.out.println(5-3);
		System.out.println(3*6);
		System.out.println(15/3);
		
		System.out.println("===========================");
		
		//실수간의 연산
		System.out.println(1.2+1.6);
		System.out.println(1.5+1.5);
		System.out.println(1.5*4);
		
		System.out.println("===========================");
		
		//문자간의 연산
		//문자간의 연산은 아스키코드표에 작성된, 10진수로 변환되어 연산을 수행한다.
		System.out.println('a'+'c'); // 196 출력 
		System.out.println('F'-'B'); // 4 출력
		System.out.println('D'-'D'); // 68-68 = 0 출력
		System.out.println('s'/'s'); // 1
		
		System.out.println("===========================");
		//문자열간의 연산
		//문자열간의 연산은 결합 연산만 가능하다. 결합 연산이란 + 연산자를 통한 문자열을 붙이는 연산.
		System.out.println("Hello" + "Java"); //결합 연산
		//System.out.println("Hello" - "KH"); // 문자열간의 연산은 결합 연산만 가능
		System.out.println("Hello" + " " + "Java");
		System.out.println("10"); //숫자를 작성하더라도, ""안에 작성했으니 문자열임.
	}
	
	//서로 다른 타입끼리의 연산
	//표현범위가 큰 타입으로 변환되어 연산을 수행한다.
	public void dataTest3() {
		
		//정수와 실수의 연산
		System.out.println(10+3.5); //13.5 출력 정수를 실수로 변환해서 계산 (10.0 + 3.5 = 13.5)
		System.out.println(1.5 + 1); // 1.5 + 1.0 = 2.5
		
		//정수와 문자의 연산
		System.out.println(10 + 'a'); // 10 + 97 = 107
		System.out.println(50 - 'c'); // 50 - 99 = -49
		
		//문자열과 다른 타입의 연산
		//정수, 실수, 문자 => 문자열로 변환된다.
		//문자열은 결합연산만 가능하다.
		System.out.println("Hello" + 'c');
		System.out.println("Hello" + 1.25);
		System.out.println("Hello 1.25");
	}

}
