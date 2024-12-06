package kr.or.iei.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;

@Repository("dao")
public class MemberDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public Member memberLogin(Member member) {
		/*
			사용자 입력값
			아이디 : <input type="text" name="memberId">	ex) admin
			비밀번호 : <input type="text" name="memberPw"> ex) 1234
		*/
		return sqlSession.selectOne("member.selectOneMember", member);
	}

	public int join(Member member) {
		return sqlSession.insert("member.insertMember", member);
	}

	public int idDuplChk(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.idDuplChk", memberId);
	}

	public int delete(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.deleteMember", memberId);
	}

	public List<Member> allMemberList() {
		// selectAllMember
		return sqlSession.selectList("member.selectAllMember");
	}

	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.updateMember", member);
	}
	
}
