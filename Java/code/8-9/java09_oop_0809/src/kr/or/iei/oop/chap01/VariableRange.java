package kr.or.iei.oop.chap01;


/*
 * 
 * 지역변수
 * 		- 메소드 내부 최상단 or 메소드 내부 특정 영역에서 "선언"된 변수
 * 		- 지역변수에는 접근제어지시자 사용이 불가능하다.
 * 		- 해당 영역(if, for....)이 종료되거나, 메소드가 종료되면 소멸된다.
 * 		- 메소드 내부에서 전역변수와 같이 사용할경우, 전역변수보다 우선순위가 높다
 * 		- 선언 후, 사용하려면 초기화 작업이 필요하다.
 * 
 * 전역변수
 * 		- 클래스 레벨에서 "선언"될 변수.
 * 		- 선언 후, 할당하는 작업이 없어도 자동으로 초기화가 된다.
 * 		- 메소드 내부에서 지역변수와 같이 사용될 경우, 전역변수에 접근하려면 this.전역변수명 형식으로 접근한다.
 * 		- 클래스 레벨에서 선언되고, 클래스 전역에서 사용이 가능하지만 또한 접근제어지시자에 의해 외부에서도 사용이 가능하다.
 * 
 * 정적변수
 * 		- static 키워드를 사용하여 클래스 레벨에 선언된 변수.
 * 		- 클래스가 메모리에 로드될 때, 한번만 초기화 된다.
 * 		- 모든 인스턴스가 공유할 수 있는 변수
 */


public class VariableRange {
	
	//전역 변수(멤버 변수 or 인스턴스 변수)
	int globalVariable = 30;
	
	//전역 변수 접근제어지시자
	public int publicVariable = 50;
	protected int protectedVariable = 50;
	int defaultVariable = 50;
	private int privateVariable = 50;
	
	//정적 변수(클래스 레벨에서 선언되고, static 키워드를 사용해 선언된 변수
	public static double dNum = 23.145;
	
	//전역 변수
	public String str;
	
	
	//지역 변수
	public void lacalVarieble1(int number3) {
		int number1 = 10;
		
		if(true) {
			int number2 = 20; //if문 안에서만 사용이 가능.
		}
		
		//number2 = 50; //if문 안에서만 사용이 가능한 변수. 오류 발생
		
		number1 = 30; //메소드 최상단에서 선언된 변수라, 메소드 내부 어디에서나 사용이 가능
		
		number3 = 50;
		
		globalVariable = 40; //클래스 전역에서 사용 가능하니, 재할당 가능
	}
	
	
	
	public void lacalVarieble2() {
		
		//동일한 이름으로 전역변수와 지역변수가 공종하지 않고, 전역변수만 존재하는 경우에는 자동으로 전역변수가 사용된다.
		globalVariable = 50;
		this.globalVariable = 50;
		
		int defaultVariable = 30;
		
		//동일한 이름으로 전역변수와 지역변수가 클래스내에 공존하는 경우, 지역변수가 우선순위 높다
		defaultVariable = 30;
		
		//this는 전역변수에 접근하기 위한 예약어.
		this.defaultVariable = 40;
	}
	
	public void variable() {
		System.out.println("전역변수 : " + str); //전역변수는 선언만 해도 자동으로 초기화가 된다.
		
		String str2; //얘는 지역변수 -> 지역변수는 무조건 초기화 후 사용해야한다.
		//System.out.println("전역변수 : " + str2); //지역변수는 꼭 초기화 작업이 필요하다.
	
		//public int number = 10; //지역변수는 접근제어지시자 사용이 불가능하다.
	}

}
