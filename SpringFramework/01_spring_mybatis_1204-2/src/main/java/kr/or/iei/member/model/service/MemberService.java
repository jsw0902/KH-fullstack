package kr.or.iei.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.member.model.dao.MemberDao;
import kr.or.iei.member.model.vo.Member;

@Service("service")
public class MemberService {
	
	@Autowired 
	@Qualifier("dao")
	private MemberDao memberDao;

	public Member memberLogin(Member member) {
		// TODO Auto-generated method stub
		return memberDao.memberLogin(member);
	}

	public int join(Member member) {
		
		return memberDao.join(member);
	}

	public int idDuplChk(String memberId) {
		return memberDao.idDuplChk(memberId);
	}

	public int delete(String memberId) {
		// TODO Auto-generated method stub
		return memberDao.delete(memberId);
	}

	public ArrayList<Member> allMemberList() {
		return (ArrayList<Member>) memberDao.allMemberList();
	}

	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return memberDao.updateMember(member);
	}
	
}
