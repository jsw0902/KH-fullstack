package kr.or.iei.oop.chap02;

public class Start {

	public static void main(String[] args) {
		/*
		 * TV라는 설계도를 추상화 과정을 통해서, TV 클래스에 속성과 기능을 작성하였다.
		 * 이 TV설계도(클래스)를 사용(생성)하려면 객체화 작업을 해야 한다.
		 * 즉, 클래스(설계도) -> 객체(제품)를 생성하기 위해서는 new 연산자를 통해 객체화(생성)한다.
		 * 
		 * [객체화 표현식]
		 * 자료형(타입) 약어 = new 자료형의 주소();
		 */
		TV tv1 = new TV(); //TV 클래스를 1개의 객체로 객체화.
		tv1.channelUp();
		tv1.channelDown();
		tv1.powerOnOff();
		tv1.channel = 20; //channel 전역변수는 public 접근제어 지시자를 사용했으므로, 외부(Start.java)에서 직접 접근이 가능.
		tv1.volume = 1; 
		
		//tv2는 TV라는 클래스로 객체화한 동일 객체이지만, 각각의 인스턴스라고 얘기할 수 있다.
		TV tv2 = new TV(); //TV 클래스를 1개의 객체로 객체화.
		
		
		System.out.println("TV1 : " + tv1); //각각의 인스턴스이기 때문에, 별도의 주소값을 가짐.
		System.out.println("TV2 : " + tv2); 
		
		//tv1과 tv2는 동일 클래스로 만들어진 객체이지만, 각각의 주소값을 가지는 다른 인스턴스이기 때문에
		//한쪽의 속성값을 변경하더라도, 다른 한쪽의 속성값은 유지된다.
		System.out.println("TV2.channel : " + tv2.channel);
	}

}
