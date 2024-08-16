package kr.or.iei.quiz.model.vo;

public class Cat extends Animal{

	public Cat() {
		
	}
	
	@Override
	public void howToMove() {
		System.out.println("네발로 기어다님");
	}
}
