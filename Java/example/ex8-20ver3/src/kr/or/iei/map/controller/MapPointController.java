package kr.or.iei.map.controller;

import java.util.HashMap;
import java.util.Iterator;

import kr.or.iei.map.model.vo.*;
import java.util.Scanner;
import java.util.Set;

public class MapPointController {

	Scanner sc;
	HashMap<String, Grade> map; 
	Set<String> keys;
	
	public MapPointController() {
		sc = new Scanner(System.in);
		map = new HashMap<String, Grade>();
		keys = map.keySet();
	}
	public void mainMtd() {
		while(true) {
			System.out.println("========================포인트 관리 프로그램V5========================");
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
		System.out.println("========================회원 정보 등록========================");
		System.out.print("회원 등급 입력(silver, gold, vip) : ");
		String grade = sc.next();
		if(grade.equals("silver") || grade.equals("gold") || grade.equals("vip")) { //등급 제대로 입력했는지 검사
			System.out.print("회원 이름 입력 : ");
			String name = sc.next();
			if(map.containsKey(name)) {
				System.out.println("등록된 회원입니다.");
			}else {
				System.out.print("회원 포인트 입력 : ");
				int point = sc.nextInt();
				if(grade.equals("silver")) {
					Grade newMember = new Silver(grade, name, point);
					map.put(name, newMember);
				} else if(grade.equals("gold")) {
					Grade newMember = new Gold(grade, name, point);
					map.put(name, newMember);
				} else if(grade.equals("vip")) {
					Grade newMember = new Vip(grade, name, point);
					map.put(name, newMember);
				}
			}
		}else {
			System.out.println("등급을 잘못 입력하셨습니다.");
		}
	}
	
	public void updateMember() {
		System.out.println("========================회원 정보 수정========================");
		System.out.print("회원 이름 입력 : ");
		String oldName = sc.next();
		if (map.containsKey(oldName)) {
	        Grade member = map.get(oldName);
	        // 수정할 정보 입력받기
	        System.out.print("새로운 등급 입력(silver, gold, vip) : ");
	        String newGrade = sc.next();
	        if(newGrade.equals("silver") || newGrade.equals("gold") || newGrade.equals("vip")) {
	        	System.out.print("새로운 이름 입력: ");
	        	String newName = sc.next();
	        	if(map.containsKey(newName)) {
	        		System.out.println("등록된 이름입니다.");
	        	}else {
	        		System.out.print("새로운 포인트 입력: ");
	        		int newPoint = sc.nextInt();
	        		
	        		map.remove(oldName);
	        		member.setGrade(newGrade);
	        		member.setName(newName);
	        		member.setPoint(newPoint);
	        		map.put(newName, member);	  
	        		System.out.println("수정되었습니다.");
	        		return;
	        	}
	        }else {
	        	System.out.println("없는 등급입니다.");
	        }
	        
		}else {
			System.out.println("존재하지 않는 회원입니다.");
		}
	}
	
	public void deletMember() {
		System.out.println("========================회원 정보 삭제========================");
		System.out.print("회원 이름 입력 : ");
		String name = sc.next();
		if(map.containsKey(name)) {
			map.remove(name);
			System.out.println("회원 정보 삭제 완료되었습니다.");
		}else {
			System.out.println("존재하지 않는 회원입니다.");	
		}

	}
	
	public void selectAllMember(){
		System.out.println("========================회원 정보 모두 출력========================");
		Iterator<String> iter = keys.iterator();
		System.out.println("등급\t이름\t포인트\t보너스");
		while(iter.hasNext()) {
			String name = iter.next();
	        Grade member = map.get(name);
	        System.out.println(member.toString());

		}
	}
	public void selectOneMember(){
		System.out.println("========================회원 정보 한명 출력========================");
		System.out.print("회원 이름 입력 : ");
		String name = sc.next();
		if(map.containsKey(name)) {
			map.get(name);
		} else {
			System.out.println("존재하지 않는 회원입니다.");
		}
	}
	
}
