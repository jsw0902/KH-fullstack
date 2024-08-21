package kr.or.iei.point.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;
import kr.or.iei.point.model.vo.*;

public class ArrayStudentController {
	ArrayList<Student> students;
	Scanner sc;
	
	public ArrayStudentController() {
		sc = new Scanner(System.in);
		students = new ArrayList<Student>();
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
		System.out.print("등록할 이름 입력 : ");
		String name = sc.next();
		int i = srchIndex(name);
		if(i == -1) {
			System.out.print("나이 입력 : ");
			int age = sc.nextInt();
			sc.nextLine();
			System.out.print("주소 입력 : ");
			String addr = sc.nextLine();
			students.add(new Student(name, age, addr));	
			System.out.println("입력하신 학생 정보가 등록되었습니다.");
		}else {
			System.out.println("등록된 회원입니다.");
		}
	}
	
	public void updateStudent() {
		System.out.println("====================학생 정보 수정====================");
		System.out.print("수정할 이름 입력 : ");
		String name = sc.next();
		int i = srchIndex(name);
		if(i != -1) {
			System.out.print("이름 입력 : ");
			String newName = sc.next();
			System.out.print("나이 입력 : ");
			int newAge = sc.nextInt();
			sc.nextLine();
			System.out.print("주소 입력 : ");
			String newAddr = sc.nextLine();
			
			students.get(i).setName(newName);
			students.get(i).setAge(newAge);
			students.get(i).setAddr(newAddr);
		} else {
			System.out.println("존재하지 않는 학생입니다.");					
		}
		System.out.println("수정되었습니다.");
	}
	
	public void deletStudent() {
		System.out.println("====================학생 정보 삭제====================");
		System.out.print("삭제할 이름 입력 : ");
		String name = sc.next();
		int i = srchIndex(name);
		if(i != -1) {
			students.remove(i);
			System.out.println("삭제 되었습니다.");
		} else {
			System.out.println("존재하지 않는 회원입니다.");
		}
	}
	
	public void printAllStudent() {
		System.out.println("====================모든 학생 정보 출력====================");
		System.out.println("이름\t나이\t주소");
		Iterator<Student> iter = students.iterator();
		while(iter.hasNext()) {
			System.out.print(iter.next());
		}
	}
	
	public void printOneStudent() {
		System.out.println("====================학생 정보 한명 출력====================");
		System.out.print("출력할 이름 입력 : ");
		String name = sc.next();
		int i = srchIndex(name);
		if(i != -1) {
			Student student = students.get(i);
			System.out.println(student.getName() + "\t" + student.getAge() + "\t" + student.getAddr());
		} else {
			System.out.println("존재하지 않는 학생입니다.");	
		}
	}
	
	public int srchIndex(String name) {
		for(int i = 0; i<students.size(); i++) {
			if(students.get(i).getName().equals(name)) {
				return i;
			}
		}
		return -1;
	}
}
