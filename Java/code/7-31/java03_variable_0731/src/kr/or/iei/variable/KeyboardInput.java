package kr.or.iei.variable;

import java.util.Scanner;

public class KeyboardInput {
	/*
	 out: 나간다 -> 출력한다.
	 in: 들어온다 -> 입력한다.
	 */
	public void test1() {
		Scanner sc = new Scanner(System.in);
		/*
		//정수를 입력받는 메소드 호출
		System.out.printf("정수 입력: ");
		int num = sc.nextInt(); // 입력받아서 입력된 값을 num에 할당함
		System.out.print("num: " + num);
		
		//문자열을 입력받는 메소드 호출
		System.out.printf("\n이름 입력: ");
		String name = sc.next();
		System.out.println("이름: " + name);
		
		*/
		
		//next()는 띄워쓰기 입력전까지의 문자열을 읽어옴
		/*
		System.out.printf("주소 입력: ");
		String addr = sc.next(); //"경기도 남양주시" -> "경기도"만 읽어들인다.
		System.out.println("주소:" + addr);
		*/
		
		//next()는 뜨워쓰기까지 포함해서 문자열을 읽어온다.
		System.out.print("주소 입력: ");
		String addr = sc.nextLine();
		System.out.println("주소:" + addr);
		
	}
	
	//실습 문제
	public void test2() {
		/*
		 사용자에게 주소(문자열),이름(문자열), 나이(정수), 키(실수)를 순서대로 입력받고, 
		 그 결과를 System.out.println() 메소드를 이용하여, 출력하라
		 단, 출력 형식은 아래와 같다.
		 
		 OOO님은 O살이며, 주소는 OOO이고, 키는 OOOcm입니다.
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.printf("이름 입력: ");
		String name = sc.nextLine();
		
		System.out.printf("주소 입력: ");
		String addr = sc.nextLine();
		
		System.out.printf("나이 입력: ");
		int age = sc.nextInt();
		
		System.out.printf("키 입력: ");
		double cm = sc.nextDouble();
		
		//System.out.println(name + "님은, " + age + "살이며, 주소는 " + addr +"이고, 키는 " + cm + "cm입니다.");
		System.out.printf("%s님은 %d살이며, 주소는 %s이고, 키는 %.1fcm입니다.", name, age, addr, cm);
		
	}
	
	//Scanner 사용 시 주의사항.
	public void test3() {
		Scanner sc = new Scanner(System.in);
		
		System.out.printf("이름 입력: ");
		String name = sc.next();
		System.out.printf("나이 입력: ");
		int age = sc.nextInt();
		sc.nextLine(); //앞에서 입력한 메소드가 버퍼에 남긴, 엔터를 읽어들여 처리하기 위함.
		System.out.printf("주소 입력: ");
		String addr = sc.nextLine(); //앞의 next(), nextInt(), nextDouble()에서 입력한 엔터를 읽어들이고, 종료
		
	}
	public void test4() {
		Scanner sc = new Scanner(System.in);
		
		/*
		System.out.print("입력 : ");
		String str = sc.next();
		
		System.out.println("str : " + str);
		System.out.println("str의 첫번째 글자 : " + str.charAt(0));
		System.out.println("str의 세번째 글자 : " + str.charAt(2)); //Java -> v
		System.out.println("str의 다섯번째 글자 : " + str.charAt(4)); //글자의 길이 -1
		 */
		
		System.out.print("입력 : ");
		//next()의 결과는 String이지만, sharAt() 결과는 문자. 결국 최종적으로 반환되는 자료의 형태는 char(문자)다.
		char ch = sc.next().charAt(0);
	}

}
