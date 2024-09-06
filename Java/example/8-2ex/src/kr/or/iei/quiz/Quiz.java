package kr.or.iei.quiz;

import java.util.Scanner;

public class Quiz {
	public void test1(){
		Scanner sc = new Scanner(System.in);
		
		System.out.print("임의의 정수를 입력하세요 : ");
		int num = sc.nextInt();
		
		if(num< 0) {
			System.out.println(num + "은(는) 음수입니다.");
		}
		if(num>0){
			System.out.println(num + "은(는) 양수입니다.");
		}
		if(num == 0) {
			System.out.println(num + "은(는) 0입니다.");
		}
		
	}
	public void test2() {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("첫번째 정수를 입력하세요 : ");
		int num1 = sc.nextInt();
		System.out.print("두번째 정수를 입력하세요 : ");
		int num2 = sc.nextInt();
		if(num1>num2) {
			System.out.printf("%d > %d", num1, num2);
			System.out.println("\n첫번째 수가 더 큽니다");
		}
		if(num1<num2) {
			System.out.printf("%d < %d", num1, num2);
			System.out.println("\n두번째 수가 더 큽니다");
		}
		if(num1 == num2) {
			System.out.printf("%d = %d", num1, num2);
			System.out.println("\n두 수가 같습니다.");
		}
	}
	public void test3() {
		Scanner sc = new Scanner(System.in);
		System.out.print("연산자를 입력하세요(+,-,*,/): ");
		char ch = sc.next().charAt(0);
		System.out.print("첫번째 정수를 입력하세요 : ");
		int num1 = sc.nextInt();
		System.out.print("두번째 정수를 입력하세요 : ");
		int num2 = sc.nextInt();
		
		if(ch == '+') {
			System.out.printf("%d %s %d = %d", num1, ch ,num2, num1 + num2);
		} 
		if(ch == '-') {
			System.out.printf("%d %s %d = %d", num1, ch ,num2, num1 - num2);
		}
		if(ch == '*') {
			System.out.printf("%d %s %d = %d", num1, ch ,num2, num1 * num2);
		}
		if(ch == '/') {
			System.out.printf("%d %s %d = %.6f", num1, ch ,num2, (float)num1 / num2);
		}
	}
	public void test4() {
		Scanner sc = new Scanner(System.in);
		System.out.print("입장하실 총 인원은 몇명입니까?: ");
		int people = sc.nextInt();
		System.out.print("어른은 몇명입니까?(1인당 15000원): ");
		int num1 = sc.nextInt();
		System.out.print("아이는 몇명입니까?(1인당 5000원): ");
		int num2 = sc.nextInt();
		
		int sum1 = 15000;
		int sum2 = 5000;
		
		if(people == (num1 + num2)) {
			System.out.printf("지불하실 총 금액은 %d원 입니다.", ((num1 * sum1) + (num2 * sum2)));
		}
		else {
			System.out.println("인원수가 맞지 않습니다.");
		}
		/*
		int sum0 = num1 + num2;
		int sum1 = people; 
		int sum2 = num1 * 15000;
		int sum3 = num2 * 5000;
		int sum4 = sum2 + sum3;
		*/
		/*
		if(people==sum0) {
			System.out.printf("지불하실 총 금액은 %d원 입니다.", sum4);
		}
		else {
			System.out.println("인원수가 맞지 않습니다.");
		}*/
	}
	public void test5() {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("첫번째 퀴즈");
		System.out.print("사과는 영어로 무엇일까요(1.apple 2.스티브잡스)?: ");
		int num1 = sc.nextInt();
		
		int cnt = 0;
		
		
		if(num1 == 1) {
			cnt = cnt + 1;
			System.out.println("정답!!!!");
		}
		else {
			System.out.println("땡!!");
		}
		
		System.out.println("두번째 퀴즈");
		System.out.print("바나나는 길어 길으면 기차 기차는 (1.비싸 2.빨라)?: ");
		int num2 = sc.nextInt();
		
		if(num2 == 2) {
			cnt = cnt + 1;
			System.out.println("정답!!!!");
		}
		else {
			System.out.println("땡!!");
		}
		System.out.printf("총 %d문제 맞추셨습니다.", cnt);
		/*
		if(num1 <= num2) {
			if(num1 == num2) {
				System.out.println("총 1문제 맞추셨습니다.");
			}
			else {
				System.out.println("총 2문제 맞추셨습니다.");
			}
		}
		else {
			System.out.println("총 0문제 맞추셨습니다.");
		}
		*/
	}
	
	public void test6() { 
		System.out.println("===========심리테스트==========");
		Scanner sc = new Scanner(System.in);
		
		System.out.print("당신은 술을 좋아합니까(1.yes 2.no)?: ");
		int num1 = sc.nextInt();
		
		if(num1 == 1) {
			System.out.print("당신은 담배를 피웁니까(1.yes 2.no)?: ");
			int num2 = sc.nextInt();
			if(num2 == 1) {
				System.out.print("담배는 건강에 좋지 않습니다.");
			}
			else{
				System.out.print("술은 건강에 좋지 않습니다.");
			}
			
		}
		else {
			//1번 질문에 2번이라고 답했을 경우
			System.out.print("당신은 이성친구가 있습니까? (1.yes, 2.no) : ");
			int num2 = sc.nextInt();
			if(num2 == 1) {
				System.out.print("올..ㅋ");
			}
			else{
				System.out.print("힘내요 ㅠㅠ");
			}
		}
		/*
		if(num1 == 2) {
			System.out.print("당신은 이성친구가 있습니까(1.yes 2.no)?: ");
			int num2 = sc.nextInt();
			if(num2 == 1) {
				System.out.print("올..ㅋ");
			}
			if(num2 == 2) {
				System.out.print("힘내요 ㅠㅠ");
			}
		}*/
		/*
		if(num1 == 1) {
			if(num2 == 1) {
				System.out.println("담배는 건강에 좋지 않습니다.");
			}
			else if(num2 == 2) {
				System.out.println("술은 간에 좋지 않습니다.");
			}
			else {
				System.out.println("1 과 2만 입력해주세요");
			}
		}
		else if(num1 == 2){
			if(num2 == 1) {
				System.out.println("올.. ㅋ");
			}
			else if(num2 == 2) {
				System.out.println("힘내요 ㅠㅠ");
			}
			else {
				System.out.println("1 과 2만 입력해주세요");
			}
		}
		else {
			System.out.println("1 과 2만 입력해주세요");
		}
		*/
	}
	public void test7() {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("문자 입력: ");
		char ch = sc.next().charAt(0);
		
		if(ch >= 65 && ch <= 90) {
			//대문자 입력 시
			System.out.print("대문자를 입력하였습니다.");
			char val = (char)(ch + 32); // ch + 32의 반환 자료형은 int int -> char 
			System.out.printf("소문자로 변환 : " + val);
			
		}
		else if(ch >= 97 && ch<= 122){ //그렇지 않고~(즉, 대문자 입력이 아니고~)
			//소문자 입력 시
			System.out.print("소문자를 입력하였습니다.");
			char val = (char)(ch - 32); // ch - 32 
			System.out.printf("대문자로 변환 : " + val);
		}
		else {
			System.out.println("잘못 입력하셨습니다. 영문자를 입력해주세여.");
		}
		
		/*//무식한 방식
		if (ch == 'a') {
			System.out.println("대문자: A ");
		} else if (ch == 'b') {
			System.out.println("대문자: B ");
		} else if (ch == 'c') {
			System.out.println("대문자: C ");
		} else if (ch == 'd') {
			System.out.println("대문자: D ");
		} else if (ch == 'e') {
			System.out.println("대문자: E ");
		} else if (ch == 'f') {
			System.out.println("대문자: F ");
		} else if (ch == 'g') {
			System.out.println("대문자: G ");
		} else if (ch == 'h') {
			System.out.println("대문자: H ");
		} else if (ch == 'i') {
			System.out.println("대문자: I ");
		} else if (ch == 'j') {
			System.out.println("대문자: J ");
		} else if (ch == 'k') {
			System.out.println("대문자: K ");
		} else if (ch == 'l') {
			System.out.println("대문자: L ");
		} else if (ch == 'm') {
			System.out.println("대문자: M ");
		} else if (ch == 'n') {
			System.out.println("대문자: N ");
		} else if (ch == 'o') {
			System.out.println("대문자: O ");
		} else if (ch == 'p') {
			System.out.println("대문자: P ");
		} else if (ch == 'q') {
			System.out.println("대문자: Q ");
		} else if (ch == 'r') {
			System.out.println("대문자: R ");
		} else if (ch == 's') {
			System.out.println("대문자: S ");
		} else if (ch == 't') {
			System.out.println("대문자: T ");
		} else if (ch == 'u') {
			System.out.println("대문자: U ");
		} else if (ch == 'v') {
			System.out.println("대문자: V ");
		} else if (ch == 'w') {
			System.out.println("대문자: W ");
		} else if (ch == 'x') {
			System.out.println("대문자: X ");
		} else if (ch == 'y') {
			System.out.println("대문자: Y ");
		} else if (ch == 'z') {
			System.out.println("대문자: Z ");
		} else {
			System.out.println("잘못입력하셨습니다. 영문자를 입력해주세요.");
		}
		*/
	}
	public void test8() {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수 입력: ");
		int n = sc.nextInt();
		
		/*//버전 1
		if (n % 3 == 0 && n != 0) {
			if(n%4 == 0) {
				System.out.printf("[%d]은(는) 3의 배수면서 4의 배수입니다.", n);
			}
			else {
				System.out.printf("[%d]은(는) 3의 배수입니다.", n);
			}
		}
		else if (n % 4 == 0 && n != 0) {
            System.out.printf("[%d]은(는) 4의 배수입니다.", n);
        }
		else {
			System.out.printf("[%d]은(는) 3의 배수도 4의 배수도 아닙니다.", n);
		}
		*/
		
		//버전 2
		if(n == 0) {
			System.out.printf("[%d]은(는) 3의 배수도 4의 배수도 아닙니다.", n);
		}
		if (n % 3 == 0) {
			if(n%4 == 0) {
				System.out.printf("[%d]은(는) 3의 배수면서 4의 배수입니다.", n);
			}
			else {
				System.out.printf("[%d]은(는) 3의 배수입니다.", n);
			}
		}
		else if (n % 4 == 0) {
            System.out.printf("[%d]은(는) 4의 배수입니다.", n);
        }
		else {
			System.out.printf("[%d]은(는) 3의 배수도 4의 배수도 아닙니다.", n);
		}
		
		/*//버전 3
		if (n == 0) {
			System.out.printf("[%d]은(는) 어떤 배수도 아닙니다.", n);
        } else if (n % 3 == 0 && n % 4 == 0) {
            System.out.printf("[%d]은(는) 3의 배수면서 4의 배수입니다.", n);
        } else if (n % 3 == 0) {
            System.out.printf("[%d]은(는) 3의 배수입니다.", n);
        } else if (n % 4 == 0) {
            System.out.printf("[%d]은(는) 4의 배수입니다.", n);
        } else {
            System.out.printf("[%d]은(는) 3의 배수도 4의 배수도 아닙니다.", n);
        }
        */
	}
	
}
