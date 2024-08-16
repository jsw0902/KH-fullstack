package kr.or.iei.start;
import kr.or.iei.controller.PointController;

public class Start {

	public static void main(String[] args) {
		/*
		 1) 프로그램 요구사항
		 
		 - 회원 1명에 대한 등급, 이름, 포인트를 관리할 프로그램
		 - 등급은 Silver, Gold, Vip로 분류
		 - 각 등급별 총 10명의 회원 정보 관리
		 - 보너스는 각 등급별 자동, (silver는 2%, Gold는 5%, Vip는 7%)
		 - 프로그램 기능은 회원 등록, 회원 수정, 회원 삭제, 전체 회원 조회, 1명 회원 조회
		 - 동명이인은 존재하지 않는다.
		 */
		
		PointController pc = new PointController();
		pc.mainMtd();
	}

}
