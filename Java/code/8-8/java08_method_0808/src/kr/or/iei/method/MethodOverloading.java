package kr.or.iei.method;

/*
 * 
 * 메소드 오버로딩 : 한 클래스 내에서 매개변수 선언부가 다르고, 이름이 동일한 메소드를 여러개 정의하는 것.
 *				1) 여러개 정의된 메소드의 이름이 동일해야 한다.
 *				2) 매개변수 선언부가 달라야 한다.
 * 					-갯수가 다르거나, 자료형이 달라야한다.
 * 				3) 접근제어지시자, 반환형은 오버로딩 조건에 영향을 미치지 않는다.
 *				4) 매개변수 선언부에 사용되는 매개변수의 명칭도 영향을 미치지 않는다
 * 
 */

public class MethodOverloading {
	
	public void mainMtd() {
		
		//==========================매개 변수의 갯수가 달라야 한다.=========================
		
		//두 개의 합을 구하는 메소드 호출
		int sum1 = sum(10, 20);
		
		//세 개의 합을 구하는 메소드 호출
		int sum2 = sum(10, 20, 30);
		
		//네 개의 합을 구하는 메소드 호출
		int sum3 = sum(10, 20, 30, 40);
		
		//==========================매개 변수의 갯수가 같다면 자료형이 달라야 한다.=========================
		double sum4 = overloading1(10,3.5);
		double sum5 = overloading1(3.5, 20);
		
		//==========================접근제어 제시자, 반환형은 오버로딩 조건에 영향을 미치지 않는다.=========================
		//overloading2 메소드 참고.
		//overloading2(true, 10.5);
		
	}
	/* 매개변수의 갯수만 다를뿐 결국 전달받은 매개변수를 더해서 반환해주는 동일한 기능
	public int sum(int number1, int number2) {
		//이 메소드는 2개의 정수를 전달 받아, 합계를 구하고 int형으로 값을 반화냏주어야한ㄷ.
		int sum = number1 + number2;
		
		return sum;
	}
	
	public int sum1(int number1, int number2, int number3) {
		
		int sum =number1 +number2 +number3;
		return sum;
	}
	
	public int sum2(int number1, int number2, int number3, int number4) {
		
		int sum =number1 +number2 +number3 +number4;
		
		return sum;
	}
	*/

	public int sum(int number1, int number2) {

		int sum = number1 + number2;

		return sum;
	}

	public int sum(int number1, int number2, int number3) {

		int sum = number1 + number2 + number3;
		return sum;
	}

	public int sum(int number1, int number2, int number3, int number4) {

		int sum = number1 + number2 + number3 + number4;

		return sum;
	}

	// 동일한 갯수지만, 자료형이 다르므로 메소드 오버로딩 성립
	public double overloading1(int number1, double dNum) {
		double sum = number1 + dNum;
		return sum;
	}

	public double overloading1(double dNum, int number1) {
		double sum = number1 + dNum;
		return sum;
	}
	
	// 반환형은 메소드 오버로딩 조건에 성립되지 못한다. 즉, 영향을 미치지 않는다.
	// 반환형이 달라도, 결국에는 매개변수의 갯수 or 타입이 달라야 한다.
	/*
	public void overloading2(boolean bool, double dNum) {

	}

	public int overloading2(boolean bool, double dNum) {

	}
	*/
	//접근제어지시자는 메소드 오버로딩 조건에 성립되지 못한다. 즉, 영향을 미치지 않난드
	//접근제어지시자가  달라도, 결국에는 매개변수의 갯수 or 타입이 달라야 한다.
	/*
	private int overloading2(boolean bool, double dNum) {

	}

	public int overloading2(boolean bool, double dNum) {

	}
	*/
	
	/*
	public void printMsg() { } //오류
	public int printMsg() { } //반환형을 다르게 작성해도, 오류 발생함. 반환형은 영향을 미치지 않음.
	protected void printMsg() { } //접근제어지시자를 다르게 작성해도, 오류 발생함. 접근제어지시자는 영향을 미치지 않음
	public void printMsg(String msg) { } // 매개변수의 갯수가 다르니 성립
	public void printMsg(String msg, int number) { } //매개변수의 갯수가 다르니 성립
	public void printMsg(int number, String msg) { } //위 라인에 작성된 메소드랑은 명확히 구분되지만, 아래에 작성된 성립되지 못한 메소드로 인해, 오류 발생
	public void printMsg(int number, String msg1) { } //매개변수의 명칭은 영향을 미치지 않음. 오류 발생
	*/
	
	//성립되지 않는 메소드들은 전부다 오류가 발생한다.
	//public void printMsg() { }
	//public int printMsg() { }
	
	//결국 자료형의 갯수와 순서만 다르면 오류가 안난다.
	/*
	public void printMsg() { } //오류
	public int printMsg() { } //오류
	void printMsg() { } //오류
	public void printMsg(String msg) { }
	public void printMsg(String msg, int number) { }
	public void printMsg(int number, String msg) { } //오류
	public void printMsg(int number, String msg1) { } //오류
	*/
}
