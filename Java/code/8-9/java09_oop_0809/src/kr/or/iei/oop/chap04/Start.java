package kr.or.iei.oop.chap04;

public class Start {

	public static void main(String[] args) {
		TV tv = new TV(); //매개변수를 전달하지 않아서, 매개변수가 없는 생성자가 호출됨
		
		tv.setChannel(20);
		tv.setVolume(10);
		System.out.println("tv의 채널 : " + tv.getChannel());
		System.out.println("tv의 전원 On/Off : " + tv.isPower());
		
		TV tv2 = new TV(10,20,30,false); //매개변수가 있는 생성자 호출
		System.out.println(tv);
		
	}

}
