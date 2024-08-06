package kr.or.iei_control;


/*
  continue : 반복문 안에 사용하는 분기문.
   	 - 반복문 실행 중, continue;를 만나면 이후 코드는 실행하지 않고, 현재 반복문을 다시 실행
   	 - for문의 경우 증감식으로 이동한다.
   	 
  [표현식]
  
  for(int i = 0; i<5; i++){
  	System.out.println("A");
  	continue;
 	System.out.println("B");
 */
public class ControlContinue {
	public void continueTest1() {
		for(int i = 0; i<10; i++) {
			System.out.println("i : " + i);
			System.out.println("A");
			if(i == 3) {
				continue;
			}
			
			//continue;는 이후 코드를 실행하지 않기 때문에, 아루런 제약없이 사용 후, 아래에 코드를 작성하ㅕㄴ
			//아래 코드는 항상 실행되지 않기 때문에, 컴파일 오류가 발생한다.
		  	System.out.println("B");
		}
	}
	
	public void continueTest2() {
		//1부터 10까지의 짝수를 출력
		
		//v1
		for(int i = 1; i<= 10; i++) {
			if(i%2 == 0) {
				System.out.println("짝수 : " + i);
			}
		}
		
		System.out.println("===============================");
		
		//v2
		for(int i = 2; i<= 10; i+=2) {
			System.out.println("짝수 : " + i);
		}
		
		System.out.println("===============================");
		
		//v3
		for(int i = 1; i<=10; i++) {
			if(i%2 != 0) {
				//홀수일 때
				continue;
			}
			System.out.println("짝수 : " + i);
		}
	}
}
