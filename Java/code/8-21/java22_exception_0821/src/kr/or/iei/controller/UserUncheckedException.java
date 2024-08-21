package kr.or.iei.controller;

/*

사용자 정의 예외 : 컴파일 및 실행(런타임) 중, 예외가 발생하지 않지만 논리적인(비즈니스적인) 오류가 발생했을 때 강제로 예외를 발생시키기 위한 용도로 작성
 - UncheckedException에 대한 사용자 정의 예외 정의 시, RuntimeException을 상속받아야 함.
 */
public class UserUncheckedException extends RuntimeException{
	public UserUncheckedException() {
		super();
	}
	public UserUncheckedException(String msg) {
		super(msg);
	}
}
