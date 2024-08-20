package kr.or.iei.model.vo;

//Sports 클래스를 상속받은 클래스만을 제네릭 타입으로 지정 가능하게.
public class User3 <T extends Sports>{//<>에 상속을 하면 Sports가 부모인 클래스만 T를 사용할 수 있다

	private T data1;
}
