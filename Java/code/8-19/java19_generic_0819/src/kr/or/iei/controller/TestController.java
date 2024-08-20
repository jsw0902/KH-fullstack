package kr.or.iei.controller;

import kr.or.iei.model.vo.*;

public class TestController {

	//전달되는 매개변수 User
	//User는 제네릭 변수를 포함한 클래스.
	//User의 제네릭 변수 타입을 Baseball 또는 상위 클래스로 제한.
	//BaseBall or Sports
	public void testMtd(User<? super Baseball> user) {
		
	}
}
