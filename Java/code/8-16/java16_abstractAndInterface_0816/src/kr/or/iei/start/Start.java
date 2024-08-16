package kr.or.iei.start;

import kr.or.iei.model.vo.*;

public class Start {

	public static void main(String[] args) {
		
		//추상 클래스는 객체화 불가
		//Parent parent = new Parent();
		
		//추상 클래스를 상속받은 자식 클래스는 객체화 가능
		Child child = new Child();
		
		//추상 클래스는 참조형 변수 타입으로는 사용이 가능.
		Parent child2 = new Child();
		
		/*
		 추상 메소드 : abstract 키워드로 선언된 몸체가 없는 메소드
		 추상 클래스 : 추상 메소드를 포함한 클래스.
		 
		 특징)
		 1. 추상 클래스는 객체화가 불가능하다.
		 2. 단, 참조형 변수 타입으로는 사용이 가능하다.(다형성)
		 3. 추상 클래스를 상속 받는 자식 클래스는 추상 메소드를 구현해야만 한다.(강제화)
		 4. 위 특징처럼 추상클래스를 사용하는 이유는 객체 생성 방지용, 참조형 변수 타입으로 사용, 상속 관계에서 기능 구현 강제화 등의 목적이 있다.
		 
		  
		 * */
	}

	
}
