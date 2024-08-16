package kr.or.iei.controller;

import java.util.Scanner;

import kr.or.iei.model.vo.*;


public class PointController {
	//실버 등급 회원 10명을 관리할 객체 배열
	Silver [] sMembers;
	int sIndex;
	
	//골드 등급 회원 10명을 관리할 객체 배열
	Gold [] gMembers;
	int gIndex;
	
	//vip 등급 회원 10명을 관리할 객체 배열
	Vip [] vMembers;
	int vIndex;
	//입력 받기 위한 Scanner 전역 객체
	Scanner sc;
	
	String srchGrade = "";
	
	public PointController() {
		sMembers = new Silver[10]; //new는 주소값
		sIndex = 0;
		gMembers = new Gold[10];
		gIndex = 0;
		vMembers = new Vip[10];
		vIndex = 0;
		
		sc = new Scanner(System.in);
		
	}
	
	public void mainMtd() {
		while(true) {
			System.out.println("=====================포인트 관리 프로그램v2=====================");
			System.out.println("1. 회원 정보 등록");
			System.out.println("2. 회원 정보 수정");
			System.out.println("3. 회원 정보 삭제");
			System.out.println("4. 전체 회원 출력");
			System.out.println("5. 회원 한명 출력");
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
				allMemberSelect();
				break;
			case 5:
				oneMemberSelect();
				break;
			case 0:
				System.out.println("프로그램을 종료합니다.");
				return;
			default:
				System.out.println("잘못 입력하셨습니다.");
				break;
				
			}
			
		}
	}
	
	//회원 정보 등록 메소드
	public void insertMember() {
		System.out.println("===========================회원 정보 등록===========================");
		System.out.print("등급 입력(silver, gold, vip) : ");
		String grade = sc.next();
		System.out.print("이름 입력 :");
		String name = sc.next();
		System.out.print("포인트 입력 : ");
		int point = sc.nextInt();
		
		switch(grade) {
		case "silver" :
			//1명의 Silver 객체 회원 정보 생성
			Silver silver = new Silver();
			silver.setGrade(grade);
			silver.setName(name);
			silver.setPoint(point);
			
			//Silver 객체 배열에 객체 삽입
			sMembers[sIndex] = silver;
			
			//다음 Silver 객체가 들어갈 인덱스의 값을 1 증가
			sIndex++;
			
			break;
		case "gold" :
			//1명의 Silver 객체 회원 정보 생성
			gMembers[gIndex] = new Gold(grade, name, point);
			gIndex++;
			break;
		case "vip" :
			vMembers[vIndex++] = new Vip(grade, name, point);
			break;
		default :
			System.out.println("등급을 잘못 입력하셨습니다.");
			return; // 아래 등록 완료 문구가 출력되지 않고, 메소드가 종료됨
		}
		System.out.println("회원 정보 등록이 완료되었습니다.");
		
	}
	
	//전체 회원을 출력하는 메소드
	public void allMemberSelect() {
		System.out.println("===========================전체 회원 출력===========================");
		System.out.println("등급\t이름\t포인트\t보너스");
		
		for(int i = 0; i<sIndex; i++) {
			Silver silver = sMembers[i];
			System.out.println(silver.toString());
		}
		for(int i = 0; i<gIndex; i++) {
			Gold gold = gMembers[i];
			System.out.println(gold.toString());
		}
		for(int i = 0; i<vIndex; i++) {
			System.out.println(vMembers[i].toString());
		}
	}
	
	public void oneMemberSelect() {
		System.out.println("===========================전체 회원 출력===========================");
		System.out.print("조회할 회원 이름 입력 : ");
		String name = sc.next();
		
		SearchInfo srchInfo = searchInfo(name);
		
		if(srchInfo == null) { //참조자료형의 빈 값을 의미하는 null. srchInfo가 null이라는건, 하기 메소드에서 정보를 찾지 못했을 때
			System.out.println("조회할 회원의 정보가 없습니다.");
		} else { //원하는 정보가 객체 배열에 존재할 때
			switch(srchInfo.getSrchGrade()) {
			case "silver" :
				System.out.println("등급\t이름\t포인트\t보너스");
				Silver silver = sMembers[srchInfo.getSrchIndex()];
				System.out.println(silver.toString());
				break;
			case "gold" :
				System.out.println("등급\t이름\t포인트\t보너스");
				Gold gold = gMembers[srchInfo.getSrchIndex()];
				System.out.println(gold.toString());
				break;
			case "vip" :
				System.out.println("등급\t이름\t포인트\t보너스");
				Vip vip = vMembers[srchInfo.getSrchIndex()];
				System.out.println(vip.toString());
				break;
			default :
				System.out.println("조회 등급 오류");
				break;
			}
		}
		/*
		//전역변수 사용한 버전
		int srchIndex = searchIndex(name);
		
		if(srchIndex == -1) {
			System.out.println("조회할 회원의 정보가 없습니다.");
		} else {
			switch(srchGrade) {
			case "silver" :
				System.out.println("등급\t이름\t포인트\t보너스");
				Silver silver = sMembers[srchIndex];
				System.out.println(silver.toString());
				break;
			case "gold" :
				System.out.println("등급\t이름\t포인트\t보너스");
				Gold gold = gMembers[srchIndex];
				System.out.println(gold.toString());
				break;
			case "vip" :
				System.out.println("등급\t이름\t포인트\t보너스");
				Vip vip = vMembers[srchIndex];
				System.out.println(vip.toString());
				break;
			default :
				System.out.println("조회 등급 오류");
				break;
			}
		}
		/*
		for(int i = 0; i<sIndex; i++) {
			String silverName = sMembers[i].getName();
			if(silverName.equals(name)) {
				System.out.println("등급\t이름\t포인트\t보너스");
				System.out.println(sMembers[i].toString());
				return;
				//break;로 처리하면,찾아도 Gold 배열, Vip 배열을 탐색함. return으로 현재 메소드를 종료시켜, 더 이상 실행이 진행되지 않게 처리.
			}
		}
		for(int i = 0; i<gIndex; i++) {
			String goldName = gMembers[i].getName();
			if(goldName.equals(name)) {
				System.out.println("등급\t이름\t포인트\t보너스");
				System.out.println(gMembers[i].toString());
				return;
			}
		}
		for(int i = 0; i<vIndex; i++) {
			String vipName = vMembers[i].getName();
			if(vipName.equals(name)) {
				System.out.println("등급\t이름\t포인트\t보너스");
				System.out.println(vMembers[i].toString());
				return;
			}
		}*/
	}
	public void deletMember() {
		System.out.println("===========================회원 정보 삭제===========================");
		System.out.print("삭제할 회원 이름 입력 : ");
		String name = sc.next();
		
		SearchInfo srchInfo = searchInfo(name); //어느 객체 배열에 존재하고, 몇번째 인덱스에 위치하는지 반환
		
		if(srchInfo != null) {
			//존재할 때 삭제
			/*
			 * 1) 앞으로 한칸씩 이동
			 * 2) 마지막 객체 null 처리
			 * 3) index값 1 감소
			 */
			switch(srchInfo.getSrchGrade()) {
			case "silver" :
				for(int i = srchInfo.getSrchIndex(); i<sIndex-1; i++) {
					sMembers[i] = sMembers[i+1];
				}
				sMembers[sIndex-1] = null;
				sIndex--;
				break;
			case "gold" :
				for(int i = srchInfo.getSrchIndex(); i<gIndex-1; i++) {
					gMembers[i] = gMembers[i+1];
				}
				gMembers[gIndex-1] = null;
				gIndex--;
				break;
			case "vip" :
				for(int i = srchInfo.getSrchIndex(); i<vIndex-1; i++) {
					vMembers[i] = vMembers[i+1];
				}
				vMembers[vIndex-1] = null;
				vIndex--;
				break;
			default : 
				System.out.println("조회 등급 오류..");
				break;
			}
			
		}else {
			//존재하지 않을 때, srchInfo가 null일 때
			System.out.println("삭제할 회원이 존재하지 않습니다.");
		}
	}
	
	//회원 정보를 수정하는 메소드
	public void updateMember() {
		System.out.println("===========================회원 정보 수정===========================");
		System.out.print("수정할 회원 이름 입력 : ");
		String name = sc.next();
		
		SearchInfo srchInfo = searchInfo(name);
		
		if(srchInfo != null) {
			//수정할 회원이 존재할 때
			System.out.print("변경 등급 입력 : ");
			String mdfGrade = sc.next();
			System.out.print("변경 이름 입력 : ");
			String mdfName = sc.next();
			System.out.print("변경 포인트 입력 :");
			int mdfPoint = sc.nextInt();
			
			//기존 객체 삭제
			switch(srchInfo.getSrchGrade()) {
			case "silver" :
				for(int i = srchInfo.getSrchIndex(); i<sIndex-1; i++) {
					sMembers[i] = sMembers[i+1];
				}
				sMembers[sIndex-1] = null;
				sIndex--;
				break;
			case "gold" :
				for(int i = srchInfo.getSrchIndex(); i<gIndex-1; i++) {
					gMembers[i] = gMembers[i+1];
				}
				gMembers[gIndex-1] = null;
				gIndex--;
				break;
			case "vip" :
				for(int i = srchInfo.getSrchIndex(); i<vIndex-1; i++) {
					vMembers[i] = vMembers[i+1];
				}
				vMembers[vIndex-1] = null;
				vIndex--;
				break;
			default :
				System.out.println("조회 등급 오류..");
				break;
			}
			
			//변경할 등급에 따른 객체 생성 및 객체 배열에 삽입
			switch(mdfGrade) {
			case "silver" :
				Silver silver = new Silver();
				silver.setGrade(mdfGrade);
				silver.setName(mdfName);
				silver.setPoint(mdfPoint);
				sMembers[sIndex] = silver;
				sIndex++;
				break;
			case "gold" :
				Gold gold = new Gold(mdfGrade,mdfName,mdfPoint);
				gMembers[gIndex] = gold;
				gIndex++;
				break;
			case "vip" :
				vMembers[vIndex++] = new Vip(mdfGrade, mdfName, mdfPoint);
				break;
			default :
				System.out.println("변경 등급 오류...");
				break;
			}
		}else {
			//수정할 회원이 존재하지 않을 때
			System.out.println("수정할 회원 정보가 존재하지 않습니다.");
		}
	}
	
	public int searchIndex(String name) {
		int srchIndex = -1;
		srchGrade = "";
		for(int i = 0; i<sIndex; i++) {
			if(sMembers[i].getName().equals(name)) {
				srchGrade = "silver";
				return i;
			}
		}
		for(int i = 0; i<gIndex; i++) {
			if(gMembers[i].getName().equals(name)) {
				srchGrade = "gold";
				return i;
			}
		}
		for(int i = 0; i<vIndex; i++) {
			if(vMembers[i].getName().equals(name)) {
				srchGrade = "vip";
				return i;
			}
		}
		return srchIndex;
	}
	
	public SearchInfo searchInfo(String name) {
		for(int i = 0; i<sIndex; i++) {
			if(sMembers[i].getName().equals(name)) {
				SearchInfo srchInfo = new SearchInfo();
				srchInfo.setSrchGrade("silver");
				srchInfo.setSrchIndex(i);
				return srchInfo;
			}
		}
		for(int i = 0; i<gIndex; i++) {
			if(gMembers[i].getName().equals(name)) {
				SearchInfo srchInfo = new SearchInfo();
				srchInfo.setSrchGrade("gold");
				srchInfo.setSrchIndex(i);
				return srchInfo;
			}
		}
		for(int i = 0; i<vIndex; i++) {
			if(vMembers[i].getName().equals(name)) {
				SearchInfo srchInfo = new SearchInfo();
				srchInfo.setSrchGrade("silver");
				srchInfo.setSrchIndex(i);
				return srchInfo;
			}
		}
		
		return null; //SearchInfo는 참조 자료형이기때문에 return 값에 null을 리턴해줘야된다.
	}
}
