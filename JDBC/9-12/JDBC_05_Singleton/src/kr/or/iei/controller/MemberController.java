package kr.or.iei.controller;

import java.util.ArrayList;
import java.util.Scanner;

import kr.or.iei.model.dao.MemberDao;
import kr.or.iei.model.service.MemberService;
import kr.or.iei.model.vo.Member;

public class MemberController {

	private Scanner sc;
	private MemberService memberService;
	
	public MemberController() {
		sc = new Scanner(System.in);
		memberService = new MemberService();
	}
	
	
	public void mainMtd() {
		while(true) {
			System.out.println("====================== 회원 관리 프로그램 v5 Singleton ======================");
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
				selectAllMember();
				break;
			case 2:
				selectIdMember();
				break;
			case 3:
				selectNameMember();
				break;
			case 4:
				insertMember();
				break;
			case 5:
				updateMember();
				break;
			case 6:
				deleteMember();
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
		
		Member member = memberService.selectIdMember(searchId);
		
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
	
	//회원 정보 등록
	public void insertMember() {
		//1. DB 작업이 필요한지 => o
		//2. 사용자 입력이 필요한자 => o
		
		System.out.println("========================회원 정보 등록========================");
		System.out.print("회원 아이디 입력 : ");
		String memberId = sc.next();
		System.out.print("회원 비밀번호 입력 : ");
		String memberPw = sc.next();
		System.out.print("회원 이름 입력 : ");
		String memberName = sc.next();
		System.out.print("회원 전화번호 입력(010-0000-0000) : ");
		String memberPhone = sc.next();
		System.out.print("회원 나이 입력 : ");
		int memberAge = sc.nextInt();
		System.out.print("회원 성별 입력(남, 여) : ");
		String memberGender = sc.next();
		
		//DB 작업 수행
		Member member = new Member(memberId, memberPw, memberName, memberPhone, memberAge, memberGender, null);
		int result = memberService.insertMember(member);
	
		//정상 작동 유무
		if(result > 0) {
			System.out.println("정상적으로 등록 되었습니다.");
		} else {
			System.out.println("등록 중 오류 다시 등록해주세요.");
		}
	}
	
	public void selectAllMember() {
		//DB 작업 필요한가? ==> O
		//사용자 입력값은 필요한가? ==> X
		System.out.println("==================전체 회원 조회==================");
		
		//DB 작업 수행
		ArrayList<Member> list = memberService.selectAllMember();
		
		//결과 처리
		if(list.isEmpty()) { //list 내부에 Member 객체가 비어있는지?
			System.out.println("회원 정보가 존재하지 않습니다.");
		} else {
			System.out.println("아이디\t비밀번호\t이름\t전화번호\t\t나이\t성별\t가입일");
			for(Member member : list) {
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
	
	public void selectNameMember() {
		System.out.println("========================이름으로 정보 조회========================");
		System.out.print("조회할 이름 입력 : ");
		String searchName = sc.next();
		
		ArrayList<Member> list = memberService.selcetNameMember(searchName);
		
		if(list.isEmpty()) { //list 내부에 Member 객체가 비어있는지?
			System.out.println("회원 정보가 존재하지 않습니다.");
		} else {
			System.out.println("==================회원 정보==================");
			System.out.println("아이디\t비밀번호\t이름\t전화번호\t\t나이\t성별\t가입일");
			for(Member member : list) {
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
	/*
	 회원 정보 삭제
	 1) 입력받은 아이디와 일치하는 회원이 존재하는지 체크하는 SQL 작성
	 2) 회원 정보를 삭제하는 SQL
	 * */
	public void deleteMember() {
		System.out.println("========================회원 정보 삭제========================");
		System.out.print("삭제할 아이디 입력 : ");
		String delMemberId = sc.next();
		
		int result = memberService.deleteMember(delMemberId);
		
		if(result > 0) {
			System.out.println("정상적으로 삭제 되었습니다.");
		} else {
			System.out.println("삭제할 회원이 존재하지 않습니다.");
		}
	}
	
	public void updateMember() {
		System.out.println("========================회원 정보 수정========================");
		System.out.print("수정할 아이디 입력 : ");
		String updMemberId = sc.next();
		
		Member m = memberService.selectIdMember(updMemberId);
		
		if(m == null) {
			System.out.println("수정할 회원이 존재하지 않습니다.");
		} else {
			System.out.print("수정할 이름 입력 : ");
			String updMemberName = sc.next();
			System.out.print("수정할 나이 입력 : ");
			int updMemberAge = sc.nextInt();
			System.out.print("수정할 성별 입력(남,여) : ");
			String updMemberGender = sc.next();
			
			Member updMember = new Member();
			updMember.setMemberName(updMemberName);
			updMember.setMemberAge(updMemberAge);
			updMember.setMemberGender(updMemberGender);
			updMember.setMemberId(updMemberId);
			
			int result = memberService.updateMember(updMember);
			
			if(result > 0) {
				System.out.println("정상적으로 수정되었습니다.");
			} else {
				System.out.println("수정 중 오류가 발생하였습니다.");
			}
		}
	}
}
