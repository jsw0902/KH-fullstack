package kr.or.iei.controller;

import java.util.Scanner;

import kr.or.iei.model.dao.MemberDao;
import kr.or.iei.model.vo.Member;

public class MemberController {
	
	private Scanner sc;
	private MemberDao memberDao;
	
	public MemberController() {
		sc = new Scanner(System.in);
		memberDao = new MemberDao();
	}
	
	
	public void mainMtd() {
		while(true) {
			System.out.println("====================== 회원 관리 프로그램 v2 DAO ======================");
			System.out.println("1. 전체 회원 조회");
			System.out.println("2. 회원 아이디로 조회"); //조회 시 입력한 아이디와 일치하는 회원정보
			System.out.println("3. 회원 이름으로 조회"); //조회 시 입력한 이름이랑 같은 회원 정보
			System.out.println("4. 회원 정보 등록");
			System.out.println("5. 회원 정보 수정");
			System.out.println("6. 회원 정보 삭제");
			System.out.println("0. 종료");
			System.out.print("선택 >> ");
			int sel = sc.nextInt();
			
			switch(sel) {
			case 1:
				//selectAllMember();
				break;
			case 2:
				selectIdMember();
				break;
			case 3:
				//selectNameMember();
				break;
			case 4:
				//insertMember();
				break;
			case 5:
				//updateMember();
				break;
			case 6:
				//deleteMember();
				break;
			case 0:
				return;
			default:
				System.out.println("잘못 고르셨습니다.");
				break;
			}
		}
	}
	
	//아이디로 회원 조회
	public void selectIdMember() {
		//DB 작업 필요? ==> o
		//사용자 입력값이 있는가? ==> o
		
		System.out.println("==================아이디로 회원 정보 조회==================");
		System.out.print("회원 아이디 입력 : ");
		String searchId = sc.next();
		
		Member member = memberDao.selectIdMember(searchId);
		
		if(member == null) {
			System.out.println("조회된 회원 정보가 없습니다.");
		} else {
			System.out.println("========================회원 정보========================");
			System.out.println("아이디\t비밀번호\t이름\t전화번호\t\t나이\t성별\t가입일");
			System.out.println(member.getMemberId() + "\t" +
					   member.getMemberPw() + "\t" +
					   member.getMemberName() + "\t" +
					   member.getMemberPhone() + "\t" +
					   member.getMemberAge() + "\t" +
					   member.getMemberGender() + "\t" +
					   member.getEnrolDate());
		}
		
	}
}
