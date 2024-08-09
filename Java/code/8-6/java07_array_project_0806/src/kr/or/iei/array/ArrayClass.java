package kr.or.iei.array;

import java.util.Scanner;
import java.util.Arrays;
import java.util.Random;

public class ArrayClass {
	
	/*
	 배열 : 동일한 자료형의 집합
	 	 - 모든 배열은 참조 자료형이다.
	 	 - 배열 선언 및 생성 시, 각 자료형의 초기값이 할당된다.
	 	 - 배열은 한번만 선언이 가능하다.(재생성 시, 별도의 주소값으로 참조된다.)
	 
	 [표현식]
	 
	 자료형 [] 배열명칭 = new 자료형[배열길이];
	
	 */
	public void arrayTest1() {
		
		/*
		//정수형 변수 5개 선언
		int num1 = 10;
		int num2 = 20;
		int num3 = 30;
		int num4 = 40;
		int num5 = 50;
		
		System.out.println(num1);
		System.out.println(num2);
		System.out.println(num3);
		System.out.println(num4);
		System.out.println(num5);
		
		for(int i= 1; i<=5; i++) {
			//System.out.println(numi); //변수 numi를 출력하는 코드
		}
		*/
		
		//배열 사용 - 선언
		int [] intArr; //선언
		intArr = new int[5]; //생성
		
		//배열 사용 - 선언과 생성
		int [] intArr2 = new int [5]; //0,1,2,3,4 인덱스를 가짐
		
		//배열 사용 - 할당 v1
		intArr[0] = 10; // 배열의 0번째 인덱스에 정수 10 할당.
		intArr[1] = 20; // 배열의 1번째 인덱스에 정수 10 할당.
		intArr[2] = 30; // 배열의 2번째 인덱스에 정수 10 할당.
		intArr[3] = 40; // 배열의 3번째 인덱스에 정수 10 할당.
		intArr[4] = 50; // 배열의 4번째 인덱스에 정수 10 할당.
		
		System.out.println(intArr[0]); //배열의 0번째 인덱스의 값
		System.out.println(intArr[1]); //배열의 1번째 인덱스의 값
		System.out.println(intArr[2]); //배열의 2번째 인덱스의 값
		System.out.println(intArr[3]); //배열의 3번째 인덱스의 값
		System.out.println(intArr[4]); //배열의 4번째 인덱스의 값
		
		
		//배열 사용 - 할당 v2
		int [] intArr3 = {1,2,3,4,5}; //길이가 5인 정수형 배열을 생성하며, 값을 할당
		System.out.println(intArr3[0]);
		System.out.println(intArr3[1]);
		System.out.println(intArr3[2]);
		System.out.println(intArr3[3]);
		System.out.println(intArr3[4]);
	}
	
	//배열 - 반복문 사용
	public void arrayTest2() {
		int [] arr = new int[5];
		/*
		 arr[0] = 1;
		 arr[1] = 1;
		 arr[2] = 1;
		 arr[3] = 1;
		 arr[4] = 1;
		 */
		
		for(int i = 0; i<5; i++) {
			arr[i] = i; //0번부터 4번 인덱스까지 변수 i를 활용하여 값 할당
		}
		
		for(int i=0; i<5; i++) {
			System.out.println(i +"번째 인덱스의 값은 : " + arr[i]);
		}
	}
	//배열 - 자료형
	//모든 배열의 자료형은 참조 자료형이다
	//기본자료형 배열도 참조 자료형
	public void arrayTest3() {
		int [] arr = {1,2,3,4,5}; //길이 5인, 정수형
		
		//int : 기본자료형
		//int로 선언된 배열은 참조자료형이므로, 주소값을 출력
		System.out.println("arr : " + arr);
		
		String [] strArr = {"Hello", "My", "Name", "is", "JSW"};
		System.out.println("strArr : " + strArr);
		
		//String 배열은 참조의 참조 구조이지만, String 변수 사용 시, 내부적으로 문자열을 반환해주기 때문에 실제 값이 출력된다.
		System.out.println("strArr[0] : " + strArr[0]);
		
		
		
	}
	//배열 - 초기값
	//배열 선언 시, JVA(자바 가상 머신)이 각 배열의 초기화를 진행해준다.
	public void arrayTest4() {
		boolean [] boolArr = new boolean[5];
		double [] doubleArr = new double[5];
		int [] intArr = new int[5];
		String [] strArr = new String[5];
		char [] chArr = new char [5];
		
		for(int i = 0; i<5; i++) {
			System.out.println("boolArr " + i + "현재 값" + boolArr[i]);
			}
		for(int i = 0; i<5; i++) {
			System.out.println("doubleArr " + i + "현재 값" + doubleArr[i]);
			}
		for(int i = 0; i<5; i++) {
			System.out.println("intArr " + i + "현재 값" + intArr[i]);
			}
		for(int i = 0; i<5; i++) {
			System.out.println("strArr " + i + "현재 값" + strArr[i]);
			//null이란 문자열이 할당된 것이 아니고, 빈 문자열을 의미하는 단어다.
		}
		for(int i = 0; i<5; i++) {
			System.out.println("chArr " + i + "현재 값" + chArr[i]);
			//아무것도 출력되지 않는 것처럼 보이지만, 빈 문자가 할당되어 있다.
		}
	}
	
	public void arrayTest5() {
		//길이 5짜리 정수형 배열을 선언하고, 각 인덱스에 사용자 입력값을 할당.
		Scanner sc = new Scanner(System.in);
		int [] arr = new int[5];
		
		for(int i = 0; i<5; i++) {
			System.out.print(i + "번째 값 입력 : ");
			arr[i] = sc.nextInt();
		}
		
		for(int i = 0; i<5; i++) {
			System.out.print(i + "번째 값 : " + arr[i]);
		}
	}
	
	public void arrayTest6() {
		//길이가 5인 String 배열을 선언하고, 사용자 입력값을 할당한다.
		//출력 시, 역순으로 출력
		Scanner sc = new Scanner(System.in);
		String [] strArr = new String[5];
		
		for(int i = 0; i<5; i++) {
			System.out.print(i + "번째 값 입력 : ");
			String str = sc.next();
			strArr[i] = str;
		}
		
		//길이가 5짜리인 배열의 인덱스는 0~4까지. 그래서 i는 5부터가 아니고 4부터 시작해야됨.
		for(int i = 4; i>=0; i--) {
			//첫 i = 5
			System.out.println(i + "번째 문자열 : " + strArr[i]);
		}
		
	}
	
	//배열 - 재선언
	// 오류는 안나지만 재선언하면 주소값이 변경됨
	public void arrayTest7() {
		int [] arr = new int [5];
		
		for(int i = 0; i<5; i++) {
			arr[i] = i+1;
		}
		
		for(int i = 0; i<5; i++) {
			System.out.println(i + "번째 값 : " + arr[i]);
		}
		
		System.out.println("재선언 이전의 arr : " + arr); //주소값 : [I@5b2133b1
		//사용하다보니까 정수 10개를 사용해야 한다면?
		arr = new int[10];
		System.out.println("재선언 이후의 arr : " + arr); //주소값 : [I@33c7353a
		//새로운 파일이 생성된다.
	}
	
	
	//배열 - 배열의 길이
	//배열의 길이는 배열명치.length
	//소괄호 붙이지 않음
	public void arrayTest8() {
		int[] arr = new int[3];

		//배열의 길이 변경 시, length로 길이를 알 수 있으므로, 각 반복문의 조건식을 변경하지 않아도 됨.
		for (int i = 0; i<arr.length; i++) {
			arr[i] = i + 1;
		}

		for (int i = 0; i <arr.length; i++) {
			System.out.println(i + "번째 값 : " + arr[i]);
		}
		
		System.out.println("현재 arr 배열의 길이 : " + arr.length);
	}
	
	public void arrayTest9() {
		int [] arr1 = {1,2,3,4,5};
		int [] arr2 = {1,2,3,4,5};
		
		//arr1 == arr2는 각 배열의 주소값을 비교한다.
		if(arr1 == arr2) {
			System.out.println("동일한 배열입니다.");
		} else {
			System.out.println("서로 다른 배열입니다.");
			System.out.println("arr1 : " + arr1);
			System.out.println("arr2 : " + arr2);
		}
	}
	
	//문자열을 저장할 배열의 길이를 입력받고, 입력 및 출력 프로그램
	
	public void arrayTest10() {
		Scanner sc = new Scanner(System.in);
		System.out.print("배열의 길이 입력 : ");
		int n1 = sc.nextInt();
		
		sc.nextLine(); // 버퍼에 남아있는 엔터를 제거하기 위함
		String [] strArr = new String[n1];
		for(int i = 0; i<strArr.length; i++) {
			System.out.print(i + "번째 문자열 입력 : ");
			String str = sc.next();
			strArr[i] = str;
		}
		
		for(int i = 0; i<strArr.length; i++) {
			System.out.println(i + "번째 문자열 : " + strArr[i]);
		}
	}
	
	//사용자에게 배열 길이를 입력 받고, 각 인덱스의 값은 1~100까지의 난수값을 할당한다.
	//모두 할당 후, 배열 인덱스 값의 짝수를 각각 출력하고, 짝수들의 총합을 출력하시오.
	
	public void arrayTest11() {
		Scanner sc = new Scanner(System.in);
		Random ran = new Random();
		
		System.out.print("배열의 길이 입력 : ");
		int n1 = sc.nextInt();
		int sum = 0;
		int [] intArr = new int[n1];
		//풀이
		for(int i=0; i<intArr.length; i++) {
			intArr[i] = ran.nextInt(100)+1;
		}
		for(int i = 0; i<intArr.length; i++) {
			System.out.print(i + "번째 인덱스 값 " + intArr[i]); //회사에 가면 디버깅 코드는 지워줘야됨 그 이유는 성능에 영향이 가기때문에
			if(intArr[i]%2==0) {
				System.out.print(" -> 짝수");
				sum+=intArr[i]; 
			}
			System.out.println(); //개행 처리
		}
		/*
		//작성 코드
		int sum = 0;
		for(int i = 0; i<n1; i++) {
			num = ran.nextInt(100)+1;
			int num = ran.nextInt();
			intArr[i] = num;
			System.out.print("배열의 " + i + "번째 인덱스 값은 " + intArr[i] + "입니다.");
			if(intArr[i]%2==0) {
				System.out.print(" -> 짝수");
				sum+=intArr[i]; 
			}
			System.out.println();
			
		}*/
		
		System.out.println("배열 인덱스 짝수 값 총합은 " + sum);
	}
	
	//길이가 4인 정수형 배열을 선언하고, 순서대로 국어점수, 영어점수, 수학점수를 입력받아 할당한다.
	//마지막 인덱스에는 총 합계 점수를 할당하고 출력하라. 단, 출력형식은 아래와 같다.
	/*
	 국어 점수 : 34점
	 영어 점수 : 60점
	 영어 점수 : 10점
	 합계 점수 : 104점
	 평균 점수 : 34.66점
	 
	 */
	public void arrayTest12() {
		int [] arr = new int[4];
		Scanner sc = new Scanner(System.in);
		String [] strArr = new String[3];
		int sum = 0;
		
		strArr[0] = "국어";
		strArr[1] = "영어";
		strArr[2] = "수학";
		
		for(int i = 0; i<arr.length-1; i++) {
			System.out.print(strArr[i] +" 점수 입력 : ");
			int num = sc.nextInt();
			arr[i] = num;
			sum+=num;
		}
		arr[arr.length-1] = sum;
		
		System.out.println("국어 점수 : " + arr[0]);
		System.out.println("영어 점수 : " + arr[1]);
		System.out.println("수학 점수 : " + arr[2]);
		System.out.println("합계 점수 : " + arr[3]);
		System.out.printf("평균 점수 : %.2f점", (double)arr[3]/3);
		
		
	}
	//배열 - 정렬 - 버블 정렬
	/*
	 버블 정렬 : 현재 인덱스와 다음 인덱스 값을 비교하여,
	 		   현재 인덱스 값이 다음 인덱스 값보다 크면
	 		   각 인덱스의 값을 바꿔주는 정렬 방식
	 */
	public void bubbleSort() {
		int [] arr = {5,4,2,1,3}; //길이가 5인 정수형 배열
		
		/* v1
		if(arr[0] > arr[1]) { //5 와 4 비교 후 바꿈
			//앞에 있는 인덱스의 값이, 뒤에 있는 인덱스의 값보다 클 때
			int temp = arr[0];
			arr[0] = arr[1];
			arr[1] = temp;
		}
		
		for(int i = 0; i<arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
		System.out.println();
		
		if(arr[1] > arr[2]) { //5와 2 비교 후 바꿈
			int temp = arr[1];
			arr[1] = arr[2]; 
			arr[2] = temp;
		}
		
		
		for(int i = 0; i<arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
		System.out.println();
		
		if(arr[2] > arr[3]) { //5와 1 비교 후 바꿈
			int temp = arr[2];
			arr[2] = arr[3]; 
			arr[3] = temp;
		}
		
		for(int i = 0; i<arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
		System.out.println();
		
		if(arr[3] > arr[4]) { // 5와 3 비교 후 바꿈
			int temp = arr[3];
			arr[3] = arr[4]; 
			arr[4] = temp;
		}
		
		for(int i = 0; i<arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
		System.out.println();
		*/
		
		//v2
		/*
		//i가 4일 때, i+1은 5 즉, 마지막은 비교가 불필요하기 때문에 length-1처리
		for(int i=0; i<arr.length-1; i++) { //length 뒤에 -1을 해줘야됨 
			if(arr[i] > arr[i+1]) {
				int temp = arr[i];
				arr[i] = arr[i+1]; 
				arr[i+1] = temp;
			}
		}
		
		//위 for문 작업을 3번 더 진행하고 있음.
		
		
		for(int i = 0; i<arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
		System.out.println();
		
		for(int i=0; i<arr.length-1; i++) { //length 뒤에 -1을 해줘야됨 
			if(arr[i] > arr[i+1]) {
				int temp = arr[i];
				arr[i] = arr[i+1]; 
				arr[i+1] = temp;
			}
		}
		
		for(int i=0; i<arr.length-1; i++) { //length 뒤에 -1을 해줘야됨 
			if(arr[i] > arr[i+1]) {
				int temp = arr[i];
				arr[i] = arr[i+1]; 
				arr[i+1] = temp;
			}
		}
		
		for(int i=0; i<arr.length-1; i++) { //length 뒤에 -1을 해줘야됨 
			if(arr[i] > arr[i+1]) {
				int temp = arr[i];
				arr[i] = arr[i+1]; 
				arr[i+1] = temp;
			}
		}
		*/
		
		//위 동일한 for문이 총 4번 반복되고 있음
		//반복안에 반복함. -> 중첩 반복문
		/*
		외부 for문의 조건식을 length-1로 작성한 이유 : length-1만큼 반복하여 진행하면, 
		맨 앞의 값은 가장 작은 숫자로 고정되니 비교하지 않아도 됨
		 
		 */
		/*
		//v3
		for(int k = 0; k<arr.length-1; k++) {
			for(int i = 0; i<arr.length-1-k; i++) { //-k : 고정된 값을 각 회차별로 불필요한 비교 연산을 진행하고 있음.
				System.out.println(arr[i] + " vs " + arr[i+1]);
				if(arr[i] > arr[i+1]) {
					int temp = arr[i];
					arr[i] = arr[i+1]; 
					arr[i+1] = temp;
				}
			}
			System.out.println();
		}
		*/
		
		//Arrays.sort(arr); //정렬 기능 위에 코드 굳이 안써도 쉽게 버블 정렬 가능
		for(int i = 0; i<arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
	}
	
	//배열 - 2차원 배열
	/*
	 [표현식]
	 
	 자료형 [][] 배열명칭 = new 자료형[행길이][행길이];
	 
	 
	 */
	public void arrayTest13() {
		int [][] arr =  new int[3][3];
	
		//할당 - 첫번째 행
		arr[0][0] = 1; 
		arr[0][1] = 2; 
		arr[0][2] = 3; 
		
		//할당 - 두번째 행
		arr[1][0] = 4;
		arr[1][1] = 5;
		arr[1][2] = 6;
		
		//할당 - 세번째 행
		arr[2][0] = 7;
		arr[2][1] = 8;
		arr[2][2] = 9;
		
		for(int i=0; i<arr.length; i++) {
			//System.out.println(arr[i]); //확인용
			for(int k = 0; k<arr[i].length; k++) {
				System.out.print(arr[i][k] + " "); //행은 i
			}
			System.out.println();
		}
	}
	
	/*
	 배열 - 2차원 배열 - 다른 생성 방법
	*/
	public void arrayTest14() {
		int [][] arr = {{1,2,3},{4,5,6},{7,8,9}};
		
		for(int i = 0; i<arr.length; i++) {
			for(int k=0; k<arr.length; k++) {
				System.out.print(arr[i][k] + " ");
			}
			System.out.println();
		}
	}
	
	public void arrayTest15() {
		int [][] arr = new int [5][5];
		
		for(int i = 0; i<arr.length; i++) {
			for(int k=0; k<arr[i].length; k++) {
				arr[i][k] = k+1;
			}
		}
		for(int i = 0; i<arr.length; i++) {
			for(int k=0; k<arr.length; k++) {
				System.out.print(arr[i][k] + " ");
			}
			System.out.println();
		}
	}
	/*
	 ---출력--- 
	 1 1 1 1 1
	 2 2 2 2 2
	 3 3 3 3 3
	 4 4 4 4 4
	 5 5 5 5 5
	 */
	public void arrayTest16() {
		int [][] arr = new int [5][5];
		for(int i = 0; i<arr.length; i++) {
			for(int k=0; k<arr[i].length; k++) {
				arr[i][k] = i+1;	
			}
		}
		for(int i = 0; i<arr.length; i++) {
			for(int k=0; k<arr.length; k++) {
				System.out.print(arr[i][k] + " ");
			}
			System.out.println();
		}
	}
	/*
	 1 2 3 4 5
	 2 3 4 5 6
	 3 4 5 6 7
	 4 5 6 7 8
	 5 6 7 8 9 
	 
	 */
	public void arrayTest17() {
		
		//해주신 코드 v1
		int [][] arr = new int [5][5];
		for(int i = 0; i<arr.length; i++) {
			for(int k=0; k<arr[i].length; k++) {
				arr[i][k] = k+1+i;	
			}
		}
		for(int i = 0; i<arr.length; i++) {
			for(int k=0; k<arr.length; k++) {
				System.out.print(arr[i][k] + " ");
			}
			System.out.println();
		}
		
		/*
		//직접한 코드 v2
		int [][] arr = new int [5][5];
		for(int i = 0; i<arr.length; i++) {
			for(int k=0; k<arr[i].length; k++) {
				arr[i][k] = i+1;	
			}
		}
		for(int i = 0; i<arr.length; i++) {
			for(int k=0; k<arr.length; k++) {
				int sum = arr[i][k] + k;
				System.out.print(sum + " ");
			}
			System.out.println();
		}
		*/
	}
	
	//배열 - 가변 배열
	//2차원 배열에서의 가변 배열 : 배열 생성 시, 행의 길이만 지정하고, 열의 길이를 나중에 지정.
	/*
	 [표현식]
	 
	 자료형 [][] 배열명칭 = new int[행길이][];
	 
	 배열명칭[행번호] = new int[행길이]; //0번째 행
	 배열명칭[행번호] = new int[행길이]; //1번째 행
	 배열명칭[행번호] = new int[행길이]; //2번째 행
	 */
	public void arrayTest18() {
		
		int[][] arr = new int[3][];
		
		arr[0] = new int[3]; //0번째 행에 길이 3짜리 배열 생성
		arr[1] = new int[4]; //2번째 행에 길이 4짜리 배열 생성
		arr[2] = new int[2]; //1번째 행에 길이 2짜리 배열 생성
		
		//할당 - 첫번째 행
		arr[0][0] = 1;
		arr[0][1] = 2;
		arr[0][2] = 3;

		// 할당 - 두번째 행
		arr[1][0] = 4;
		arr[1][1] = 5;
		arr[1][2] = 6;
		arr[1][3] = 7;
		
		// 할당 - 세번째 행
		arr[2][0] = 8;
		arr[2][1] = 9;
		
		
		System.out.println(arr);
		
		System.out.println("==================================");
		
		for(int i = 0; i<arr.length; i++) {
			for(int k=0; k<arr[i].length; k++) {
				System.out.print(arr[i][k] + " ");			
			}
			System.out.println();
		}
	}
}
