package kr.or.iei.view;

import java.util.Scanner;
import java.util.ArrayList;
import kr.or.iei.model.vo.Grade;

public class PointView {

Scanner sc;
	
	public PointView() {
		sc = new Scanner(System.in);
	}
	
	public int main() {
		System.out.println("====================회원 관리 프로그램v6====================");
		System.out.println("1. 회원 정보 등록");
		System.out.println("2. 회원 정보 수정");
		System.out.println("3. 회원 정보 삭제");
		System.out.println("4. 회원 정보 전체 출력");
		System.out.println("5. 회원 정보 1명만 출력");
		System.out.println("0. 프로그램 종료");
		System.out.print("선택 > ");
		int menu = sc.nextInt(); //int 값으로 받아서 void가 아니라 int로 반환받아야됨
		
		return menu;
	}
	/*
	public Grade insertMember() {
		System.out.println("====================회원 정보 관리 프로그램v6====================");
		System.out.print("등록할 회원 등급 입력(silver, name, point) : ");
		String grade = sc.next();
		System.out.print("등록할 회원 이름 입력 : ");
		String name = sc.next();
		System.out.print("회원 포인트 입력 : ");
		int point = sc.nextInt();
		
		//return new Grade(grade, name, point);
	*/	
	//}
	public void CompleteMsg(String str) {
		System.out.println("회원 정보 " + str + "이(가) 완료되었습니다.");
	}
}
