package kr.or.iei.point.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

import kr.or.iei.point.model.vo.*;

public class ArrayPointController {

	ArrayList<Grade> grades;
	Scanner sc;
	
	public ArrayPointController() {
		sc = new Scanner(System.in);
		grades = new ArrayList<Grade>();
	}
	
	public void mainMtd() {
		while(true) {
			System.out.println("========================포인트 관리 프로그램V3========================");
			System.out.println("1. 회원 정보 등록");
			System.out.println("2. 회원 정보 수정");
			System.out.println("3. 회원 정보 삭제");
			System.out.println("4. 전체 회원 조회");
			System.out.println("5. 회원 한명 조회");
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 > ");
			int menu = sc.nextInt();
			sc.nextLine();
			
			switch(menu) {
			case 1:
				insertMember();
				break;
			case 2:
				updateMember();
				break;
			case 3:
				deletMember();
				break;
			case 4:
				selectAllMember();
				break;
			case 5:
				selectOneMember();
				break;
			case 0:
				System.out.println("프로그램을 종료합니다.");
				return;
			default:
				break;
			}
		}
	}
	
	public void insertMember() {
		System.out.println("====================회원 정보 등록====================");
		System.out.print("회원 등급 입력(silver, gold, vip) : ");
		String grade = sc.next();
		if(grade.equals("silver") || grade.equals("gold") || grade.equals("vip")) {
			System.out.print("회원 이름 입력 : ");
			String name = sc.next();
			int i = srchIndex(name);
			if(i == -1) {
				System.out.print("포인트 입력 : ");
				int point = sc.nextInt();
				if(grade.equals("silver")) {
					grades.add(new Silver(grade, name, point));	
					System.out.println("입력하신 회원 정보가 등록되었습니다.");
					return;
				} else if(grade.equals("gold")) {
					grades.add(new Gold(grade, name, point));	
					System.out.println("입력하신 회원 정보가 등록되었습니다.");
					return;
				} else if(grade.equals("vip")) {
					grades.add(new Vip(grade, name, point));	
					System.out.println("입력하신 회원 정보가 등록되었습니다.");
					return;
				}
			}else {
				System.out.println("등록된 회원입니다.");
			}
		}
	}
	
	public void updateMember() {
		System.out.println("====================학생 정보 수정====================");
		System.out.print("수정할 이름 입력 : ");
		String name = sc.next();
		int i = srchIndex(name);
		if(i != -1) {
			System.out.print("변경할 등급 입력(silver, gold, vip) : ");
			String newGrade = sc.next();
			if(newGrade.equals("silver") || newGrade.equals("gold") || newGrade.equals("vip")) {
				System.out.print("변경할 이름 입력 : ");
				String newName = sc.next();
				if(srchIndex(newName) != -1) {				
					System.out.println("등록된 회원입니다.");
					return;
				}else {
					System.out.print("변경할 포인트 입력 : ");
					int newPoint = sc.nextInt();
					Grade member = grades.get(i);
		            member.setGrade(newGrade);
		            member.setName(newName);
		            member.setPoint(newPoint);
				}
			}else {
				System.out.println("등급을 잘못 입력하셨습니다.");
			}		
			
		} else {
			System.out.println("존재하지 않는 학생입니다.");					
		}
		System.out.println("수정되었습니다.");
	}
	
	public void deletMember(){
		System.out.println("====================회원 정보 삭제====================");
		System.out.print("삭제할 이름 입력 : ");
		String name = sc.next();
		int i = srchIndex(name);
		if(i != -1) {
			grades.remove(i);
			System.out.println("삭제 되었습니다.");
		} else {
			System.out.println("존재하지 않는 회원입니다.");
		}
	}
	
	public void selectAllMember() {
		System.out.println("====================모든 회원 정보 출력====================");
		System.out.println("등급\t이름\t포인트\t보너스");
		Iterator<Grade> iter = grades.iterator();
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}
	}
	
	public void selectOneMember() {
		System.out.println("====================회원 정보 한명 출력====================");
		System.out.print("출력할 이름 입력 : ");
		String name = sc.next();
		int i = srchIndex(name);
	    if (i != -1) {
	        System.out.println(grades.get(i)); // 찾은 회원 정보 출력
	    } else {
	        System.out.println("해당 회원을 찾을 수 없습니다.");
	    }
	}
	public int srchIndex(String name) {
		for(int i = 0; i<grades.size(); i++) {
			if(grades.get(i).getName().equals(name)) {
				return i;
			}
		}
		return -1;
	}
}
