package kr.or.iei.controller;

import java.util.Scanner;

import kr.or.iei.model.vo.Student;

//학생 정보를 관리(등록, 수정, 삭제, 조회)할 운영 클래스(리모컨)
public class StudentController {
	Student [] students; // 학생 10명의 정보를 저장할 객체 배열
	int index;			 //학생 정보를 입력받으면 배열의 몇번째 인덱스에 할당해야 하는지 기억하기 위한 변수
	Scanner sc;
	
	
	public StudentController() {
		sc = new Scanner(System.in);
		System.out.println("관리할 학생 숫자를 입력하세요");
		int len = sc.nextInt();
		students = new Student[len];
		index = 0; //전역변수는 선언과 동시에 기본값으로 초기화되지만, 명시적으로 초기화
	}
	
	public void mainMtd() {
		while(true) {
			System.out.println("====================학생 관리 프로그램====================");
			System.out.println("1. 학생 정보 등록");
			System.out.println("2. 학생 전체 정보 출력");
			System.out.println("3. 학생 한명 정보 출력");
			System.out.println("4. 학생 정보 수정");
			System.out.println("5. 학생 정보 삭제");
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 > ");
			int sel = sc.nextInt();
			sc.nextLine(); //버퍼에 남아있는 엔터 제거

			switch (sel) {
				case 1:
					insertStudent();
					break;
				case 2:
					printAllStudent();
					break;
				case 3:
					printOneStudent();
					break;
				case 4:
					updateStudent();
					break;
				case 5:
					deletStudent();
					break;
				case 0:
					return; //메소드 자체를 종료시킨다.
				default:
					System.out.println("메뉴를 잘못 선택하셨습니다.");
					break;
			}// switch
		}//while
	}//method
	
	//학생 정보 등록 메소드
	public void insertStudent() {
		System.out.println("=======================학생 정보 등록=======================");
		
		
		/*
		 배열의 길이는 3!
		 
		  1명 등록 후, index : 1
		  2명 등록 후, index : 2
		  3명 등록 후, index : 3
		  
		  더 이상 등록되지 않도록 하기 위해서, index < 배열 길이 조건식 사용.
		 *
		 */
		if(index < students.length) {
			System.out.print("학생 이름 입력 : ");
			String name = sc.next();
			System.out.print("학생 나이 입력 : ");
			int age = sc.nextInt();
			sc.nextLine();
			System.out.print("학생 주소 입력 : ");
			String addr = sc.nextLine();
			
			
			/*//v1
			//학생 1명의 객체 정보 생성
			Student student = new Student();
			student.setName(name);
			student.setAge(age);
			student.setAddr(addr);
			
			
			//객체 배열에 학생 객체 할당
			students[index] = student; //학생 10명의 정보를 저장할 객체 배열에, 생성한 학생 1명의 정보를 할당
			index++; //다음 학생 정보를 등록할 인덱스
			*/
			
			/*
			//v2
			Student student = new Student(name,age, addr);
			students[index] = student;
			index++;
			*/
			
			/*
			//v3
			students[index] = new Student(name, age, addr);
			index++;
			*/
			
			//v4
			//객체 배열에 Student 객체 할당 후, index의 값 1 증가.(인접 연산 먼저 수행하는 후위 연산자)
			students[index++] = new Student(name, age, addr);
			System.out.println("학생 정보 등록이 완료되었습니다.");
		} else {
			System.out.println("정원 초과, 삭제 후, 재등록해주세요");
		}
		
		
	}
	
	//학생 전체 정보 출력 메소드
	public void printAllStudent() {
		System.out.println("=======================학생 정보 전체 출력=======================");
		System.out.println("이름\t나이\t주소");
		
		//for(int i = 0; i<students.length; i++){ //배열의 길이는 10이지만, 현재 학생저보가 3번 인덱스까지 등록되어 있다면, 4번 인덱스 참조 시, 오류 발생
		for(int i=0; i<index; i++) {
			/*
			//v1
			Student student = students[i]; //Student 객체 배열이므로, 배열의 인덱스에 접근하면 Student 객체
			//System.out.println("현재 i 값 : " + i);				//확인용
			//System.out.println("현재 Student : " + student);	//확인용
			
			//System.out.println(student.getName() + "\t" + student.getAge() + "\t" + student.getAddr());
			System.out.println(student.toString());
			*/
			
			//v2
			System.out.println(students[i].toString());
		}
	}
	
	//학생 1명의 정보를 출력하는 메소드
	public void printOneStudent() {
		//전제조건 : 동명이인이 없다는 가정.
		
		System.out.println("===================학생 정보 1명 출력===================");
		System.out.print("조회할 학생 이름 입력 : ");
		String name = sc.next();
		/* 
		//v1
		boolean bool = false;
		for(int i = 0; i<index; i++) {
			Student student = students[i];
			String sudentName = student.getName();
			
			if(name.equals(sudentName)) {
				System.out.println("이름\t나이\t주소");
				System.out.println(student.toString());
				bool = true;
				break; //동명이인이 존재하지 않으니, 찾음 이후의 학생 객체는 비교할 필요가 없음, 반복문 종료
			}
		}
		
		if(!bool) {
			System.out.println("조회하는 학생이 존재하지 않습니다.");
		}
		*/
		/*
		//v2
		Student student = null; //조회한 이름과 동일한 학생 정보를 저장할 변수 
		
		for(int i = 0; i<index; i++) {
			//students[i]는 1명의 학생(Student)이기 때문에, Student의 클래스에 존재하는 getName() 호출 가능.
			//getName()는 반환 자료형이 String이기 때문에, String이 제공하는 equals() 호출 가능.
			if(students[i].getName().equals(name)) {
				student = students[i];
				break;
			}
		}
		
		if(student == null) {
			//위 for(반복문)안에서 동일한 이름이 존재하지 않으면, 처음 student의 null값이 유지됨.
			System.out.println("조회한 학생 정보가 존재하지 않습니다.");
		}else {
			//student가 null이 아닌 경우 -> 학생 정보가 할당되어 있다.
			System.out.println("이름\t나이\t주소");
			System.out.println(student.toString());
		}
		
		*/
		
		
		int searchIndex = searchIndex(name); // 입력받은 이름(name)을 전달하고, 조회된 인덱스를 결과로 반환 받음.

		if (searchIndex == -1) {
			// 학생 정보를 조회하지 못했을 때(배열에 조회한 학생이 없을 때)
			System.out.println("학생 정보를 조회하지 못했습니다.");
		} else {
			// 학생 정보를 조회했을 때(0부터 배열길이 -1)
			System.out.println("이름\t나이\t주소");
			
			//객체 배열에, 조회된 인덱스번째에 존재하는 학생 정보 출력
			System.out.println(students[searchIndex].toString());
		}
		
	}
	
	//학생 정보를 수정하는 메소드 
	public void updateStudent() {
		System.out.println("===================학생 정보 수정===================");
		System.out.print("수정할 학생 이름 입력 : ");
		String name = sc.next();
		
		int searchIndex = searchIndex(name); // -1이거나, 0부터 배열길이 -1이거나
		
		if(searchIndex == -1) {
			//수정할 회원이 객체 배열에 존재하지 않을 때
			System.out.println("수정할 회원 정보가 존재하지 않습니다.");
		} else {
			//수정할 회원이 객체 배열에 searchIndex번째에 존재할 때
			System.out.print("수정할 이름 입력 : ");
			String modifyName = sc.next();
			System.out.print("수정할 나이 입력 : ");
			int modifyAge = sc.nextInt();
			System.out.print("수정할 주소 입력 : ");
			sc.nextLine();
			String modifyaddr = sc.nextLine();
			
			/*
			//객체 배열 -> 1명의 학생정보 꺼내옴. -> setter로 수정 -> 객체 배열에 할당
			//student[searchIndex]로, 추출한 1명의 Student는 주소값이므로, setter() 이후 다시 객체 배열에 할당하지 않아도 수정됨.
			Student student = students[searchIndex];
			student.setName(modifyName);
			student.setAge(modifyAge);
			student.setAddr(modifyaddr);
			*/
			
			
			
			//new Student()를 하면, 새로운 주소값이 생성되고 메모리의 일정 공간을 차지한다.
			//기존에 객체 배열에 존재하던 Studetn()는 Garvage Collector에 의해 자동으로 소멸된다.
			Student modifyStudent = new Student(modifyName, modifyAge, modifyaddr);
			students[searchIndex] = modifyStudent; //새로운 주소값을 가진, Student 객체 재할당.
			
			
			
			System.out.println("정상적으로 수정 되었습니다.");
			
		}
	}
	
	public void deletStudent(){
		System.out.println("===================학생 정보 삭제===================");
		System.out.print("삭제할 학생 이름 입력 : ");
		String name = sc.next();
		
		int searchIndex = searchIndex(name);
		
		if(searchIndex == -1) {
			//삭제할 학생이 배열에 존재하지 않을 때
			//존재하는 희원부터 이후 회원들을 앞으로 한칸씩 이동시켜 초기값을, 삭제 회원이 존재하는 인덱스로 설정
			System.out.println("삭제할 학생 정보가 존재하지 않습니다.");
		} else {
			//삭제할 학생이 배열에 존재할 때
			for(int i = searchIndex; i<index-1; i++) {
				//조건식을 i<index로 설정하면, 배열 길이만큼 학생 정보가 존재할 때, 마지막 반복문에서 오류 발생.
				
				
				//앞으로 한칸씩 이동
				students[i] = students[i+1];
			}
			students[index-1] = null; //앞으로 한칸씩 이동 후, 마지막에 등록되어 있는 학생정보를 null 처리
			index--; //삭제 후, 다음 등록 학생이 정상적인 위치에 등록될 수 있도록 감소 처리 
			
			System.out.println("삭제 처리가 완료되었습니다.");
		}
	}
	
	//찾고자 하는 학생 정보가, 객체 배열의 몇번째 인덱스에 존재하는지
	public int searchIndex(String searchName) {
		//매개변수로 전달받은 이름이, 객체 배열에 몇번째 인덱스에서 존재하는지 찾고, 해당 인덱스 값을 반환.
		
		int searchIndex = -1;//조회되어진 학생 정보가 배열에 몇번째 인덱스에 존재하는지 저장할 변수
		
		for(int i = 0; i<index; i++) {
			Student student = students[i];
			if(student.getName().equals(searchName)) {
				searchIndex = i;
			}
		}
		
		return searchIndex;
	}
}
