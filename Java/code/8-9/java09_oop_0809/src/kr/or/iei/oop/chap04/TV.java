package kr.or.iei.oop.chap04;




/*
 생성자 : 클래스를 객체화할 때 클래스명 뒤에 ()가 생성자.
 	- 용도 (목적) : 객체화할 때, 클래스 내부의 멤버 변수(전역 변수)들의 값을 초기화할 목적으로 작성.
 	- 생성자를 작성하지 않으면, JVM(자바 가상 머신)이 기본 생성자(매개변수가 없는 생성자)를 자동으로 만들어준다.
 	- 생성자의 이름은 클래스 이름이랑 동일해야한다. (동일하지 않으면 오류 발생)
 	- 생성자 선언부에 반환형은 작성하지 않는다.
 	- 매개변수가 있는 생성자"만" 작성하고, 매개변수가 없는(기본 생성자) 생성자를 작성하지 않으면, 자동으로 기본 생성자를 생성해주지 않는다.
 	
 	
 [생성자 작성법]
 public 클래스명(){
 
 }
 
 */

public class TV {
	private int inch;
	private int volume;
	private int channel;
	private boolean power;
	
	
	//기본 생성자
	//매개변수가 없는 생성자. 생성자를 작성하지 않으면 자동으로 생성해준다.
	public TV() {
		System.out.println("매개 변수 없는 생성자 호출");
	}
	
	//일반 생성자
	//매개변수가 있는 생성자
	public TV(int inch, int volume, int channel, boolean power) {
		//초기화 코드
		this.inch = inch;
		this.volume = volume;
		this.channel = channel;
		this.power = power;
		System.out.println("매개변수 있는 생성자 호출");
	}
	
	
	/*
	 getter 메소드 작성
	 public 변수자료형 get변수명(){
	 	return this.변수명;
	 }
	 */
	public int getInch() {
		return this.inch;
	}
	public int getVolume() {
		return this.volume;
	}
	public int getChannel() {
		return this.channel;
	}
	public boolean isPower() {
		return this.power;
	}
	
	/*
	 setter 메소드 작성법
	 
	 public void set변수명(변수자료형 매개변수명){
	 	this.변수명 = 매개변수명;
	 }
	 */
	
	public void setInch(int inch) {
		this.inch = inch;
	}
	
	public void setVolume(int volume) {
		this.volume = volume;
	}
	
	public void setChannel(int channel) {
		this.channel = channel;
	}
	public void setPower(boolean power) {
		this.power = power;
	}
}
