package kr.or.iei.model.vo;

//추상 클래스를 상속받은 child(자식) 클래스 또한, abstract 키워드를 사용하여 추상 클래스로 정의가 가능하다.
public class Child extends Parent{

	//부모 클래스의 추상 메소드 재정의(오버라이딩) 하지 않으면, 컴파일 오류 발생
	@Override
	public void test() {
		
	}
	
	
}
