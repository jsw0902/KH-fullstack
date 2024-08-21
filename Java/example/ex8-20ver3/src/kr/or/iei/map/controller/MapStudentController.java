package kr.or.iei.map.controller;

import java.util.HashMap;
import java.util.Scanner;

import kr.or.iei.map.model.vo.*;

public class MapStudentController {

	Scanner sc;
	HashMap<String, Student> map;
	
	public MapStudentController() {
		sc = new Scanner(System.in);
		map = new HashMap<String, Student>();
	}
	
	public void mainMtd() {
		while(true) {
			System.out.println("====================학생 관리 프로그램====================");
			System.out.println("1. 학생 정보 등록");
			System.out.println("2. 학생 정보 수정");
			System.out.println("3. 학생 정보 삭제");
			System.out.println("4. 학생 전체 정보 출력");
			System.out.println("5. 학생 한명 정보 출력");
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 > ");
			int menu = sc.nextInt();

			switch (menu) {
				case 1:
					insertStudent();
					break;
				case 2:
					updateStudent();
					break;
				case 3:
					deletStudent();
					break;
				case 4:
					printAllStudent();
					break;
				case 5:
					printOneStudent();
					break;
				case 0:
					System.out.println("프로그램을 종료합니다.");
					return; //메소드 자체를 종료시킨다.
				default:
					System.out.println("메뉴를 잘못 선택하셨습니다.");
					break;
			}// switch
		}//while
	}//method
	
	public void insertStudent() {
		System.out.println("====================학생 정보 등록====================");
		System.out.print("등록할 학생 이름 입력 : ");
		String name = sc.next();
		if(map.containsKey(name)) {
			System.out.println("등록된 회원입니다.");
		} else {
			System.out.print("등록할 학생 나이 입력 : ");
			int age = sc.nextInt();
			sc.nextLine();
			System.out.println("등록할 학생 주소 입력 : ");
			String addr = sc.nextLine();
			
			Student student = new Student(name, age, addr);	
			map.put(name, student);
			System.out.println("학생 정보 등록 완료되었습니다.");
		}
	}
	
	public void updateStudent() {
		System.out.println("====================학생 정보 수정====================");
		System.out.print("수정할 학생 이름 입력 : ");
		String oldName = sc.next();
		if(map.containsKey(oldName)) {
			Student member = map.get(oldName);
			System.out.print("학생 이름 입력 : ");
			String newName = sc.next();
			if(map.containsKey(newName)) {
				System.out.println("등록된 회원입니다.");
			}else {
				System.out.print("등록할 학생 나이 입력 : ");
				int newAge = sc.nextInt();
				sc.nextLine();
				System.out.println("등록할 학생 주소 입력 : ");
				String newAddr = sc.nextLine();
				
				map.remove(oldName);
				member.setName(newName);
        		member.setAge(newAge);
        		member.setAddr(newAddr);
        		map.put(newName, member);	  
        		System.out.println("수정되었습니다.");
        		return;
			}	
		}else {
			System.out.println("존재하지 않는 회원입니다.");
		}
	}
	public void deletStudent() {
		System.out.println("====================학생 정보 삭제====================");
		System.out.print("삭제할 학생 이름 입력 : ");
		String name = sc.next();
		if(map.containsKey(name)) {
			map.remove(name);
			System.out.println("학생 정보 삭제 완료되었습니다.");
		}else {
			System.out.println("존재하지 않는 학생입니다.");
		}
	}
	
	public void printAllStudent() {
		System.out.println("====================학생 정보 전체 출력====================");
		for (String name : map.keySet()) {
	        Student student = map.get(name);
	        System.out.println(student);
	    }
	}
	
	public void printOneStudent() {
		System.out.println("====================학생 정보 출력====================");
		System.out.print("출력할 학생 이름 입력 : ");
		String name = sc.next();
		if(map.containsKey(name)) {
			map.get(name);
		}else {
			System.out.println("존재하지 않는 학생입니다.");
		}
	}
}
