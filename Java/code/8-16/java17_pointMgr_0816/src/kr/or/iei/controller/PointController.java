package kr.or.iei.controller;

import kr.or.iei.model.vo.Gold;
import kr.or.iei.model.vo.Silver;

import java.util.Scanner;

import kr.or.iei.model.vo.*;

public class PointController implements PointInterface{
	
	/*
	Silver [] sMembers = new Silver [10];
	int sIndex;
	Gold [] gMembers = new Gold[10];
	int gIndex;
	Vip [] vMembers = new Vip[10];
	int vIndex;
	*/
	
	Grade [] members;
	int index;
	Scanner sc;
	
	public PointController() {
		sc = new Scanner(System.in);
		members = new Grade [30];
		index = 0;
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

	@Override
	public void insertMember() {
		System.out.println("========================회원 정보 등록========================");
		System.out.print("등록 등급 입력(silver, gold, vip) : ");
		String grade = sc.next();
		System.out.print("등록 이름 입력 : ");
		String name = sc.next();
		System.out.print("등록 이름 입력 : ");
		int point = sc.nextInt();
		
		switch(grade) {
		case "silver" :
			Silver silver = new Silver();
			silver.setGrade(grade);
			silver.setName(name);
			silver.setPoint(point);
			
			members[index] = silver;
			index++;
			
			break;
		case "gold" :
			Gold gold = new Gold(grade, name, point);
			
			members[index] = gold;
			index++;
			
			break;
		case "vip" :
			members[index++] = new Vip(grade, name, point);
			break;
		default:
			System.out.println("등급을 잘못 입력하셨습니다.");
			return;
		}
		System.out.println("회원 등록이 완료되었습니다.");
	}

	@Override
	public void updateMember() {
		System.out.println("========================회원 정보 수정========================");
		System.out.print("조회할 회원 이름 입력 : ");
		String name = sc.next();
		
		int srchIndex = searchIndex(name);
		
		if(srchIndex == -1) {
			System.out.println("수정할 회원 정보가 존재하지 않습니다.");
		}else {
			System.out.print("수정 등급 입력 : ");
			String mdfGrade = sc.next();
			System.out.print("수정 이름 입력 : ");
			String mdfName = sc.next();
			System.out.println("수정 포인트 입력 : ");
			int mdfPoint = sc.nextInt();
			
			switch (mdfGrade) {
			case "silver":
				Silver silver = new Silver(mdfGrade, mdfName,mdfPoint);
				members[srchIndex] = silver;
				break;
				
			case "gold":
				Gold gold = new Gold(mdfGrade, mdfName,mdfPoint);
				members[srchIndex] = gold;
				break;
				
			case "vip":
				Vip vip = new Vip(mdfGrade, mdfName,mdfPoint);
				members[srchIndex] = vip;
				break;
				
			default:
				System.out.println("등급을 잘못 입력하셨습니다.");
				return;
				
			}
			
		}
		System.out.println("수정이 완료되었습니다.");
		
	}

	@Override
	public void deletMember() {
		System.out.println("========================회원 정보 삭제========================");
		System.out.println("삭제할 회원 이름 입력 : ");
		String name = sc.next();
		
		int srchIndex = searchIndex(name);
		
		if(srchIndex == -1) {
			System.out.println("삭제할 회원 정보가 존재하지 않습니다.");
		} else {
			for(int i = srchIndex; i<index-1; i++) {
				members[i] = members[i+1];
			}
			members[index] = null;
			index--;
			
			System.out.println("정상적으로 삭제 되었습니다.");
		}
	}

	@Override
	public void selectOneMember() {
		System.out.println("========================회원 정보 1명 출력========================");
		System.out.print("조회할 회원 이름 입력 : ");
		String name = sc.next();
		
		int srchIndex = searchIndex(name);
		
		if(srchIndex == -1) {
			System.out.println("회원 정보가 존재하지 않습니다.");
		}else {
			System.out.println("등급\t이름\t포인트\t보너스");
			Grade grade = members[srchIndex];
			System.out.println(grade.toString());
		}
		
		
	}

	@Override
	public void selectAllMember() {
		System.out.println("========================회원 정보 전체 출력========================");
		System.out.println("등급\t이름\t포인트\t보너스");
		
		for(int i=0; i<index; i++) {
			Grade member = members[i];
			
			//불필요한 코드
			/*
			if(member instanceof Silver) {
				Silver silver = (Silver) member;
				System.out.println(silver.toString());
				
			}else if(member instanceof Gold) {
				Gold gold = (Gold)member;
				System.out.println(gold.toString());
				
			}else if(member instanceof Vip) {
				Vip vip = (Vip)member;
				System.out.println(vip.toString());
			}
			*/
			
			//위에 코드 요약버전
			System.out.println(member.toString());
		}
	}
	
	//조회 회원이 몇번째 인덱스에 존재하는지 
	public int searchIndex(String name) {
		for(int i = 0; i<index; i++) {
			if(members[i].getName().equals(name)) {
				return i;
			}
		}
		return -1;
	}
	
	/*
	//이제는 안써도 됨
	public void searchInfo() {
		//어느 객체 배열(Silver, Gold, Vip)에, 몇번째 인덱스
		
		
	}
	*/
}
