package kr.or.iei_control;

import java.util.Scanner;
/*
  제어문 : 실행코드의 흐름을 제어
  - 반복문 : 사용자가 원하는 만큼 코드를 반복적으로 실행
  - 종류 : for. while, do~while
  
  - for문 표현법
  
  for(초기식; 조건식; 증감식){
  	//반복 실행할 실행 코드
  }
  
  - for문의 특징
  1) 반복 횟수가 명확히 정해져있을 때 일반적으로 사용
  2) 초기식은 반복문 실행 시, 처음 1번만 실행됨
  3) 동작 순서 : 초기식 -> (조건식 -> 실행코드 -> 증감식) -> (조건식 -> 실행코드 -> 증감식) -> (조건식 -> 싱행코드 -> 증감식)
  			....(반복)..... 조건식에서 false인 경우, 반복문 탈출!
 */
public class ControlFor {
	public void forTest1() {
		for(int i=0; i<5; i++) { 
			//int i는 for문 안에서만 사용이 가능
			//i가 0부터 4까지 1씩 증가하며, 총 5번 수행되는 반복문
			
			/*
			 동작순서)
			 초기식 -> (조건식 -> 실행코드 -> 증감식) -> (조건식 -> 실행코드 -> 증감식)
			 
			 동작과정)
			 
			 초기식에 의해 i라는 변수에 0이라는 값이 할당.
			 
			 i			i<5
			 0			true-> 실행코드		i증가
			 1			true-> 실행코드 		i증가
			 2			true-> 실행코드 		i증가
			 3			true-> 실행코드 		i증가
			 4			true-> 실행코드 		i증가
			 5			false -> for문 탈출
			 */
			System.out.println("for문 실행");
		}
		
		//v2 역 for문
		for(int i=5; i>0; i--) {
			/*
			 초기식 -> (조건식 -> 실행코드 -> 증감식) -> (조건식 -> 실행코드 -> 증감식)
			 
			 동작과정)
			 
			 i			i>0
			 5			true->실행코드 		i감소
			 4			true->실행코드 		i감소
			 3			true->실행코드 		i감소
			 2			true->실행코드 		i감소
			 1			true->실행코드 		i감소
			 0			false -> for문 탈출
			 */
			System.out.println("역 for문 실행");
			System.out.println("i : " + i);
		}
	}
	
	public void forTest2() {
		for(int i=0; i<5; i++) {
			//기본 for문
		}
		for(int i=5; i>0; i--) {
			//역 for문
		}
		for(double d=1.0; d<5.0; d++) {
			//다양한 자료형 v1
		}
		for(char ch='a'; ch<'z'; ch++) {
			//다양한 자료형 v2
		}
		for(int i=0; i<5; i+=2) {
			//증감식 변경
		}
		
		/*//true면 i를 3으로 계속 재할당하기때문에 for문을 멈추지 않고 계속 실행함
		for(int i=0; i<10; i++) {
			if(true) { //true라고 작성했지만, 특정 조건을 의미.
				i=3; //재할당(초기화가 아님)
			}
		}
		*/
	}
	//for - 1부터 사용자 입력값까지 출력
	public void forTest3() {
		Scanner sc = new Scanner(System.in);
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();
		
		//v1
		for(int i=0; i<num; i++) {
			//사용자 입력 값 : 5
			System.out.println("i : " + (i + 1));
		}
		System.out.println("======================");
		
		//v2
		for(int i=1; i<=num; i++) {
			//사용자 입력 값 : 5
			System.out.println("i : " + i);
			/*
			동작순서)
			 초기식 -> (조건식 -> 실행코드 -> 증감식) -> (조건식 -> 실행코드 -> 증감식)
			 
			 동작과정)
			 
			 초기식에 의해 i라는 변수에 0이라는 값이 할당.
			 
			 i			i<num ex) 5입력
			 0			true-> 실행코드		i증가
			 1			true-> 실행코드 		i증가
			 2			true-> 실행코드 		i증가
			 3			true-> 실행코드 		i증가
			 4			true-> 실행코드 		i증가
			 5			true->false -> 탈출
			 */
		}
	}
	
	//for - 1부터 사용자 입력값까지의 짝수 갯수 출력
	public void forTest4() {
		Scanner sc = new Scanner(System.in);
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();
		
		//짝수의 갯수를 저장할 변수 (for 내부에서 선언 또는 재할당 시, 정상적으로 출력이 되지 않음)
		int cnt = 0; //처음에는 입력한 숫자까지 짝수의 갯수를 모르니깐 0이라고 할당
		
		/*
		//v1
		for(int i=1; i<=num; i++) {
			
			//cnt를 여기서 재할당하면, 반복시마다 0으로 변경됨
			
			if(i%2 == 0) { //i말고 num을 넣게되면 값이 고정되서 짝수 출력이 안됨
				//현재 i가 짝수라는 것
				System.out.println("짝수 : " + i);
				cnt++;
			}
		}
		*/
		//v2
		for(int i=2; i<=num; i+=2) {
			System.out.println("짝수 : " + i);
			cnt++;
		}
		System.out.println("짝수의 갯수 : " + cnt);
		
	}
	
	//for - 입력한 문자열 차례대로 1문자씩 출력
	public void forTest5() {
		/*Scanner sc = new Scanner(System.in);
		System.out.print("정수 입력 : ");*/
		
		String str = "Hello";
		//입력 문자열 : Hello
		for(int i=0; i<=5; i++) {
			System.out.println(str.charAt(i));
		}
	}
	
	//for - 구구단
	public void forTest6() {
		for(int i=1; i<=9; i++) {
			// i : 1~9까지 반복되니, 각 i의 값에 2를 곱해주면, 구구단 2단이 됨
			System.out.println(2 * i);
		}
	}
	
	public void forTest7() {
		Scanner sc = new Scanner(System.in);
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();
		
		if(num >= 2 && num <= 9) {
			for(int i=1; i<=9; i++) {
				System.out.printf("\n%d * %d = %d",num, i ,num * i);
			}
		}
		else {
			System.out.println("다시 입력해주세요");
		}
	}
	
	//for - 중첩 for문
	//for문 내부에 for문
	public void overLapFor() {
		int cnt = 1;
		for(int i=0; i<5; i++){
			for(int j=0; j<5; j++) {
				//System.out.println("overLap For");
				/*System.out.println("i : " + i);
				System.out.println("      j : " + j);*/
				
				System.out.println("i : " + i + ", j : " + j);
				
				System.out.println("현재 횟수 : " + cnt);
				++cnt;
			}
		}
		
		/*
		 동작 순서)
		 i		i<5		i증강식		k		k<5			k증감식
		 ====================================================
		 0		true
		 							0		true->출력	k++
		 							1		true->출력	k++
		 							2		true->출력	k++
		 							3		true->출력	k++
		 							4		true->출력	k++
		 							5		false->반복문 탈출
		 				i++
		 1		true	
		 							0		true->출력	k++
		 							1		true->출력	k++
		 							2		true->출력	k++
		 							3		true->출력	k++
		 							4		true->출력	k++
		 							5		false->반복문 탈출
		 2		true	
		 							0		true->출력	k++
		 							1		true->출력	k++
		 							2		true->출력	k++
		 							3		true->출력	k++
		 							4		true->출력	k++
		 							5		false->반복문 탈출
		 3		true	
		 							0		true->출력	k++
		 							1		true->출력	k++
		 							2		true->출력	k++
		 							3		true->출력	k++
		 							4		true->출력	k++
		 							5		false->반복문 탈출
		 4		true	
		 							0		true->출력	k++
		 							1		true->출력	k++
		 							2		true->출력	k++
		 							3		true->출력	k++
		 							4		true->출력	k++
		 							5		false->반복문 탈출
		 5		false -> 반복문 탈출
		  */
	}
	/*
	 1 2 3 4 5
	 1 2 3 4 5
	 1 2 3 4 5
	 1 2 3 4 5
	 1 2 3 4 5
	 */
	
	public void overLapFor2() {
		
		//첫번째 for : 출력
		//두번째 for : 개행
		for(int i = 1; i<=5; i++) {
			//출력을 담당할지, 개행처리를 담당할지
			for(int j = 1; j<=5; j++) {
				//출력을 담당할지 개행처리를 담당할지
				System.out.print(j + " "); // 1 2 3 4 5
			}
			System.out.println("");
		}
	}
	/*
	 요구사항: 충첩 for문 
	 1 1 1 1 1
	 2 2 2 2 2
	 3 3 3 3 3
	 4 4 4 4 4
	 5 5 5 5 5
	 */
	public void overLapFor3() {
		/*
		 풀이 과정)
		 
		 1. for문 2개 사용(요구사항에 기술되어 있음)
		 2. 세로로 1,2,3,4,5 출력해서 가로로 붙여볼까? -> 개행처리된 출력문을 가로에 붙일 수 없네
		 3. 그럼 가로에 나열되어 있는 숫자(ex. 1 1 1 1 1)를 출력한 뒤에 개행을 해야겠네?
		 4. 그럼 1번 개행처리될 때, 총 5번의 출력 수행이 되네?
		 5. 
		 */
		
		for(int i = 0; i<5; i++) {
			for(int j = 0; j<5; j++) {
				System.out.print(i+1 + " ");
			}
			System.out.println();
		}
		/*
		for(int i = 1; i<=5; i++) {
			for(int j = 0; j<5; j++) {
				System.out.print(i+" ");
			}
			System.out.println("");
		}
		*/
	}
	/*
	 1*** - 1행 1열
	 *2** - 2행 2열
	 **3* - 3행 3열
	 ***4 - 4행 4열
	 
	 */
	public void overLapFor4() {
		for(int i = 1; i<=4; i++) {
			for(int j = 1; j<=4; j++) {
				if(i == j) {
					System.out.print(i);
				}else {
					System.out.print("*");
				}
			}
			System.out.println();
		}
	}
	
	/*
	 
	  	***4 1행 4열
	  	**3* 2행 3열
	  	*2** 3행 2열
	  	1*** 1행 1열
	 
	 */
	public void overLapFor5() {
	/*	
		동작 순서)
	 i		i<=4	i증강식		k			k>0					k증감식
	 =================================================================
	 0		true
	 							4		true->i==k ? 5 - k : *	   k--
	 							3		true->i==k ? 5 - k : *	   k--
	 							2		true->i==k ? 5 - k : *	   k--
	 							1		true->i==k ? 5 - k : *	   k--
	 							0		false->반복문 탈출
	 				i++
	 1		true	
	 							4		true->i==k ? 5 - k : *	   k--
	 							3		true->i==k ? 5 - k : *	   k--
	 							2		true->i==k ? 5 - k : *	   k--
	 							1		true->i==k ? 5 - k : *	   k--
	 							0		false->반복문 탈출
	 				i++
	 2		true	
	 							4		true->i==k ? 5 - k : *	   k--
	 							3		true->i==k ? 5 - k : *	   k--
	 							2		true->i==k ? 5 - k : *	   k--
	 							1		true->i==k ? 5 - k : *	   k--
	 							0		false->반복문 탈출
	 				i++
	 3		true	
	 							4		true->i==k ? 5 - k : *	   k--
	 							3		true->i==k ? 5 - k : *	   k--
	 							2		true->i==k ? 5 - k : *	   k--
	 							1		true->i==k ? 5 - k : *	   k--
	 							0		false->반복문 탈출
	 				i++
	 4		true	
	 							4		true->i==k ? 5 - k : *	   k--
	 							3		true->i==k ? 5 - k : *	   k--
	 							2		true->i==k ? 5 - k : *	   k--
	 							1		true->i==k ? 5 - k : *	   k--
	 							0		false->반복문 탈출
	 5		false -> 반복문 탈출
	  */

		for(int i=1; i<=4; i++) {
			for(int k=4; k>0; k--) {
				if(i==k) {
					System.out.print(5-k);
					//System.out.print(i);
				}
				else {
					System.out.print("*");
				}
			}
			System.out.println();
		}
	}
	public void overLapFor6() {
		
	}
	
}
