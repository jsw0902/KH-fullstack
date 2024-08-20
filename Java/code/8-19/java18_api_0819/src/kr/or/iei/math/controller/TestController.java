package kr.or.iei.math.controller;

public class TestController {

	public void test() {
		/*
		 Math 클래스의 패키지 경로 : jsava.lang.Math
		 
		 java.lang 패키지는 import를 하지 않아도 됨.
		 */
		
		System.out.println("파이 : " + Math.PI);
		
		//abs()
		int num = 10;
		System.out.println("10 abs : " + Math.abs(num));
		double dNum = 3.9;
		System.out.println("3.9 abs : " + Math.abs(dNum));
		num = -5;
		System.out.println("-5 abs : " + Math.abs(num)); //절대값의 반환값은 양수.
		
		//ceil() : 올림
		System.out.println("4.567 ceil : " + Math.ceil(4.567));
		System.out.println("4.123 ceil : " + Math.ceil(4.123));
		System.out.println("-10.594 ceil : " + Math.ceil(-10.594));
		
		//round() : 반올림
		System.out.println("1.4999 round : " + Math.round(1.4999));
		System.out.println("1.5 round : " + Math.round(1.5));
		
		//floor() : 버림
		System.out.println("1.1 floor : " + Math.floor(1.1));
		System.out.println("1.1 floor : " + Math.floor(1.9));
		
		//rint() : 가장 가까운 정수값을 실수값으로
		System.out.println("4.499999 rint : " + Math.rint(4.499999));
		System.out.println("4.5 rint : " + Math.rint(4.5));
		System.out.println("4.500001 rint : " + Math.rint(4.500001));
		
		//sqrt() : 제곱근
		System.out.println("4 sqrt : " + Math.sqrt(4));
		System.out.println("9 sqrt : " + Math.sqrt(9));
		System.out.println("100 sqrt : " + Math.sqrt(100));
		System.out.println("10 sqrt : " + Math.sqrt(10));
		
		//pow() : 제곱
		System.out.println("2 pow 2: " + Math.pow(2, 2)); //2*2
		System.out.println("2 pow 10: " + Math.pow(2, 10)); //2*2*2*2*2*2*2*2*2*2
		System.out.println("3 pow 2: " + Math.pow(3, 2)); // 3* 3
		
		//max() : 최대값
		System.out.println("10, 50 최대값(Max) : " + Math.max(10, 50));
		System.out.println("60, 100 최대값(Max) : " + Math.max(60, 100));
		
		//min() : 최소값
		System.out.println("10, 50 최소값(min) : " + Math.min(10, 50));
		System.out.println("60, 100 최소값(min) : " + Math.min(60, 100));
		
		
	}
}
