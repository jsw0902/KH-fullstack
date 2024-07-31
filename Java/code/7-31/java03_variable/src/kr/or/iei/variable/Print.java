package kr.or.iei.variable;

public class Print {
	
	//println(): 출력의 기능을 담당하고, 출력 이후 개행(줄바꿈) 처리까지 수행
	public void test1() {
		/*
		System.out.println(10);
		System.out.println(20);
		System.out.println("Hello World");
		System.out.println(true);
		System.out.println(2.125);
		*/
		
		System.out.println("Hello");
		System.out.println("My");
		System.out.println("Name");
		System.out.println("is");
		System.out.println("호우");
	}
	
	//print():출력의 기능을 담당하고, 개행(줄바꿈)처리는 하지 않음
	public void test2() {
		System.out.print("Hello ");
		System.out.print("My ");
		System.out.print("Name ");
		System.out.print("is ");
		System.out.print("JSW");
		
		System.out.println();
		System.out.println("Hello My Name is Jang Seung Won");
	}
	
	//printf(): 출력 시, 데이터 형식을 지정한다.
	//f : format: 형식
	public void test3() {
		int num = 10;
		System.out.println("num : " + 10);
		
		
		//문자열 포맷 지정: %s
		String name = "장승원";
		System.out.printf("내 이름은 %s", name);
		
		System.out.println(); //단순히, 개행처리만
		
		//정수의 포맷 지정: %d
		int num1 = 10;
		int num2 = 20;
		int sum = num1 + num2;
		System.out.printf("%d + %d = %d", num1, num2, sum); //"%d" 형식을 지정해주면 ,이후 형식에 맞는 데이터를 넣어줘야 에러가 안뜸
	
		System.out.println();
		
		//실수의 포맷 지정 : %f
		float fNum1 = 1.2512f;
		System.out.printf("실수 fNum1의 값은 : %f", fNum1, fNum1);
		System.out.println();
		System.out.printf("실수 fNum1의 값은 : %.2f", fNum1, fNum1); // 실수 출력을 원하는 자리까지 출력하고 싶으면 .N로 작성하면됨 N은 몇번째 자리까지 출력할지 숫자 적으면 됨
		
		System.out.println();
		//문자의 포맷 지정: %c
		char ch = 'a';
		System.out.printf("문자 %c를 숫자로 변환하면 %d", ch, (int)ch);
	}
	
	//이스케이프: 포맷팅을 지정하는 출력 메소드 안에서, 기능이 있는 문자를 문자 그대로 출력
	public void test4() {
		System.out.printf("오늘 출석률 90%%"); //%의 뒤의 %는 문자로 출력
		System.out.printf("\n아쉽네...\n"); // \n:개행 처리
		System.out.printf("쉬\t고\t싶\t다"); // \t: 일정 간격을 띄우는 처리
		System.out.printf("\n \\t"); // \\를 두번 쓰면 그대로 출력
		System.out.printf("\n외따옴표 '''' ");
		System.out.printf("\n쌍따옴표 \"\"\"\" ");
	}

}
