package kr.or.iei_control;

import java.util.Scanner;

public class ControlSwitch {
	/*
	  switch문 -> 정수, 문자, 문자열에 있는 값과 일치한 case문을 실행하고, break; 를 이용해서 switch문을 빠져나가는
	  구문
	  
	  [표현식]
	  
	  switch(변수 or 계산식){ 
	  		case 리터럴값1 :  // ex)소괄호 안의 값이 1일 때, 
	  			실행코드;		// 작동
	  			break;
	  		case 리터럴값2 : 
	  			실행코드;
	  			break;
	  		case 리터럴값3 : 
	  			실행코드;
	  			break;
	  		case 리터럴값4 : 
	  			실행코드;
	  			break;
	  		case 리터럴값5 : 
	  			실행코드;
	  			break;
	  		default :		//위 모든 case에 해당하지 않을 때
	  			실행코드;
	  			break;
	 */
	public void test1(){
		int num = 4;
		
		/*
		//v1 : if ~ else if ~ else
		if(num == 1) {
			System.out.println(num +"입니다.");
		}
		else if (num == 2) {
			System.out.println(num +"입니다.");
		}
		else if (num == 3) {
			System.out.println(num +"입니다.");
		}
		else if (num == 4) {
			System.out.println(num +"입니다.");
		}
		else if (num == 5) {
			System.out.println(num +"입니다.");
		}
		else {
			System.out.println("잘못 입력");
		}
		*/
		
		//num = 5;
		//num = 3;
		//num = 1;
		//num = 2;
		//num = 0;
		//num = 10; // 다른 값 출력을 위해 설정해 놓음
		//v2: switch문
		switch (num) {
		case 1: 
			System.out.println(num +"입니다.");
			break; //break를 만나면 switch문을 빠져나간다
				   //break;문 이후에 코드가 작성될 수 없다.
				   //System.out.println(); -> 오류 발생
				   //break문을 안쓰면 break;문이 있는 case문까지 내부 코드가 실행된다
		case 2: 
			System.out.println(num +"입니다.");
			break;
		case 3: 
			System.out.println(num +"입니다.");
			break;
		case 4: 
			System.out.println(num +"입니다.");
			break;
		case 5: 
			System.out.println(num +"입니다.");
			break;
		default:
			System.out.println(num +"은 1,2,3,4,5가 아닙니다.");
			break;
		}
	}
	public void test2() {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("구매하고자 하는 과일(사과, 바나나, 복숭아) 입력 : ");
		String str = sc.nextLine();
		
		int price = 0; //각 과일의 가격 (사과 : 1000원, 바나나 : 2000원, 복숭아 : 3000원)
		
		//입력한 과일에 따라, 과일의 금액을 출력하시오.
		
		switch (str) {
		case "사과": {
			price = 1000;
			break;
		}
		case "바나나": {
			price = 2000;
			break;
		}
		case "복숭아": {
			price = 3000;
			break;
		}
		default:
			System.out.println("잘못 입력");
			break;
		}
		System.out.println(str + "은(는)" + price + "입니다.");
	}
	
	public void test3() {
		//사용자에게 월(1~12)을 입력받고, 각 월의 총 일수를 출력하는 프로그램을 작성하시오
		Scanner sc = new Scanner(System.in);
		
		System.out.print("월 입력(1~12) : ");
		int month = sc.nextInt();
		
		/*
		 1월: 31일
		 2월: 28일
		 3월: 31일
		 4월: 30일
		 5월: 31일
		 6월: 30일
		 7월: 31일
		 8월: 31일
		 9월: 30일
		 10월: 31일
		 11월: 30일
		 12월: 31일
		 */
		//ver1
		switch(month) {
			case 1 : 
				System.out.println("1월의 마지막일자는 31일입니다.");
				break;
			case 2 : 
				System.out.println("2월의 마지막일자는 28일입니다.");
				break;
			case 3 : 
				System.out.println("3월의 마지막일자는 31일입니다.");
				break;
			case 4 : 
				System.out.println("4월의 마지막일자는 30일입니다.");
				break;
			case 5 : 
				System.out.println("5월의 마지막일자는 31일입니다.");
				break;
			case 6 : 
				System.out.println("6월의 마지막일자는 30일입니다.");
				break;
			case 7 : 
				System.out.println("7월의 마지막일자는 31일입니다.");
				break;
			case 8 : 
				System.out.println("8월의 마지막일자는 31일입니다.");
				break;
			case 9 : 
				System.out.println("9월의 마지막일자는 30일입니다.");
				break;
			case 10 : 
				System.out.println("10월의 마지막일자는 31일입니다.");
				break;
			case 11 : 
				System.out.println("11월의 마지막일자는 30일입니다.");
				break;
			case 12 : 
				System.out.println("12월의 마지막일자는 31일입니다.");
				break;
			default:
				System.out.println("잘못 입력");
				break;
		}
		
		//v2
		switch (month) {
		case 1:
		case 3: //month에 3이 들어있다고 가정하면, 아래 12의 break;를 만나기전까지 모든 case에 대해서 내부 코드 실행
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			System.out.println(month+"월의 마지막일자는 31일입니다.");
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			System.out.println(month+"월의 마지막일자는 30일입니다.");
			break;
		case 2:
			System.out.println(month+"월의 마지막일자는 28일입니다.");
			break;
		default:
			System.out.println("1~12사이의 숫자를 입력하세요");
			break;
		}
	}
}
