package kr.or.iei_control;

import java.util.Scanner;

public class ControlBreak {
	
	/*
	  break : 현재 반복문을 빠져나가고 싶을 때
	 */
	public void breakTest1() {
		//1~10까지 출력하는 반복문을 작성
		//단, 현재 숫자가 6이면 반복문 종료.
		
		for(int i=1; i<=10; i++) {
			System.out.println("i : " + i);
			if(i == 6) {
				System.out.println("종료");
				break;
			}
		}
		
	}
	
	public void breakTest2() {
		
		int num = 10;
		
		while(true) {
			
			switch(num){
			case 8 : System.out.println("8 입니다.");
			break;
			case 9 : System.out.println("9 입니다.");
			break;
			case 10 : System.out.println("10 입니다.");
			break; //switch문을 빠져나가는 break
			}
			
			if(num == 10) {
				break; //반복문을 빠져나가는 break
			}
		}
	}
	
	//문자열 길이 : length()
	public void breakTest3() {
		//사용자에게 문자열을 입력받고, 입력받은 문자열이 exit면 반복문을 종료하고,
		//그렇지 않으면 사용자 입력 문자열과 문자열의 길이를 출력하라.
		Scanner sc = new Scanner(System.in);
		
		
		while(true) {
			System.out.print("문자열 입력 : ");
			String str = sc.nextLine();
			
			if(str.equals("exit")) {
				//exit일 때
				break;
			} else {
				System.out.println(str);
				System.out.println("문자열의 길이 : " + str.length());
			}
			
			//문자열의 길이만큼, 각 문자 순서대로 추출
			for(int i = 0; i<str.length(); i++) {
				System.out.println(str.charAt(i));
			}
		}
	}
}
