package kr.or.iei_control;

import java.util.Scanner;

/*
 제어문
 1) 조건문
 2)
 */
public class ControlIf {
	
	
	/*
	 [표현법]
	 if(조건식){
	  위 조건식의 결과가, true면 수행할 코드를 작성
	 }
	 */
	public void ifTest1() {
		int num = 5;
		if(num == 5) { // num == 5일 때 실행할 코드를 작성한다.
			//위의 조건식이 true를 변환하면, 실행할 코드를 작성.
			System.out.println("num은 5입니다.");
		}//if
		
		if (num > 3) {
			System.out.println("num은 3보다 큽니다.");
		}// if
		
		if (num == 0) {
			System.out.println("num은 0입니다.");
		}
		else { //false
			System.out.println("num은 5이상입니다.");
		}
	}//ifTest1
	
	public void ifTest2() {
		/*
		 사용자에게 임의의 정수를 입력받고,
		 입력받은 정수가 5인지, 5보다 큰지, 5보다 작은지를 비교하는 
		 if문 3개를 작성하고, 각 if문 안에는 적정한 문구를 출력하시오
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수 입력:");
		int num = sc.nextInt();
		
		//version 1
		if (num == 5) {
			System.out.println("입력 받은 정수는 5 입니다.");
		}
		if (num > 5) {
			System.out.println("입력 받은 정수는 5보다 큽니다.");
		}
		if (num < 5) {
			System.out.println("입력 받은 정수는 5보다 작습니다.");
		}
		
		
	}
	
	public void ifTest3() {
		/*
		 짝수 or 홀수 판별 프로그램
		 ----- 조건 -----
		 사용자에게 정수를 입력 받을 것
		 짝수를 판별하는 if문 1개
		 홀수를 판별하는 if문 1개
		 
		 
		 */
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수 입력:");
		int num = sc.nextInt();
		
		if (num % 2 == 0) {
			System.out.printf("%d은 짝수입니다.", num);
		}
		/*
		//0이 아니면 홀수 이렇게 작성해도 된다 
		if (num%2!=0) {
			System.out.printf("%d은 홀수입니다.", num);
		}
		*/
		if (num % 2 == 1) {
			System.out.printf("%d은 홀수입니다.", num);
		}
		
		//ver2
		/*
		if (num % 2 == 1) {
			System.out.printf("%d은 홀수입니다.", num);
		}
		else if (num == 0) {
			System.out.println("0입니다.");
		}
		else {
			System.out.printf("%d은 짝수입니다.", num);
		}
		*/
	}
	public void ifTest4() {
		/*
		 간단한 사칙연산 프로그램을 만드시오
		 사용자에게, 연산자 1개와 정수 2개를 입력을 받아 사칙연산을 수행하는 프로그램을 작성
		 연산자: +,-,*,/
		 */
		Scanner sc = new Scanner(System.in);
		
		System.out.print("첫번째 정수 입력 : ");
		int num1 = sc.nextInt();
		System.out.print("두번째 정수 입력 : ");
		int num2 = sc.nextInt();
		System.out.print("연산자 입력(+,-,*,/): ");
		char ch = sc.next().charAt(0);
		//int num3; //ver2
		
		int n1 = num1 + num2;
		int n2 = num1 - num2;
		int n3 = num1 * num2;
		int n4 = num1 / num2;
		
		if(ch=='+') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, n1);
		}
		if(ch=='-') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, n2);
		}
		if(ch=='*') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, n3);
		}
		if(ch=='/') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, n4);
		}
		
		/*//ver2
		if(ch=='+') {
			num3 = num1 + num2;
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num3);
		}
		if(ch=='-') {
			num3 = num1 - num2;
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num3);
		}
		if(ch=='*') {
			num3 = num1 * num2;
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num3);
		}
		if(ch=='/') {
			num3 = num1 / num2;
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num3);
		}
		*/
		/*//ver3
		if(ch=='+') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num1+num2);
		}
		if(ch=='-') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num1-num2);
		}
		if(ch=='*') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num1*num2);
		}
		if(ch=='/') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num1/num2);
		}
		 */
	}
	
	//ifTest4()의 효율성을 중대시킨 버전
	//결과를 구하는 연산을 연산자에 따라서 연산
	public void ifTest5() {
		Scanner sc = new Scanner(System.in);

		System.out.print("첫번째 정수 입력 : ");
		int num1 = sc.nextInt();
		System.out.print("두번째 정수 입력 : ");
		int num2 = sc.nextInt();
		System.out.print("연산자 입력(+,-,*,/): ");
		char ch = sc.next().charAt(0);
		
		//ver3
		if(ch=='+') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num1+num2);
		}
		if(ch=='-') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num1-num2);
		}
		if(ch=='*') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num1*num2);
		}
		if(ch=='/') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num1/num2);
		}
	}
	
	/*
	 if else문
	 [표현식]
	 
	 if(조건식){
	 	//조건식의 결과가 true일 때 수행되는 코드
	 }
	 else{
	 	//조건식의 결과가 false일때 수행되는 코드
	 }
	 */
	public void ifelseTest1() {
		int num = 5;
		
		if (num == 5) {
			System.out.println("num은 5입니다.");
		} else {
			//위 조건식의 결과가 false일때 수행되는 코드를 작성하는 영역
			//num이 5가 아닐 때
			System.out.println("num은 5가 아님.");
		}	
	}
	
	//if-else문을 활용한 홀수 or 짝수를 구하는 프로그램
	public void ifelseTest2() {
		int num = 30;
		
		/*
		 짝수 : num%2 == 0
		 홀수 : num%2 != 0 <- 비효율적임
		 */
		if(num%2==0) {
			System.out.println("num은 짝수입니다.");
		}else {
			System.out.println("num은 홀수입니다.");
		}
		
	}
	
	//중복(중첩) if문
	public void ifTest6() {
		/*
		 사용자에게 정수를 입력받고, 
		 양수인지 아닌지를 판별하시오
		 단, 양수인경우, 짝수인지, 홀수인지 판별하시오
		 */
		Scanner sc = new Scanner(System.in);

		System.out.print("정수 입력 : ");
		int num = sc.nextInt();
		
		if (num>0) {
			if(num%2==0) { //중첩 if문
				//짝수 양수 둘다 만족해야 실행 
				System.out.printf("%d은 양수이면서 짝수입니다.", num);
			}
			else {
				System.out.printf("%d은 양수이면서 홀수입니다.", num);
			}
		}else {
			System.out.printf("%d은 양수가 아닙니다.", num);
		}
	}
	
	/*
	[표현식]
	if(조건식1){
		//조건식1이 true일 때 수정되는 코드
	}else if(조건식2){
		//조건식2이 true일 때 수행되는 코드
	}else if(조건식3){
		//조건식3이 true일 때 수행되는 코드
	}else if(조건식4){
		//조건식4이 true일 때 수행되는 코드
	}
	.
	.
	.
	else{
		//위 조건식 1~N이 모두 false일 때 수행되는 코드
	}
	
	
	 */
	public void ifelseifTest1() {
		int num = 151;
		
		/*
		 정수를 저장한 변수 num이
		 
		 1 ~ 50 사이의 숫자인지,
		 51 ~ 100 사이의 숫자인지,
		 101 ~ 150 사이의 숫자인지,
		 151 ~ 200 사이의 숫자인지 판별고 적정한 문구 출력
		 단, 위 4가지 경우가 아니면 num에 저장된 정수를 출력
		 */
		/*
		if (num >= 1 && num <= 50) {
			System.out.println("num은 1~50 사이의 숫자입니다.");
		}
		else if (num >=51 && num <= 100) {
			System.out.println("num은 51~100 사이의 숫자입니다.");
		} 
		else if (num >=101 && num <= 150) {
			System.out.println("num은 101~150 사이의 숫자입니다.");
		} 
		else if (num >=151 && num <= 200) {
			System.out.println("num은 151~200 사이의 숫자입니다.");
		} 
		else {
			System.out.println(num);
		}
		*/
		/*
		if (num >= 1 && num <= 50) {
			//
			System.out.println("1부터 50사이의 숫자입니다.");
		}else {//1보다 작거나 50보다 크거나
			
			if (num >=51 && num <= 100) {
				System.out.println("num은 51~100 사이의 숫자입니다.");
			}
			
			else if (num >=101 && num <= 150) {
				System.out.println("num은 101~150 사이의 숫자입니다.");
			}
			
			else if (num >=151 && num <= 200) {
				System.out.println("num은 151~200 사이의 숫자입니다.");
			} 
			
			else {
				System.out.println(num);
			}
		*/
		//}
	}
	public void ifelseifTest2() {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("첫번째 정수 입력 : ");
		int num1 = sc.nextInt();
		System.out.print("두번째 정수 입력 : ");
		int num2 = sc.nextInt();
		System.out.print("연산자 입력(+,-,*,/): ");
		char ch = sc.next().charAt(0);
		
		if(ch=='+') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num1 + num2);
		}
		else if(ch=='-') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num1 - num2);
		}
		else if(ch=='*') {
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num1 * num2);
		}
		else if(ch=='/'){
			System.out.printf("출력 : %d %s %d = %d", num1, ch, num2, num1 / num2);
		}
		else {
			//위 모든 조건이 만족하지 못할 때 == 위 조건이 모두 false일 때 수정
			System.out.println("연산자 입력 오류");
		}
	}
}
		

