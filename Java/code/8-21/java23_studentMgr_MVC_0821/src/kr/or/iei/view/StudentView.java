package kr.or.iei.view;

import java.util.ArrayList;
import java.util.Scanner;

import kr.or.iei.model.vo.Student;

/*
StudentView
 	- 사용자에게 입력받은 값을 Controller에게 전달.
 	- Controller한테 전달받은 값을 사용자에게 보여줌.
 	
 */
public class StudentView {
	
	Scanner sc;
	
	public StudentView() {
		sc = new Scanner(System.in);
		
	}
	
	public int main() {
		System.out.println("====================학생 관리 프로그램v6====================");
		System.out.println("1. 학생 정보 등록");
		System.out.println("2. 학생 정보 수정");
		System.out.println("3. 학생 정보 삭제");
		System.out.println("4. 학생 정보 전체 출력");
		System.out.println("5. 학생 정보 1명만 출력");
		System.out.println("0. 프로그램 종료");
		System.out.print("선택 > ");
		int menu = sc.nextInt(); //int 값으로 받아서 void가 아니라 int로 반환받아야됨
		
		return menu;
		
	}
	
	public Student insertStudents() {
	
		System.out.println("====================학생 정보 등록====================");
		System.out.print("학생 이름 입력 : ");
		String name = sc.next();
		System.out.print("학생 나이 입력 : ");
		int age = sc.nextInt();
		sc.nextLine();
		System.out.print("학생 주소 입력 : ");
		String addr = sc.nextLine();
		/*
		//v1
		Student student = new Student(name, age, addr);
		
		return student;
		*/
		
		//v2
		return new Student(name, age, addr);
	}
	
	public void CompleteMsg(String str) {
		System.out.println("학생 정보 " + str + "이(가) 완료되었습니다.");
	}
	
	public void printAllStudent(ArrayList<Student> students) {
		System.out.println("====================학생 정보 전체 출력====================");
		System.out.println("이름\t나이\t주소");
		for(int i = 0; i<students.size(); i++) {
			System.out.println(students.get(i).toString());
		}
	}
	
	public String getName(String str) {
		System.out.print(str + "할 학생 이름 입력 : ");
		String name = sc.next();
		return name;	
	}
	
	public void noSrchStudents() {
		System.out.println("대상 학생이 존재하지 않습니다.");
	}
	
	public void printOneStudent(Student student) {
		System.out.println("====================학생 정보 한명 출력====================");
		System.out.println("이름\t나이\t주소");
		System.out.print(student.toString());
	}
	
	public Student updateStudent() {
		System.out.println("====================학생 정보 한명 출력====================");
		System.out.print("수정할 이름 입력 : ");
		String name = sc.next();
		System.out.print("수정할 나이 입력 : ");
		int age = sc.nextInt();
		sc.nextLine();
		System.out.print("수정할 주소 입력 : ");
		String addr = sc.nextLine();
		
		return new Student(name, age, addr);
	}
}
