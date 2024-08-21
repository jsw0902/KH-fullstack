package kr.or.iei.controller;

import java.util.ArrayList;

import kr.or.iei.model.vo.Student;
import kr.or.iei.view.StudentView;

public class StudentController {
	
	ArrayList<Student> students;
	StudentView view;
	//Scanner sc;
	
	public StudentController() {
		students = new ArrayList<Student>();
		view = new StudentView();
	}
	
	public void mainMtd() {
		while(true) {
			int menu = view.main();
			
			switch(menu) {
			case 1 : //등록
				insertStudents();
				break;
			case 2 : //수정
				updateStudents();
				break;
			case 3 : //삭제
				deleteStudents();
				break;
			case 4 : //전체 출력
				selectAllStudent();
				break;
			case 5 : //한명 출력
				selectOneStudent();
				break;
			case 0 :// 종료
				return;
			default:
				break;
				
			}
		}
	}
	
	//등록
	public void insertStudents() {
		//제일 먼저 수행해야하는 기능?
		Student stu = view.insertStudents();
		
		students.add(stu);
		view.CompleteMsg("등록");
	}
	
	//수정
	public void updateStudents() {
		String name = view.getName("수정");
		int srchIndex = searchIndex(name);
		
		if(srchIndex == -1) {
			view.noSrchStudents();
		}else {
			Student mdfStudent = view.updateStudent();
			students.set(srchIndex, mdfStudent);
			view.CompleteMsg("수정");
		}
		
	}
	
	//삭제
	public void deleteStudents() {
		String name = view.getName("삭제");
		
		int srchIndex = searchIndex(name);
		
		if(srchIndex == -1) {
			view.noSrchStudents();
		} else {
			students.remove(srchIndex);
			view.CompleteMsg("삭제");
		}
	}
	
	//전체 회원 출력
	public void selectAllStudent() {
		view.printAllStudent(students);
	}
	
	public void selectOneStudent() {
		String name = view.getName("조회");
		
		int srchIndex = searchIndex(name);
		
		if(srchIndex == -1) {
			view.noSrchStudents();
		}else {
			Student stu = students.get(srchIndex);
			view.printOneStudent(stu);
		}
	}
	
	public int searchIndex(String name) {
		for(int i = 0; i<students.size(); i++) {
			if(students.get(i).getName().equals(name)) {
				return i;
			}
		}
		return -1;
	}
}
