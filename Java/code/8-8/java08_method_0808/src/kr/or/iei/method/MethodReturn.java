package kr.or.iei.method;

import java.util.Scanner;

/*
[메소드 표현식]

public void test1(){
	실행코드;
}
접근제어지시자 반환형 메소드명칭(매개변수1, 매개변수2, 매개변수3......){
	실행코드;
}

반환형 : 메소드의 실행이 종료되고, 결과를 반환할 값의 자료형
	 - 기본자료형 또는 참조자료형 작성 가능.
	 - return 코드에는 변수 or 연산식도 올 수 있다. 단, 반환형에 작성한 자료형과 일치해야 한다.
	 - return 코드를 만나면 반환하고, 그 즉시 메소드를 종료시킨다.
	 - void는 반환할 값이 없음을 의미하며, 특정 조건에서 메소드를 종료하고 싶을 때 사용한다.
	 - void 메소드 내부의 return 코드는 생략이 가능하다(사용해도 되고, 사용하지 않아도 된다.)
*/

public class MethodReturn {
	public int sum() {
		int num1 = 10;
		int num2 = 20;
		int sum = num1 + num2; // 반환할 값.

		return sum; //sum을 반환한다.
		
		//return num1 + num2; //반환형에 작성한 자료형과, 실제 반환하는 값의 자료형만 일치하면 되니까 연산식도 가능하다.
		//Return 20;
		
		// int a = 10; return 이후에는 코드가 도달하지 못함. return은 메소드를 종료시키니까
		
		
		
		
	}
	
	public String printMsg() {
		//사용자 입력받은 문자열을 반환
		Scanner sc = new Scanner(System.in);
		System.out.print("문자열 입력 : ");
		String msg = sc.nextLine();
		
		return msg;
	}
	
	public double avg() {
		//정수형 변수 3개의 값의 평균을 반환. 단, 실수형 자료형 변수는 사용하지말것.
		int num1 = 20;
		int num2 = 30;
		int num3 = 14;
		
		return (double)(num1+num2+num3) / 3;
	}
	
	public String returnTest() {
		//사용자에게 입력받은 정수가, 10보다 크면 "10보다 큽니다." 10과 같거나 10보다 작으면 "10 또는 10보다 작습니다." 반환
		
		Scanner sc = new Scanner(System.in);
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();
		
		String str = "";
		
		/*//컴퓨터는 각 if문의 결과가 모두 false가 나올 수 있다고 판단하여, 오류가 발생한다.
		if(num > 10) {
			return "10보다 큽니다."; //return을 만나면 반환하고, 그 즉시 메소드를 종료하기 때문에 아래 단독 if 비교연산을 수행하지 않는다.
		}
		
		if(num <= 10) {
			return "10과 같거나 10보다 작습니다.";
		}
		*/
		
		//해결방법 1
		/*
		if(num > 10) {
			return "10보다 큽니다.";
		}else{
			return "10과 같거나 10보다 작습니다.";
		}
		*/
		
		//해결방법 2
		if(num > 10) {
			return "10보다 큽니다."; 
		}
		
		if(num <= 10) {
			return "10과 같거나 10보다 작습니다.";
		}
		
		//조건식에 관계없이 무조건 return 시키므로, 메소드 규약에 일치시킨다.
		return "입력하신 값은 " + num + "입니다."; 
	}
	
	//void : 반환할 값이 없음을 의미.
	//return이 생략이 가능. -> 써도 된다. or 안써도 된다
	public void voidTest() {
		 System.out.println("voidTest() 메소드 입니다.");
		 //return; //생략 가능이므로 작성하지 않아도 됨
		 
		
	}
	
	public void voidReturnTest() {
		//외부 반복문까지 종료하기 위해, 내부 if문의 결과를 변수에 할당하여, 또 한번의 체크 후, 외부 반복문 종료
		
		/*
		for(int i = 0; i<10; i++) {
			boolean chk  = true;
			for(int k=0; k<10; k++) {
				if(k==5) { //k가 5일 때, false로 변경하고, 현재 반복문 종료
					chk = false;
					break;
				}
			}
			
			if(!chk) { //외부 반복문을 종료하기 위해, chk값 검사 후, break하여 외부 반복문도 종료
				break;
			}
		}*/

		for (int i = 0; i < 10; i++) {
			for (int k = 0; k < 10; k++) {
				if (k == 5) {
					return; //k==5일 때, 메소드 자체를 종료 시켜버림.
				}
			}
		}//외부 for문
	}//method

}
