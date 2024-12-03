package kr.or.iei.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.member.model.dao.MemberDao;
import kr.or.iei.member.model.vo.Member;

@Service
public class MemberService {
	
	@Autowired //자동으로 생성되어 IoC 컨테이너에 등록된 객체를 주입받기 위함.
	private MemberDao memberDao;
	
	public MemberService() {
		System.out.println("Service 생성");
	}

	public Member memberLogin(Member member) {
		return memberDao.memberLogin(member);
	}
}
