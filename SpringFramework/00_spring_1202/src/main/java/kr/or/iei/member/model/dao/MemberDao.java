package kr.or.iei.member.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;

@Repository //이 컴포넌트를 작성하면 서버 구동 시 자동으로 객체를 생성하여 IOC 컨테이너에 등록함
public class MemberDao {

	@Autowired
	@Qualifier("jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	public MemberDao() {
		System.out.println("MemberDao 생성");
	}

	public Member memberLogin(Member member) {
		//1. 쿼리 작성
		String query = "select * from tbl_member where member_id = ? and member_pw = ?";
		
		//2. 파라미터 작성
		Object [] paramArr = {member.getMemberId(), member.getMemberPw()};
		
		//3. SQL 수행
		//MemberRowMapper : 데이터베이스 조회 결과를 Java 객체로 변환하는 역할을 담당
		Member loginMember = jdbcTemplate.queryForObject(query, paramArr, new MemberRowMapper());
		
		return loginMember;
	}
}
