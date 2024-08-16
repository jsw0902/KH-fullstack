package kr.or.iei.controller;

import java.util.Scanner;
import kr.or.iei.model.vo.Silver;



public class PointController {
	
	//작성해주신 코드 
	private Silver [] silverMembers;
	private Scanner sc;
	private int index;
	
	public PointController(){
		silverMembers = new Silver[10];
		sc = new Scanner(System.in);
		index = 0;
	}
	
	public void mainMtd() {
		while(true) {
			System.out.println("====================회원 관리 프로그램====================");
			System.out.println("1. 회원 정보 등록");
			System.out.println("2. 회원 정보 수정");
			System.out.println("3. 회원 정보 삭제");
			System.out.println("4. 회원 전체 정보 출력");
			System.out.println("5. 회원 한명 정보 출력");
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 > ");
			int menu = sc.nextInt();
			
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
				allMemberSelect();
				break;
			case 5:
				oneMemberSelect();
				break;
			case 0: //프로그램 종료
				return; //현재 메소드를 종료 (return 자체가 종료를 시키는 것 반환할게 있으면 반환까지 해줌)
			default:
				System.out.println("메뉴를 잘못 선택하셨습니다.");
				break;
			}
		}
	}
	
	public void insertMember() {
		System.out.println("=======================회원 정보 등록=======================");
		System.out.print("이름 입력 : ");
		String name = sc.next();
		
		//중복 체크 (체크 이전에, 객체 생성 또는 등록을 진행하고 중복된 정보가 존재하면 앞의 로직이 무의미 )
		int searchIndex = searchMember(name);
		
		if(searchIndex == -1) {
			//객체 배열에 입력한 이름을 가진 Silver 객체가 없을 때
			System.out.print("등급 입력 : ");
			String grade = sc.next();
			System.out.print("포인트 입력 : ");
			int point = sc.nextInt();
			
			Silver silver = new Silver(grade,name,point);
			silverMembers[index] = silver;
			index++;
			System.out.println("회원 정보 등록 완료");
		}else {
			//객체 배열에 입력한 이름을 가진 Silver 객체가 존재할 때
			System.out.println("중복된 이름을 가진 회원 정보가 존재합니다.");
		}
		
	}
	
	public int searchMember(String searchName) {
		for(int i = 0; i<index; i++) {
			String findName = silverMembers[i].getName();
			if(findName.equals(searchName)) {
				return i;
			}
		}
		return -1;
	}
	
	public void updateMember() {
		System.out.println("===================회원 정보 수정===================");
		System.out.print("수정할 회원 이름 입력 : ");
		String name = sc.next();
		
		int searchIndex = searchMember(name);
		
		if(searchIndex == -1) { // 수정할 회원의 정보가 없을 때
			System.out.println("수정할 회원 정보가 존재하지 않습니다.");
		} else { 
			System.out.print("수정할 이름 입력 : ");
			String modifyName = sc.next();
			System.out.print("수정할 포인트 입력 : ");
			int modifyPoint = sc.nextInt();
			
			Silver silver = silverMembers[searchIndex];
			silver.setName(modifyName);
			silver.setPoint(modifyPoint);
			
			System.out.println("정상적으로 수정 되었습니다.");
		}
	}
	
	public void deletMember() {
		System.out.println("===================회원 정보 삭제===================");
		System.out.print("삭제할 학생 이름 입력 : ");
		String name = sc.next();
		
		int searchIndex = searchMember(name);
		
		if(searchIndex == -1) { 
			//삭제할 회원이 존재하지 않음. -> 삭제 불가
			System.out.println("삭제할 회원 정보가 존재하지 않습니다.");
		}else {
			//삭제할 회원 존재 -> 삭제 가능
			
			/*
			 * 1) 앞으로 한칸씩 이동
			 * 2) 마지막꺼 null 처리
			 * 3) 현재 index의 값을 1처리 
			 */
			
			for(int i = searchIndex; i<index-1; i++) {
				silverMembers[i] = silverMembers[i+1];
			}
			silverMembers[index-1] = null;
			index--;
			
			System.out.println("삭제 되었습니다.");
		}
	}
	
	public void allMemberSelect() {
		System.out.println("=======================회원 정보 전체 출력=======================");
		System.out.println("등급\t이름\t포인트\t보너스포인트");
		
		for(int i=0; i<index; i++) {
			Silver silver = silverMembers[i];
			System.out.println(silver.toString());
		}
	}
	
	public void oneMemberSelect() {
		System.out.println("=======================회원 정보 출력=======================");
		System.out.print("조회할 회원 이름 입력 : ");
		String name = sc.next();
		
		int searchIndex = searchMember(name);
		
		if(searchIndex == -1) {
			System.out.println("출력할 회원 정보가 존재하지 않습니다.");
		} else {
			System.out.println("등급\t이름\t포인트\t보너스 포인트");
			Silver silver = silverMembers[searchIndex];
			System.out.println(silver.toString());
		}
	}
	/*
	//직접 작성한 코드
	Scanner sc;
	Silver [] silverClient;
	int index;
	
	public PointController(){
		sc = new Scanner(System.in);
		silverClient = new Silver[10];
		index = 0;
	}
	
	public void mainMtd() {
		while(true) {
			System.out.println("====================회원 관리 프로그램====================");
			System.out.println("1. 회원 정보 등록");
			System.out.println("2. 회원 정보 수정");
			System.out.println("3. 회원 정보 삭제");
			System.out.println("4. 회원 전체 정보 출력");
			System.out.println("5. 회원 한명 정보 출력");
			System.out.println("6. 회원 검색");
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 > ");
			int cont = sc.nextInt();
			sc.nextLine();
			switch(cont) {
			case 1:
				insertClient();
				break;
			case 2:
				updateClient();
				break;
			case 3:
				deletClient();
				break;
			case 4:
				printAllClient();
				break;
			case 5:
				printOneClient();
				break;
			case 6:
				searchClient();
				break;
			case 0:
				return;
			default:
				System.out.println("메뉴를 잘못 선택하셨습니다.");
				break;
			}
		}
	}
	public void insertClient() {
		System.out.println("=======================회원 정보 등록=======================");
		
		if(index < silverClient.length) {
			System.out.print("회원 등급 입력 : ");
			String grade = sc.next();
			sc.nextLine();
			System.out.print("회원 이름 입력 : ");
			String name = sc.nextLine();
			
			int searchIndex = searchIndex(name);
			
			if(searchIndex == -1) { //입력한 이름으로 등록된 회원이 없을 시
				System.out.print("회원 포인트 입력 : ");
				int point = sc.nextInt();
				silverClient[index++] = new Silver(grade, name, point); //등록 후 index값 증가 시킴
				System.out.println("회원 정보 등록이 완료되었습니다");
			}else {
				System.out.println("등록된 이름입니다. 다른 이름을 입력해주세요");				
			}
		} else {
			System.out.println("정원 초과, 삭제 후, 재등록해주세요");
		}
	}
	
	public void updateClient() {
		System.out.println("===================회원 정보 수정===================");
		System.out.print("수정할 회원 이름 입력 : ");
		String name = sc.next();
		
		int searchIndex = searchIndex(name);
		
		if(searchIndex == -1) { // 수정할 회원의 정보가 없을 때
			System.out.println("수정할 회원 정보가 존재하지 않습니다.");
		} else { 
			System.out.print("수정할 등급 입력 : ");
			String modifygrade = sc.next();
			sc.nextLine();
			System.out.print("수정할 이름 입력 : ");
			String modifyName = sc.nextLine();
			System.out.print("수정할 포인트 입력 : ");
			int modifyPoint = sc.nextInt();
			
			Silver modifySilver = new Silver(modifygrade, modifyName, modifyPoint); //수정할 것 입력 받은 후 modifySilver 에 저장
			silverClient[searchIndex] = modifySilver; //searchIndex에 있던 내용물을 modifySilver로 변경 
			
			System.out.println("정상적으로 수정 되었습니다.");
		}
	}
	
	public void deletClient() {
		System.out.println("===================회원 정보 삭제===================");
		System.out.print("삭제할 학생 이름 입력 : ");
		String name = sc.next();
		
		int searchIndex = searchIndex(name);
		
		if(searchIndex == -1) { //
			System.out.println("삭제할 회원 정보가 존재하지 않습니다.");
		}else {
			for(int i = searchIndex; i<index-1; i++) {
				silverClient[i] = silverClient[i+1];
			}
			silverClient[index-1] = null;
			index--;
			System.out.println("입력하신 회원 정보 삭제 처리가 완료되었습니다.");
		}
	}
	public void printAllClient() {
		System.out.println("=======================회원 정보 전체 출력=======================");
		System.out.println("등급\t이름\t포인트\t보너스포인트");
		
		for(int i=0; i<index; i++) {
			System.out.println(silverClient[i].toString());
		}
	}
	
	public void printOneClient() {
		System.out.println("=======================회원 정보 출력=======================");
		System.out.print("출력할 회원 이름 입력 : ");
		String name = sc.next();
		
		int searchIndex = searchIndex(name);
		
		if(searchIndex == -1) {
			System.out.println("출력할 회원 정보가 존재하지 않습니다.");
		} else {
				System.out.println("등급\t이름\t포인트\t보너스 포인트");
				System.out.println(silverClient[searchIndex].toString());
		}
	}
	
	public void searchClient() {
		System.out.println("=======================회원 검색=======================");
		System.out.print("검색할 회원 이름을 입력해주세요 : ");
		String name = sc.next();
		
		int searchIndex = searchIndex(name);
		
		if(searchIndex == -1) {
			System.out.println("검색할 회원에 정보가 없습니다.");
		} else {
			System.out.println("검색하신 " + name + " 님은 회원 등록이 되어있습니다.");
		}
	}
	
	//찾고자 하는 회원 정보 서치 및 동명이인 등록 막기
	public int searchIndex(String searchName) {
		int searchIndex = -1; //조회되어진 학생 정보가 배열에 몇번째 인덱스에 존재하는지 저장할 변수
		
		for(int i = 0; i<index; i++) {
			Silver silver = silverClient[i];
			if(silver.getName().equals(searchName)) {
				searchIndex = i;
			}
		}
		return searchIndex;
	}
	*/
}
