package kr.or.iei.variable;

public class Variable {
	public void test1() {
		System.out.println(123456789);
		System.out.println(123456789);
		System.out.println(123456789);
		System.out.println(123456789);
		System.out.println(123456789);
		System.out.println(123456789); // ex)1000번째 라인
		/*
		 * 여기가 만약에 1000번째 라인이고, 동일한 숫자를 500번 사용해야 한다면?
		 * 이후, 동일한 숫자를 변경해야 한다면 => 500개의 숫자를 모두 찾아서 일일이 수정을 진행.
		 * 
		 */
	}
	
	//변수의 선언
	public void test2() {
		/*
		 * [표현법]
		 * 자료형 변수명; <- 변수 선언
		 * 자료형 변수명 = 값; <- 변수 선언과 값 할당을 동시에 할 수 있음
		 * 
		 * 기본 자료형 분류
		 * 논리형: boolean 표현범위: true/false
		 * 문자형: char
		 * 정수형: byte, short, int(기본), long
		 * 실수형: float, double(기본)
		 * 
		 * 자료형의 종류
		 * - 기본형: 실제 데이터(값)를 저장 (기본 자료형은 8개가 있음)
		 * - 참조형: 데이터가 저장되어 있는 주소를 저장
		 * 
		 * 크기에 맞게 사용하지 않으면 메모리 누수가 발생할 수 있음
		 * ex)맥주잔에 소주를 마시는 것 or 소주잔에 맥주를 마시는 것
		 */
		
		//기본 자료형 8개
		
		//정수형 변수 선언
		byte a;
		int b;
		
		//실수형 변수 서언
		float c;
		double d; //실수형의 기본 자료형
		
		//문자형 변수 선언
		char e;
		
		//논리형 변수 선언
		boolean f; //여기에 들어갈 수 있는 값은 true(참)/false(거짓)
		
		//참조 자료형은 기본형 8개 이외 것들
		String g; //문자열을 저장할 수 있는 자료형 대문자로 사용
	}
	
	//변수 명명규칙
	public void test3() {
		
		//필수적으로 지켜야되는 것(안지키면 에러가 발생함)
		//1. 대소문자가 구분되고 길이 제한이 없다.
		int num;
		int Num;
		
		//2. 변수명을 숫자로 시작할 수 없음.
		int num1;
		//int 1num; 
		
		//3. 특수문자는 $와 _만 사용 가능하다.
		int num_2;
		int num$2;
		int num$;
		//int num*2;
		
		//4. 예약어를 사용할 수 없다.(자바에서 사용하는 int, boolean, 기타등등은 사용 불가함)
		//int int;
		
		//선택 사항(안지켜도 에러가 발생하지 않음 단, 개발자간의 암묵적 규약)
		//1. 한글이 사용 가능하다. -> 지양(모든 언어는 영어 중점으로 되어있어서 잘못하면 한글이 깨짐)
		String 문자열;
		
		//2. 의미가 있는 변수명을 사용. (의미 없는 변수명을 사용하면 코드 이해하기 어려움)
		int a; // <- 의미 없는 변수명
		int Number; //<-의미 있는 변수명
		
		//3. 카멜 표기법을 사용
		int PhoNeNUMbEr; //<-카멜 표기법 미사용
		int phoneNumber; // <- 카멜 표기법 사용
	}
	
	public void test4() {
		int num; //변수 선언
		num = 9999; //변수의 (값) 할당: num 변수에 9999을 기억시킨다.
		
		System.out.println("num: " + num);
		System.out.println("num: " + num);
		System.out.println("num: " + num);
		System.out.println("num: " + num); //<- 변수의 값 할당하면 변수에서 값을 변경해도 굳이 하나하나 값을 안바꿔줘도 적용된다.
		
		/*
		System.out.println("num: " + 10); //<-변수 안쓴거라 값 변경시 직접 하나하나 입력해야됨
		System.out.println("num: " + 10);
		System.out.println("num: " + 10);
		System.out.println("num: " + 10);
		*/
		
		//논리형 변수 선언과 할당
		boolean bool;
		bool = false;
		System.out.println("bool: " + bool);
		
		//변수의 선언과 할당을 동시에
		char ch = 'a';
		System.out.println("ch: " + ch);
		
		//float과 long
		float num1 = 2.154f; //double 자료형으로 인식함 그렇기 때문에 뒤에 f를 붙여 명시적으로 float
		long num2 = 165412316l; //int 자료형으로 인식함. 이유:뒤에 L을 안붙이면 long변수에 int값을 넣는 것임.

		
		//참조자료형(String)
		String str = "안녕하세여";
		System.out.println("str: " + str); //쌍따옴표 안에 들어있는 str과 str은 다른 것 쌍따옴표 안에 있으면 문자열로 인식함
		
		
		// 변수 선언과 값 할당 동시에 
		/*
		int jsw = 8888;
		System.out.println("장승원: " + jsw);
		*/
	}
	
	//변수의 재사용
	public void test5() {
		//변수: 변할 수 있다라는 의미로 생각해도 무방.
		int number1 = 10;
		System.out.println("number: " + number1); //number:10 출력
		
		number1 = 20; //변수의 재할당
		System.out.println("number: " + number1); //number:20 출력
		
		
		//변수의 재사용
		int number2 = number1; //number1에 저장된 20의 값이, number2에 저장됨
		/* 같은 의미임
		int number2 = 20;
		int number2 = number1;
		*/
		
		//변수 할당 시, 연산식도 가능
		int number3 = 10*3;
		//int numberex = 10*3.1; // <- int는 정수만 가능함 10*3.1은 값이 실수가 나와서 안됨 
		
		//문자열의 연산
		String str = "Hello";
		str = str + "Java" + str;
		System.out.println("str: " + str);
	}
	
	//상수: 변하지 않는 값을 저장하기 윈한 공간
	public void test6() {
		/*
		 * 변수의 선언
		 * 자료형 변수명 = 10;
		 */
		
		/*
		 * 상수의 선언
		 * final 자료형 상수명 = 값;
		 * 상수의 명칭은 모두 대문자로 작성(오류는 안나지만 지켜주는게 좋음)
		 */
		
		final float VAT = 0.1f; //부가가치 세율을 저장할 상수
		//VAT = 0.2f; // 상수는 재할당이 불가능함.  
		final int NUM = 10;
		
		final int HOURS_IN_DAY = 24; //단어와 단어를 연결 할 때 _ 기호로 구분함.
		
		final int NUM2;
		NUM2 = 10; //상수 선언 시, 값을 할당하지 않으면 1번은 할당이 가능함
		//NUM2 = 20;
		
	}
	
	// 실습 문제.
	public void test7() {
		/*
		 정수 10을 지정할 변수와, 정수 30을 저장할 변수를 각각 선언하고,
		 두 정수의 합을 저장할 변수를 선언하여라.
		 
		 이후, 각 변수에 저장된 값을 아래와 같이 출력.
		 
		 num1 : 10
		 num2 : 30
		 sum : 40
		 */
		
		int num1 = 10;
		int num2 = 30;
		int sum;
		sum = num1 + num2;
		// int sum = num1 + num2;
		
		System.out.println("num1: " + num1);
		System.out.println("num2: " + num2);
		System.out.println("sum: " + sum);
		//System.out.println("sum: " + (num1+num2)); // 이것도 맞는거긴하나 문제에서는 변수 sum에 넣으라 했기때문에 틀림
		//System.out.println("sum: " + num1 + num2); // 이건 1030으로 출력됨
	}
	public void test8() {
		System.out.println(10+(20+"Hello"+10)+2); //실행전 예상해보기
		/*
		 (20+"Hello"+10) -> 20Hello10 (20과 10이 문자열로 변환되서 Hello와 결합함)
		 (10+(20Hello10)+2) -> 1020Hello102(20Hello10때문에 10과 2도 문자열로 변환되서 결합됨)
		 */
	}
	public void test9() {
		/*
		 정수형 변수 2개를 선언하고 각각 임의의 값을 할당하라.
		 
		 이후, 첫번 째 변수와 두번째 변수로 나눈 결과를 저장할 변수를 선언하여, 아래와 같이 출력
		 
		 나눗셈 결과 : 값
		 */
		
		int num1 = 10;
		int num2 = 2;
		int num3 = num1 / num2;
		
		System.out.println("나눗셈 결과:" + num3);
		
		
		/*
		int num1 = 10;
		int num2 = 3;
		// 10/3=3.333333333333...
		
		double num3 = (double)num1 / num2; // 10.0 / 3.0 = 3.333333....
		//double num3 = num1 / num2; //결과가 3.0임
		
		System.out.println("나눗셈 결과:" + num3);
		*/
		
	}

}
