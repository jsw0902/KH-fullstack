package kr.or.iei;

import java.io.PrintStream;
import java.util.Scanner;

public class Example {
	public void exam1() {
		/*
		 문제 1
		 자신의 이름(String), 나이(int), 주소(String),
		 키(double), 몸무게(double), 성별(char)을 입력 받고
		 출력하는 프로그램을 작성 해라
		 - 키는 정수로 변환하여 출력
		 - 몸무게는 첫째 자리까지 출력
		 */
		Scanner sc = new Scanner(System.in);
		
		System.out.print("이름: ");
		String name = sc.next();
		System.out.print("나이: ");
		int age = sc.nextInt();
		System.out.print("키: ");
		int cm = (int)sc.nextDouble();
		System.out.print("몸무게: ");
		Double kg = sc.nextDouble();
		System.out.print("성별: ");
		char sex = sc.next().charAt(0);
		sc.nextLine();
		System.out.print("주소: ");
		String addr = sc.nextLine();
		
		
		System.out.printf("%s님은 %d살이고 거주지는 %s이며 키는 %dcm 몸무게 %.1f이고 성별은 %c입니다.",
				name, age, addr, cm, kg, sex);
		
	}
	
	public void exam2() {
		/*
		 국어, 수학, 영어 점수를 입력받고
		 총 합과, 평균을 출력해라
		 ex) 당신 성적의 총 합은 OOO 점이고 평균은 OO.OO 입니다!
		 */
		Scanner sc = new Scanner(System.in);
		System.out.print("국어 점수 입력: ");
		int kor = sc.nextInt();
		System.out.print("수학 점수 입력: ");
		int mat = sc.nextInt();
		System.out.print("영어 점수 입력: ");
		int eng = sc.nextInt();
		
		int m = kor + mat + eng;
		float s = (float)m / 3; 
		
		System.out.printf("당신 성적의 총 합은 %d점이고 평균은 %.2f 입니다!", m, s);
	}

	public void exam3() {
		/*
		 정수를 두개 입력 받고 
		 더하기, 빼기, 곱하기, 나누기 몫, 나머지 몫을 하나하나 출력하여라
		 
		 */
		Scanner sc = new Scanner(System.in);
		System.out.print("첫 번째 정수 입력: ");
		int num1 = sc.nextInt();
		System.out.print("두 번째 정수 입력: ");
		int num2 = sc.nextInt();
		
		int n1 = num1 + num2;
		int n2 = num1 - num2;
		int n3 = num1 * num2;
		int n4 = num1 / num2; 
		int n5 = num1 % num2;
		
		System.out.println("========== 결과 ==========");
		System.out.println("더하기 결과: " + n1);
		System.out.println("빼기 결과: " + n2);
		System.out.println("곱하기 결과: " + n3);
		System.out.println("나누기 몫: " + n4);
		System.out.println("나누기 나머지 " + n5);
		
	}
	public void exam4() {
		/*
		 가로 세로를 각각 입력 받고 
		 면적과 둘레를 하나하나 출력해라
		 */
		Scanner sc = new Scanner(System.in);
		System.out.print("가로 길이 입력: ");
		float width = sc.nextFloat();
		System.out.print("세로 길이 입력: ");
		float height = sc.nextFloat();
		
		float m = width * height;
		float s = 2*(width + height);
		
		System.out.println("========== 결과 ==========");
		System.out.println("면적: " + m);
		System.out.println("둘레: " + s);
		//System.out.printf("면적: %.2f", width * height); 이렇게 해도 상관 없음.
		//System.out.printf("둘레: %.2f", 2*(width + height));
	}
	public void exam5() {
		/*
		 영어 단어를 입력 받고
		 첫번째, 두번째, 세번째 자리의 문자를 각각 출력해라
		 */
		Scanner sc = new Scanner(System.in);
		System.out.print("영어 단어 입력: ");
		String eng = sc.next();
		
		System.out.println("첫번째 문자: " + eng.charAt(0));
		System.out.println("두번째 문자: " + eng.charAt(1));
		System.out.println("세번째 문자: " + eng.charAt(2));
	}
}
