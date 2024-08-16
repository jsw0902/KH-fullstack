package kr.or.iei.chap01.start;

import kr.or.iei.chap01.model.vo.Child;
import kr.or.iei.chap01.model.vo.Parent;

public class Start {

	public static void main(String[] args) {
		System.out.println("======================Parent=========================");
		
		Parent parent = new Parent(30000000 , "자이아파트", "엔비디아");
		System.out.println(parent.getMoney());
		System.out.println(parent.getApart());
		System.out.println(parent.getStock());
		
		System.out.println("======================Child=========================");
		
		Child child = new Child();
		child.setMoney(1000000000);
		child.setApart("주공아파트");
		child.setStock("애플");
		System.out.println(child.getMoney());
		System.out.println(child.getApart());
		System.out.println(child.getStock());

		Child child2 = new Child(77777777, "설악아파트", "메타");
		
		Child child3 = new Child(77777777, "설악아파트", "메타",595959);
		
		parent.printMsg();
		child.printMsg();
		
		child.getBonus();
		
	}
	/*
	 * 상속 : 부모 클래스의 멤버를 자식 클래스에서 물려받아 사용한다.
	 * 
	 * [표현법]
	 * 
	 * public class 자식클래스명 extends 부모클래스명 {
	 * }
	 * 
	 * 특징)
	 * 1. 자바에서는 단일 속성만 가능하다.(1개의 클래스만을 상속 받을 수 있음.)
	 * 2. 상속 시, 생성자는 상속되지 않는다. (자식 클래스 생성자를 직접 작성해야 함.)
	 * 3. 모든 멤버를 상속받더라도, 부모 클래스의 private 멤버에는 직접 접근이 불가능하다.
	 * 4. protected 접근제어지시자로 선언된 멤버에는 자식 클래스에서 접근 가능(후손 관계)
	 * 5. 부모 클래스를 지칭하는 키워드 -> super
	 * 6. 상속받은 자식 클래스의 객체 생성 시, 부모 클래스의 생성자가 먼저 호출된다.
	 * 7. 상속받은 멤버 메소드를 재정의 하는 것을, '오버라이딩'이라고 한다. -> @Override
	 * 8. 오버라이딩 조건 및 주의 사항
	 * 	  8-1) 부모 클래스에 정의된 메소드의 반환형, 메소드명, 매개변수(갯수, 타입, 순서)가 모두 일치해야 한다.
	 * 	  8-2) 재정의된 메소드의 접근제어지시자는 다르게 선언 가능하지만, 부모 클래스에 정의된 접근제어지시자와 같거나, 범위가 더 넓어야 한다.
	 *    8-3) @Override 이노테이션 키워드를 작성하지 않아도 재정의 가능하지만, 작성하지 않고 메소드의 명칭을 다르게 작성할 경우
	 *    	   별도의 메소드 선언으로 인식한다.
	 * 9. 모든 클래스는 Object 클래스의 후손 클래스이다. extends 키워드를 사용하지 않고 아무것도 상속 받지 않더라도 Object 클래스를 상속받은 것.
	 * 
	 */

}
