package kr.or.iei.list.controller;
import java.util.ArrayList;
import java.util.Scanner;
import kr.or.iei.list.model.vo.Student;

public class StudentController {
	ArrayList<Student> students;
	Scanner sc;
	//int index;
	
	public StudentController() {
		sc = new Scanner(System.in);
		students = new ArrayList<Student>();
		//index = 0;
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
		System.out.println("========================= 학생 정보 등록 =========================");
		System.out.print("학생 이름 입력 : ");
		String name = sc.next();
		System.out.print("학생 나이 입력 : ");
		int age = sc.nextInt();
		sc.nextLine();
		System.out.print("학생 주소 입력 : ");
		String addr = sc.nextLine();
		
		students.add(new Student(name,age,addr));
		
		
		/*
		Student student = new Student(name, age, addr);
		students.add(student);
		*/
	}
	
	public void updateStudent() {
	    System.out.println("========================= 학생 정보 수정 =========================");
	    System.out.print("수정할 학생 이름 입력 : ");
	    String name = sc.next();

	    // 찾은 학생의 인덱스
	    int index = findStudentIndexByName(name);
	    if (index != -1) {
	    	System.out.print("변경할 이름 입력 :");
	    	String newName = sc.next();
	        System.out.print("변경할 나이 입력 : ");
	        int newAge = sc.nextInt();
	        sc.nextLine();
	        System.out.print("변경할 주소 입력 : ");
	        String newAddr = sc.nextLine();

	        students.get(index).setName(newName);
	        students.get(index).setAge(newAge);
	        students.get(index).setAddr(newAddr);
	        System.out.println("학생 정보가 수정되었습니다.");
	    } else {
	        System.out.println("해당 학생이 없습니다.");
	    }
	}

	
	public void deletStudent() {
	    System.out.println("========================= 학생 정보 삭제 =========================");
	    System.out.print("삭제할 학생 이름 입력 : ");
	    String name = sc.next();

	    int index = findStudentIndexByName(name);
	    if (index != -1) {
	        students.remove(index);
	        System.out.println("학생 정보가 삭제되었습니다.");
	    } else {
	        System.out.println("해당 학생이 없습니다.");
	    }
	}
	
	public void printAllStudent() {
		System.out.println("이름\t나이\t주소");
		
		System.out.println(students.toString());
	}
	
	public void printOneStudent() {
		System.out.println("========================= 학생 정보 한명 출력 =========================");
		System.out.print("정보 출력할 학생 이름 입력 : ");
		String name = sc.next();
		 int index = findStudentIndexByName(name);
		    if (index != -1) {
		    	Student student = students.get(index);
		        System.out.println("이름\t나이\t주소");
		        System.out.println(student);
		    }else {
		    	 System.out.println("해당 학생이 없습니다.");
		    }
	}
	public int findStudentIndexByName(String name) {
	    for (int i = 0; i < students.size(); i++) {
	        if (students.get(i).getName().equals(name)) {
	            return i;
	        }
	    }
	    return -1;
	}
}
