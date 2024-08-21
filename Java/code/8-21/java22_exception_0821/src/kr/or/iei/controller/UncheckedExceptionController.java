package kr.or.iei.controller;

import java.util.InputMismatchException;
import java.util.Scanner;

/*
UncherckedException : 예외 처리를 강제화 하지 않아도 되는 예외
 - 컨파일상에 문제가 없음.
 - RuntimeException(실행 중 예외 발생) 
 
 
 */
public class UncheckedExceptionController {
	Scanner sc = new Scanner(System.in);
	
	
	public void test1() {
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();
		
		System.out.println("입력한 값 : " + num);
	}
	/*
	 * 
	 * 예외 처리 : try~catch
	 */
	public void test2() {
		System.out.print("정수 입력 : ");
		int num = 0;
		try {
			//예외가 발생할만한 코드를 작성
			//System.out.println("별개의 코드를 뭉터기로 작성해도 무관.");
			num = sc.nextInt();
			
			//위 nextInt()에서 예외 발생 시, catch문으로 디옫ㅇ하기 때문에, 여러 출력 코드는 실행되지 않는다.
			System.out.println("예외 발생 후, 코드");
		} catch (InputMismatchException e) { //try{} 안에서 발생하는 예외의 종류를 작성
			//예외가 발생하면 처리할 코드를 작성.
			System.out.println("숫자가 아닙니다.");
		}
		//위 catch문에서 발생할 예외에 대한 처리를 진행했기 때무넹
		//InputMismatchException 발생 시, 코드가 실행된다.
		System.out.println("프로그램 마지막 코드 ");
		System.out.println("입력한 값 : " + num);
	}
	
	public void test3() {
		
		try {
			System.out.print("첫번 째 정수 입력 : ");
			int num1 = sc.nextInt();
			System.out.print("두번 째 정수 입력 : ");
			int num2 = sc.nextInt();
			
			int div = num1 / num2;
			System.out.println(num1 + " / " + num2 + "=" + div);
			
		}catch(InputMismatchException e) {
			System.out.println("숫자가 아닙니다.");
		}catch(ArithmeticException e) {
			//예외 발생 시, 위에 작성된 InputMismatchException의 발생한 예외 종류가 일치하는지 검사 후,
			//현재 ArithmeticException와 일치하는지 비교
			System.out.println("0으로 나눌 수 없습니다.");
		}
	}
	
	public void test4() {
		try {
			System.out.print("첫번 째 정수 입력 : ");
			int num1 = sc.nextInt();
			System.out.print("두번 째 정수 입력 : ");
			int num2 = sc.nextInt();
			
			int div = num1 / num2;
			System.out.println(num1 + " / " + num2 + "=" + div);
			
		}catch(InputMismatchException e) {
			System.out.println("숫자가 아닙니다.");
			return; //메소드를 종료시키는 코드
		}finally {
			//예외 발생과 상관 없이, 무조건 실행되어야 하는 코드를 finally{} 안에 작성한다.
			//catch안에서 메소드를 종료시켜도, finally{} 코드는 실행된다.
			System.out.println("프로그램 마지막 코드");
		}
		System.out.println("finally 바깥 코드");
	}
	
	public void test5() {
		try {
			System.out.print("첫번 째 정수 입력 : ");
			int num1 = sc.nextInt();
			System.out.print("두번 째 정수 입력 : ");
			int num2 = sc.nextInt();
			
			int div = num1 / num2;
			System.out.println(num1 + " / " + num2 + "=" + div);
			
		}catch(Exception e) {
			//InputMismatchException, ArithmeticException 의 상위 클래스 -> RuntimeException
			//RuntimeException의 상위 클래스 -> Exception
			//다향성에 의해, 발생하는 예외들에 대한 처리가 가능.
			System.out.println("예외 발생");
		}
	}
	
	public void test6() {
		String str = null;
		
		//NullPointerException
		try {
			System.out.println("str의 길이 : " + str.length());			
		} catch(NullPointerException e) {
			System.out.println("null을 참조할 수 없습니다.");
		}
	}
	
	public void test7() {
		int [] arr = new int[5];
		
		try {
			//조건식에 의해, i는 5까지 증가. 배열의 마지막 인덱스는 4이므로 예외 발생
			for(int i = 0; i<=arr.length; i++) {
				arr[i] = i;
			}
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("배열의 참조 범위를 벗어났습니다.");
		}
	}
	
	
	public void test8() { //사용자가 볼 일은 없으나 개발자가 일부러 확인할려고 할때 사용. 보통은 이런식으로 작성 안함
		System.out.println("괸리할 학생의 숫자 입력 : ");
		int peopleCount = sc.nextInt();
		
		if(peopleCount < 1) {
			//UncheckedException에 대한, 사용자 정의 예외 클래스
			UserUncheckedException ex = new UserUncheckedException("입력값 오류");
			throw ex; 
		}
	}
}
