package kr.or.iei.method;


/*
[메소드 표현식]

public void test1(){
	실행코드;
}
접근제어지시자 반환형 메소드명칭(자료형 매개변수명칭1,자료형 매개변수명칭2,자료형 매개변수명칭3......){
	실행코드;
}

매개변수 : 메소드 호출 시, 메소드에 전달할 변수.

*/
public class MethodArgs {
	
	public void mainMtd() {
		makeFoodTest();
		
		
		//---------------------- 매개변수와 전달값 명칭의 관계 -----------------------
		//전달값의 변수 명칭과 메소드 선언부의 매개변수 명칭은 상관관계가 없다.
		//전달값의 자료형과, 메소드 선언부의 매개변수 자료형만 일치하면 됨.
		//메소드 선언부에 매개변수를 작성했는데, 호출 시 전달값이 없으면 오류 발생 
		String egg = "계란";
		makeFood(egg);
		
		String chicken = "토종닭";
		makeFood2(chicken);
		
		makeFood("네네치킨");
		
		//makeFood();
		
		//-------------- 매개변수의 순서와 갯수 -----------------
		int number1 = 10;
		int number2 = 20;
		sum(number1, number2);
		sum(10, 30);
		//sum(10); //매개변수의 갯수와 전달 시 전달값의 갯수도 일치해야 한다.
		sum(number2, number1); //매개변수의 순서는 중요하지 않음. 바꿔도 상관없지만 단 자료형은 일치해야됨
		test(false, 3.2);
		//test(3.2, false); //첫번째 전달값은 첫번째 매개변수의 자료형과 일치해야하고, 두번째 전달값은 두번째 매개변수 자료형과 일치해야함
		
		
		//-------------- 기본자료형과 참조자료형 -----------------
		int num = 10;
		test2(num);
		System.out.println("num을 메소드에서 20으로 변경했음 :  " +num); //10으로 유지된다. -> 값을 복사해서 넘겨주니까 원본 영향 없다.
		
		int [] arr = {1,2,3,4,5};
		arrayTest(arr); //배열의 주소값을 전달해줌
		for(int i = 0; i<arr.length; i++) {
			System.out.print(arr[i]+" "); //arrayTest()에서 변경한 값으로 대체되었음.
		}
		
	}
	
	public void makeFoodTest() {
		System.out.println("재료가 없는데??");
	}
	
	
	public void makeFood(String egg) {
		System.out.println(egg + "를 섞었습니다.");
	}
	
	public void makeFood2(String chicken) {
		System.out.println(chicken + "으로 치킨을 만들었습니다.");
	}
	
	public void sum(int num1, int num2) {
		System.out.println();
	}
	
	public void test(boolean bool, double dNum) {
		
	}
	
	public void test2(int num) {
		num = 20;
	}
	//참조 자료형도 가능
	public void arrayTest(int [] arr) {
		arr[3] = 20;
	}
}
