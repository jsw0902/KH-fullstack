package kr.or.iei_control;

import java.util.Scanner;

/*
 while()
 [표현식]
 
 초기식;
 
 while(조건식){
 	실행코드;
 	증강식;	//실행코드와 순서가 뒤바껴도 상관 없음
  */

public class ControlWhile {
	public void whileTest1() {
		/*
		 for(초기식, 조건식, 증감식){
		 	내부 실행코드
		 }
		 
		 for(int i = 0; i<5; i++){
		 	System.out.println("for Loop");
		 }
		 
		 */
		
		/*
		int i = 0; //초기식 작성
		while(i<5){ //조건식
			System.out.println("while Loop"); //실행코드
			i++; //증감식
		}
		
		i = 5;
		while(i>0) {
			System.out.println("while Reverse Loop");
			i--;
		}
		*/
		// while문 주의사항
		// while문은 증감식을 {} 내부에 작성하다보니, 누락되는 경우가 발생할 수 있음.
		int a = 10;
		while(a>0){
			a--; //증감식 누락
			System.out.println("실행코드");
		}
	}
	public void whileTest2() {
		//사용자 입력받고, 1부터 입력받은 숫자까지 짝수의 갯수 출력
		Scanner sc = new Scanner(System.in);
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();
		
		int i = 1;
		int cnt = 0;
		
		while(i<=num){
			if(i%2 == 0) {
				System.out.println("짝수 : " + i);
				cnt++;
				
			}
			i++;
		}
		System.out.println("짝수 갯수 : " + cnt);
	}
	
	//사용자가 입력한 단의 구구단 출력
	public void whileTest3() {
		Scanner sc = new Scanner(System.in);
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();
		
		int i = 1;
		while(i<=9) {
			i = i+1; //처음 조건식 true 이후, i를 1 증가시킨 값으로 연산을 진행하기 때문에
					 //첫 연산자 -> 2 * 5 가 된다.
			System.out.println(i * num);
		}
	}
	
	public void infinityLoop() {
		
		//무한반복
		/*
		while(true) {
			
		}
		*/
		
		Scanner sc = new Scanner(System.in);
		
		//채팅 프로그램
		//문자열을 사용자에게 입력받고, exit 문자열이 입력되면 종료되는 프로그램~
		
		
		boolean bool = true;
		
		while(true) {			
			System.out.print("입력 : ");
			String str = sc.nextLine();
			
			//v1
			if(str.equals("exit")) {
				break; //반복문을 빠져나가는 명령
			}
			
			//v2
			if(str.equals("exit")) {
				bool = false;
			}
		}
	}
	
	public void infinityFor() {
		//for문의 무한루프
		for(;;) {
			System.out.println("호우");
		}
	}
	
	/*
	 do~while
	 [표현식]
	 
	 do{
	 	실행코드;
	 	증감식; //증감식과 실행코드의 순서는 상관 X
	 } while(조건식);
	 
	 - 특징)
	   1. 조건식의 결과에 상관없이, 무조건 1번은 실행됨
	 - 용도)
	   1. 조건식의결과에 상관없이, 무조건 1번은 실행시키고 싶을 때 
	 */
	public void dowhileTest1() {
		int i = 0; //초기식
		do {
			System.out.println("do While Test"); //실행코드
			i++; //증감식
		}while(i<5); //조건식
	}
	
	public void dowhileTest2() {
		boolean bool = false;
		
		do {
			
			//이 구문은 무조건 1번은 실행된다.
			System.out.println("dowhileTest 2");
		} while(bool);
		
	}
}
