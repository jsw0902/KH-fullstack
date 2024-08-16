package kr.or.iei.start;
import kr.or.iei.controller.*;

public class Start {

	public static void main(String[] args) {
		/*
		 * 프로젝트명 : java11_pointMgr
		 * 
		 * 프로그램 요구사항) 회원 등급별 포인트 관리 프로그램을 개발하려고 한다. 등급은 Silver가 존재하며, 등급에 대한 회원 정보는
		 * 등급(grade), 이름(name), 포인트(point), 보너스(bonus)가 존재한다. 
		 * 또한, Silver 등급의 보너스(bonus)는 포인트 * 0.02로 선정한다. 
		 * 이 프로그램의 기능은 정보 등록, 정보 수정, 정보 삭제, 전체 회원 출력, 회원 1명 출력의 기능이
		 * 존재한다.
		 * 
		 * 
		 * grade : String 
		 * name : String 
		 * point : int
		 * 
		 * 클래스명 : Silver 
		 * 패키지 : kr.or.iei.model.vo 
		 * 엠버변수 : grade, name, point 
		 * 생성자 : 기본 생성자, 매개변수 있는 생성자 +getter setter toString
		 * 
		 * 
		 * 클래스명 : PointController 
		 * 패키지 : kr.or.iei.controller 
		 * 엠버변수 : 회원 10명을 관리할 객체 배열, 배열관리용 int형 index 
		 * 변수 메소드 : 메인진행 메뉴, 정보 등록, 정보 수정, 정보 삭제, 전체 회원 출력, 회원 1명 출력, 회원 검색 
		 * 생성자 : 기본 생성자
		 * 
		 * 시스템 요구사항) 
		 * 1. 정보 입력 시, 1명의 회원 정보만 입력받으며 입력 정보는 등급, 이름, 포인트를 입력받는다. 
		 * 2. 정보 등록 시,동일한 이름을 가진 정보가 객체 배열에 존재하는지 중복 체크를 하고, 중복된 회원 존재 시 등록 불가 
		 * 3. 정보 출력 시, 등급, 이름, 포인트, 보너스포인트 총 4가지 정보를 출력한다. 
		 * 4. 보너스 포인트는 포인트에 2%로 적용한다. 보너스 포인트는 회원에 종속되지 않고,등급별 포인트에 종속된다. 
		 * 5. 회원 1명 출력, 정보 수정, 정보 삭제 등의 기능은 이름을 입력 받아 처리한다.
		 * 
		 */
		PointController pc = new PointController();
		pc.mainMtd();
	}

}
