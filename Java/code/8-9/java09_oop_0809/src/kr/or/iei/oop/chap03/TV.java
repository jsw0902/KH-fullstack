package kr.or.iei.oop.chap03;


/*
 
 캡슐화 : 객체지향 3대 원칙 중, 하나로 가장 중요한 목적인 데이터의 외부 접근을 막는 원칙.
 	- 추상화를 통해 정의된 데이터들과 기능을 하나로 묶어 관리하는 기법
 	- 속성(변수)의 직접적인 접근을 막고, 변수를 사용하거나 변수의 값을 변경할 수 있는 getter() 메소드와 setter() 메소드를 제공한다.
 	- boolean 자료형의 getter()는 is변수명() 형식으로 작성한다.
 	- 변수의 접근제어지시자를 통해, 직접적인 접근은 막았다. 근데 얼마든지 setter를 통해 값을 변경할 수 있는것이 아닌가?
 		-> setter() 메소드 안에서 조건식을 통해, 할당될 값을 제어할 수 있음.
 
 1) getter() 메소드 작성 방법
 
 public 변수자료형 get변수명(){
 	return 변수;
 }
 
 2) setter() 메소드 작성 방법
 
 public void  set변수명(변수자료형 매개변수명){
 	this.변수명 = 매개변수;
 }
  
 */
public class TV {
	/*
	public int inch; 		//TV의 크기를 저장할 변수
	public int volume;		//TV의 볼륨값을 저장할 변수
	public int channel;		//TV의 채널값을 저장할 변수
	public boolean power;	//TV의 전원 on/off 값을  저장할 변수
	
	
	public void channelUp() {
		channel++;
	}
	public void channelDown() {
		channel--;
	}
	public void volumeUp() {
		volume++;
	}
	public void volumeDown() {
		volume--;
	}
	public void powerOnOff() {
		power = !power; 
	}
	*/
	
	private int inch;
	private int volume;
	private int channel;
	private boolean power;
	
	public int getInch() {
		return this.inch;
	}
	public void setInch(int inch) {
		this.inch = inch;
		
	}
	public int getVolume() {
		return this.volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
		
	}
	public int getChannel() {
		return this.channel;
	}
	public void setChannel(int channel) {
		this.channel = channel;
		
	}
	public boolean isPower() { //기본자료형 8개중, boolean은 get 형식이 아니고, is 형식으로 작성한다.
		return this.power;
	}
	public void setPower(boolean power) {
		this.power = power;
		
	}
}
