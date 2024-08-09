package kr.or.iei.oop.chap03;

import kr.or.iei.oop.chap03.*;

public class Start {

	public static void main(String[] args) {
		TV tv1 = new TV();
		/*
		TV 클래스를 캡슐화 원칙대로, 직접적인 접근을 막기 위해, private로 선언하여,
		아래 코드는 오류가 발생 
		 
		tv1.channel = 20;
		tv1.volume = 3;
		tv1.powerOnOff();
		System.out.println(tv1.channel);
		*/
		
		/*
		 TV 클래스를 캡슐화 원칙대로, 직접적인 접근을 막기 위해, private로 선언하여,
		 getter 또는 setter로 값을 추출하거나 값을 세팅
		 
		 */
		
		tv1.setChannel(20);
		tv1.setVolume(3);
		tv1.setPower(false);
		System.out.println("tv1의 채널 : " + tv1.getChannel());
		System.out.println("tv1의 볼륨 : " + tv1.getVolume());
		System.out.println("tv1의 전원 on/off 여부 : " + tv1.isPower());
	}

}
