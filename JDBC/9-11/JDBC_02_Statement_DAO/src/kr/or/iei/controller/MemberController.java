package kr.or.iei.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Scanner;

import kr.or.iei.model.dao.MemberDao;
import kr.or.iei.model.vo.Member;

/*
	controller : view 역할 + 운영(제어)
	- SQL 수행 시, 필요한 사용자 입력값을 DAO 클래스에 전달.
	- DAO가 수행한 SQL의 결과를 반환받아, 사용자에게 출력 or 처리하는 역할
	
 */
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
	
	//회원 아이디로 조회
	public void selectIdMember() {
		/*
		1. DB 작업이 필요한가? ==> O
		2. DB 작업 시, 사용자 입력값이 필요한가? ==> O
		*/
		System.out.println("==================회원 아이디로 조회==================");
		System.out.print("회원 아이디 입력 : ");
		String searchId = sc.next();
		
		//입력받은 아이디를 DAO에 전달하며, 데이터베이스 작업 위임.
		//조회 결과 정보를 Controller에서 출력하기 위해, 조회된 Member 객체를 DAO로부터 반환 받음.
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
	
	public void selectNameMember() {
		System.out.println("==================이름으로 회원 정보 조회==================");
		System.out.print("조회할 이름 입력 : ");
		String searchName = sc.next();
		
		ArrayList<Member> list = memberDao.selectNameMember(searchName); 
		
		if(list.isEmpty()) {
			System.out.println("조회된 회원 정보가 없습니다.");
		} else {
			System.out.println("========================회원 정보========================");
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
	
	public void selectAllMember() {
		/*
		 1.DB 작업이 필요한가? ==> O
		 2.DB 작업 시, 사용자 입력값이 필요한가? ==> X
		 */
		
		ArrayList<Member> list = memberDao.selectAllMember();
		
		if(list.isEmpty()) {
			System.out.println("조회된 회원 정보가 없습니다.");
		} else {
			System.out.println("========================회원 정보========================");
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
	
	public void insertMember() {
		
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
		
		Member m = new Member(memberId, memberPw, memberName, memberPhone, memberAge, memberGender, null);
		
		int result = memberDao.inserMember(m);
		
		if(result > 0) {
			System.out.println("회원 정보 등록이 완료되었습니다.");
		} else {
			System.out.println("회원 정보 등록 중, 오류가 발생하였습니다.");
		}
	}
	
	public void deleteMember() {
		/*
		 1.DB 작업이 필요한가? ==> O
		 2.DB 작업 시, 사용자 입력값이 필요한가? ==> O
		 */
		System.out.println("========================회원 정보 삭제========================");
		System.out.print("삭제할 아이디 입력 : ");
		String delMemberId = sc.next();
		
		int result = memberDao.deleteMember(delMemberId);
		
		if(result > 0) {
			System.out.println("정상적으로 삭제 되었습니다.");
		} else {
			System.out.println("삭제할 회원이 존재하지 않습니다.");
		}
	}
	
	public void updateMember() {
		/*
		 1.DB 작업이 필요한가? ==> O
		 2.DB 작업 시, 사용자 입력값이 필요한가? ==> O
		 */
		System.out.println("========================회원 정보 수정========================");
		System.out.print("수정할 아이디 입력 : ");
		String searchId = sc.next();
		
		//입력받은 아이디와 일치하는 회원이 존재하는지 체크하는 작업
		//아이디로 회원 조회 시, 작성한 Dao 클래스의 메소드를 재사용!!!
		Member member = memberDao.selectIdMember(searchId);
		
		if(member == null) {
			System.out.println("수정 대상이 존재하지 않습니다.");
		} else {
			System.out.print("수정할 이름 입력 : ");
			String updMemberName = sc.next();
			System.out.print("수정할 전화번호 입력 : ");
			String updMemberPhone = sc.next();
			System.out.print("수정할 나이 입력 : ");
			int updMemberAge = sc.nextInt();
			
			//별도의 Member 객체 생성하여 DAO에 전달
			Member updMember = new Member();
			updMember.setMemberName(updMemberName);
			updMember.setMemberPhone(updMemberPhone);
			updMember.setMemberAge(updMemberAge);
			updMember.setMemberId(searchId); //조건식에 작성할 ID
			
			int result = memberDao.updateMember(updMember);
			
			if(result > 0) {
				System.out.println("정상적으로 수정되었습니다.");
			} else {
				System.out.println("수정 중, 오류가 발생하였습니다.");
			}
		}
	}
}
