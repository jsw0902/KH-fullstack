package kr.or.iei.exam;

import java.util.Scanner;

public class Exam {
	public void ex01() {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("몇번 출력하시겠습니까? ");
		
		int n = sc.nextInt();
		
		for(int i = 0; i<n; i++) {
			System.out.println("안녕하세요");
		}
	}
	
	public void ex02() { // 못함
		Scanner sc = new Scanner(System.in);
		int sum = 0;
		for(int i=0; i<5; i++) {
			System.out.print("정수 값을 입력하시오 : ");
			
			int n = sc.nextInt();
			
			sum+=n;
			
		}
		System.out.println("입력한 5개의 성수의 합 : " + sum);
		
	}
	
	public void ex03() {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("몇단 출력하시겠습니까? ");
		
		int n = sc.nextInt();
		System.out.println(n + "단 입니다.");
		for(int i = 1; i<=9; i++) {
			System.out.println(n + " * " + i + " = " + n*i);
		}
	}
	
	public void ex04() { //못함
		Scanner sc = new Scanner(System.in);
		
		System.out.print("첫번째 수 입력 : ");		
		int n1 = sc.nextInt();
		System.out.print("두번째 수 입력 : ");
		int n2 = sc.nextInt();
		
		//for(int i = n1; i<=n2; i++) {
			
		}

	
	public void ex05() {
		System.out.println("중첩 for문을 이용한 구구단 전체 출력1");
		for(int i = 2; i<=9; i++) {
			for(int j = 1; j<=9; j++) {
				System.out.print(i + "*" + j +"=" + i*j + " ");
			}
			System.out.println();
		}
	}
	
	public void ex06() {
		System.out.println("중첩 for문을 이용한 구구단 전체 출력1");
		for(int i = 2; i<=9; i++) {
			for(int j = 1; j<=9; j++) {
				System.out.print(i + "*" + j +"=" + j*i + " ");
			}
			System.out.println();
		}
	}
	
	public void ex07() {
		
		//Q1
		/*
		for(int i = 0; i<5; i++) {
			System.out.print("*");
		}
		*/
		//Q2
		/*
		for(int i = 0; i<5; i++) {
			System.out.print("*");
			System.out.println();
		}
		*/
		//Q3
		/*
		for(int i = 0; i<5; i++) {
			for(int k = 0; k<5; k++) {
				System.out.print("*");
			}
			System.out.println();
		}*/
		
		//Q4
		/*
		for(int i = 1; i<=5; i++) {
			for(int k = 0; k<5; k++) {
				System.out.print(i);
			}
			System.out.println();
		}
		*/
		//Q5
		/*
		for(int i = 0; i<5; i++) {
			for(int k = 1; k<=5; k++) {
				System.out.print(k);
			}
			System.out.println();
		}
		*/
		//Q6
		/*
		for(int i = 0; i<5; i++) {
			for(int k = 1; k<=5; k++) {
				System.out.print(k + i);
			}
			System.out.println();
		}
		*/
		
		//Q7
		//못함
		
		//Q8
		for(int i = 0; i<5; i++) {
			for(int k = 1; k<=5; k++) {
				if(k==i) {
					System.out.print("*");
				}
			}
		}
	}
}

