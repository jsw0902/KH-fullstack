package kr.or.iei.start;

import kr.or.iei.method.MethodArgs;
import kr.or.iei.method.MethodReturn;
import kr.or.iei.method.MethodTest1;

public class Start {

	public static void main(String[] args) {
		MethodTest1 mT = new MethodTest1();
		mT.test();
		
		//=====================접근제어지시자==============================
		mT.publicMethod();
		//mt.protectedMethod(); //동일 패키지 안에서만 호출 가능
		//mt.defaultMethod(); //동일 패키지 안에서만 호출 가능
		//mt.privateMethod(); //동일 클래스 안에서만 호출 가능
		
		//=====================반환형==============================
		MethodReturn rT = new MethodReturn();
		
		
		int sum = rT.sum(); //반환해주는 값의 자료형이 int니까 int 변수에 할당
		System.out.println("sum()의 결과 : " + sum);
		
		//System.out.println("sum()의 결과 : " + rT.sum()); //출력 메소드 안에서 메소드 호출 가능. 단, 결과를 이후 코드에서 사용할때는 변수에 할당하여 사용할 것
		
		//String msg = rT.printMsg(); //반환해주는 값의 자료형이 String이니까 String 변수에 할당.
		//System.out.println("printMsg()의 결과 : " + msg);
		
		double avg = rT.avg();
		System.out.println("avg()의 결과 : " + avg);
		
		String returnTestMtd = rT.returnTest();
		System.out.println("returnTest()의 결과 : " + returnTestMtd);
		
		
		//int s = rT.voidTest(); //void는 반환값이 없으므로, 변수에 결과를 할당할 수 없다.
		rT.voidTest();
		
		//=====================매개변수==============================
		MethodArgs aT = new MethodArgs();
		
		//aT.arrayTest();
		
	}
	

}
