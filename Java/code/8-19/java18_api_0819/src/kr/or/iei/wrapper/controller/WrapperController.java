package kr.or.iei.wrapper.controller;

public class WrapperController {

	
	/*
	 wrapper 클래스 : 기본자료형을 참조자료형(객체)화 해주는 클래스.
	 
	  boolean		=> 		Boolean
	  char			=> 		Character
	  byte			=>		Byte
	  short			=>		Short
	  int 			=> 		Integer
	  long			=> 		Long
	  float			=>		Float
	  double		=>		Double
	 */
	public void test() {
		//int => Integer
		Integer iNum = new Integer(10);
		//byte => Byte
		Byte bNum = new Byte((byte)5);
		//short => Short
		Short sNum = new Short((short) 100);
		//double => Double
		Double dNum = new Double(52.124);
		//float = Float
		Float fNum = new Float(12.1234);
		//char => Character
		Character ch = new Character('a');
		//boolean => Boolean
		Boolean bool = new Boolean(false);
		
		// 30이란 숫자의 자료형은 int => Integer 형변환 => 오토 박싱(auto Boxing)
		Integer iNum2 = 30; //기본 자료형 선언 및 할당과 동일하게 사용 가능.
		System.out.println("iNum : " + iNum2);
		
		int iNum3 = iNum2; //Integer => int => 오토 언박싱(auto unBoxing)
		
		Boolean bool2 = true;
		boolean bool3 = bool2;
		
		//Wrapper 클래스 제공 메소드
		long lNum = iNum2.longValue();
		double dNum2 = iNum2.doubleValue();
		float fNum2 = iNum2.floatValue();
		
		//String => Integer
		Integer iNum4 = new Integer("1234"); //문자열 1324를 숫자 1234로 변환
		
		//String => Integer
		int iNum5 = Integer.parseInt("1324");
		
		
	}
}
