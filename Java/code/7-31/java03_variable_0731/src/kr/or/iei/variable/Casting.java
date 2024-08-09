package kr.or.iei.variable;

public class Casting {
	/*
	 형변환: 자료형의 변환
	 - 컴퓨터의 동작 원칙이 지켜지지 않는 경우, 자동 또는 강제로 데이터의 자료형을 변환 시키는 것
	 - 즉, 서로 다른 자료형끼리의 대입이나, 연산을 하는 경우 형변환이 진행된다.
	 */
	
	// 자동 형변환: 범위(크기)가 작은 자료형 -> 범위(크기)가 큰 자료형 
	public void test1() {
		
		byte num1 = 45; // -128 ~ 127
		
		short num2 = num1; //num2변수에 num1의 값 45를 할당
		//short num2 = (short)num1; //내부 작동
		
		System.out.println("num2:" + num2);
		
		int num3 = num2; // 내부 작동 -> int num3 = (int)num2;
		System.out.println("num2:" + num3);
		
		char ch = 'G';
		System.out.println("ch: " + ch);
		
		System.out.println(20 + 'a'); // 20 + 97 = 107
		int num4 = ch; //문자는 숫자로 변환되어서 num4에 대입.
		System.out.println("num4: " + num4);
	}
	
	/* 강제 형변환
	 	[표현법]
	 	변환하고싶은 자료형 변수1 = (변환하고싶은자료형) 변수2;
	 	
	 	강제 형변환은 언제써야하는가?
	 	- 필요한 결과를 얻고 싶을 때
	 	- 데이터의 범위가 큰 자료형 -> 데이터의 범위가 작은 자료형
	 */
	public void test2() {
		int number1 = 10;
		int number2 = 3;
		double number3 = number1 / number2;
		//10 / 3 = 3을 double로 저장하려고 하니 3 -> 3.0
		
		System.out.println("number: " + number3);
		
		//강제 형변환
		number3 = (double)number1 / number2; // 필요한 결과를 얻고 싶을 때 강제형 변환을 사용함
		System.out.println("number: " + number3);
		
		short number4 = (short)number2; // 데이터의 범위가 큰 자료형을 데이터의 범위가 작은 자료형으로 바꾸고 싶을 때 사용.
		
	}
	public void test3() {
		//정수형-기본자료형보다, 작은 자료형끼리의 (byte, short) 연산 결과 -> 기본자료형(int)
		//즉, 대입할 변수보다 대입되는 값의 자료형이 범위가 더 크다. -> 강제 형변환
		byte num1 = 40;
		byte num2 = 20;
		byte sum = (byte)(num1 + num2); //결과의 자료형? -> 기본이 int 라서 강제 형변환으로 byte로 만들어줌
		
		short num3 = 40;
		short num4 = 20;
		short num5 = (short)(num3 + num4);
		
		float fNum1 = 1.25f;
		float fNum2 = 3.5f;
		float fSum = fNum1 + fNum2;
		
	}
	public void test4() {
		//강제 형변환 시, 주의사항
		int num1 = 290;
		byte num2 = (byte) num1;
		
		System.out.println("num1: " + num1);
		System.out.println("num2: " + num2);
		
		//2진수: ex)10101011101 -> 각 자릿수를 bit라고 표현함.
		//1Byte: 8개의 bit
		//2Byte: 16개의 bit
		//4Byte: 32개의 bit
		
		//int(4Byte) -> 0000 0000 0000 0000 0000 0000 0000 0000
		//10진수 290 2진수 -> 0000 0000 0000 0000 0000 0001 0010 0010
		// 											   (앞)0010 0010(뒤)
		/*
		(앞)
		 0 : 2의 7승 * 0 = 0
		 0 : 2의 6승 * 0 = 0
		 1 : 2의 5승 * 1 = 32
		 0 : 2의 4승 * 0 = 0
		 
		 0 : 2의 3승 * 0 = 0
		 0 : 2의 2승 * 0 = 0
		 1 : 2의 1승 * 1 = 2
		 0 : 2의 0승 * 0 = 0
		(뒤)
		 */
	}
}
