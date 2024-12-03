package kr.or.iei.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.member.model.dao.MemberDao;
import kr.or.iei.member.model.vo.Member;

@Service("memberService")
public class MemberService {
	
	@Autowired //자동으로 생성되어 IoC 컨테이너에 등록된 객체를 주입받기 위함.
	@Qualifier("memberDao") //"memberDao" 식별자를 가진 객체를 주입받기 위함. 
	private MemberDao memberDao;
	
	public MemberService() {
		System.out.println("Service 생성");
	}

	public Member memberLogin(Member member) {
		return memberDao.memberLogin(member);
	}

	public int join(Member member) {
		return memberDao.join(member);
	}

	public int delete(String memberId) {

		return memberDao.delete(memberId);
	}

	public ArrayList<Member> allMemberList() {
		return (ArrayList<Member>)memberDao.allMemberList();
		
	}

	public int idDuplChk(String memberId) {
		return memberDao.idDuplChk(memberId);
	}
}
