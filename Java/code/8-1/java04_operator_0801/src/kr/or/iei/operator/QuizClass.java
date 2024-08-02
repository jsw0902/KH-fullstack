package kr.or.iei.operator;

import java.util.Scanner;

public class QuizClass {
	
	
	public void test1() {
		/*
		 사용자에게 임의의 정수를 입력받고, 입력 숫자가 1~100 사이의 숫자인지 판별하는 프로그램 작성
		 ex) 입력 : 20
		 	 입력숫자 : 20 : true
		 ex) 입력 : 101
		 	 입력숫자 : 101 : false
		 (실패)
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("입력 : ");
		int num1 = sc.nextInt();
		boolean bool = num1 > 0;
		boolean bool2 = num1 < 101;
		
		//bool1과 bool2가 모두 true이어야, "true" 하나라도 false면 false를 str에 할당
		String str = bool && bool2 ? "true" : "false";
		
		System.out.println("입력값" + num1 + " : " + str);
	}
	
	public void test2() {
		/*
		 임의의 문자를 입력받고, 입력받은 문자가 소문자인지, 대문자인지 판별하는 프로그램 작성
		 (단, 비교 시 정수를 사용하지 말것.)
		 
		 ex) 입력 : 'a'
		 	 출력 : 소문자
		 	 
		 ex) 입력 : 'Z'
		 	 출력 : 대문자
		 	 
		 ex) 입력 : 'ㅎ'
		 	 출력 : 알파벳이 아닙니다.
		 (실패)
		 
		 str >= A , str <= Z, str >=a, str<=z   
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("입력 : ");
		
	 }
	
	
	public void test3() {
		/*
		 사용자에게 임의의 정수를 입력받아, 양수인지 음수인지를 판별하는 프로그램 작성
		 ex) 입력 : 6
		 	 출력 : 양수입니다.
		 	 
		 ex) 입력 : -3
		 	 출력 : 음수입니다.
		 	 
		 ex) 입력 : 0
		 	 출력 : 0 입니다.
		 (성공)
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("입력 : ");
		int num1 = sc.nextInt();
		
		String str = num1 > 0 ? "양수입니다." : num1 < 0 ? "음수입니다." : "0입니다.";
		System.out.println("출력 : " + str);
	}
	
	public void test4() {
		/*
		 사용자에게 임의의 정수를 입력받고, 입력받은 숫자의 절대값을 구하는 프로그램을 작성
		 ex) 입력 : 7
		 	 출력 : 7
		 ex) 입력 : -5
		 	 출력 : 5
		 (실패)
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("입력 : ");
		int num1 = sc.nextInt();
	}
	
	public void test5() {
		/*
		 국어, 수학, 영어 점수를 입력 받고
		 각 과목이 40점 이상이고 세 과목 평균이 60점 이상이면 합격 하나라도 아니면 불합격
		 (성공)
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("국어 점수 입력 : ");
		int kor = sc.nextInt();
		System.out.print("수학 점수 입력 : ");
		int mat = sc.nextInt();
		System.out.print("영어 점수 입력 : ");
		int eng = sc.nextInt();
		
		int plus = kor + mat + eng; 
		int svg = plus / 3;
		
		boolean bool0 = kor >= 40;
		boolean bool1 = mat >= 40;
		boolean bool2 = eng >= 40;
		boolean bool3 = svg >= 60;
		
		String str = bool0 && bool1 && bool2 && bool3 ? "합격" : "불합격";
		
		System.out.println(str);
	}
	
	public void test6() {
		/*
		 정수를 입력받고 홀수면 "홀수입니다" 출력 짝이면 "짝수입니다." 출력.
		 (성공)
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수를 입력하세요 : ");
		int num = sc.nextInt();
		
		int hole = num % 2;
		String str = hole == 1 ? "홀수입니다." : "짝수입니다.";
		System.out.println(str);
	}
	
	public void test7() {
		/* 
		 조건식을 활용해서 3의 배수가 나오면 "3의 배수입니다." 출력
		 4의 배수가 나오면 "4의 배수입니다" 출력
		 3의 배수, 4의 배수 둘 다 아니면 "둘 다 아닙니다." 출력
		 (성공) 
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수를 입력하세요 : ");
		int num = sc.nextInt();
		
		
		String str = num % 3 == 0 ? "3의 배수입니다." : num % 4 == 0 ? "4의 배수입니다." : "둘 다 아닙니다.";
		
		System.out.print(str);
	}
}
