package kr.or.iei.oop.chap02;


/*
 * 추상화(abstraction) : 프로그램에 필요한 속성과 기능을 추출하여 클래스에 작성하는 것.
 * - 속성 -> 멤버 변수
 * - 기능 -> 메소드
 * 
 */
public class TV {
	
	//추상화를 통해 추출한 속성
	public int inch; 		//TV의 크기를 저장할 변수
	public int volume;		//TV의 볼륨값을 저장할 변수
	public int channel;		//TV의 채널값을 저장할 변수
	public boolean power;	//TV의 전원 on/off 값을  저장할 변수
	
	
	//추상화를 통해 추출한 기능	
	public void volumeUp() {
		volume++;
	}
	public void volumeDown() {
		volume--;
	}
	public void channelUp() {
		channel++;
	}
	public void channelDown() {
		channel--;
	}
	public void powerOnOff() {
		power = !power; //현재 상태의 반대(전원이 켜져있으면 끄고, 꺼져있으면 키고) 값 할당.
	}
}
