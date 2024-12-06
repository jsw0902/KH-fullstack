package kr.or.iei.member.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;

@Repository("memberDao") //이 컴포넌트를 작성하면 서버 구동 시 자동으로 객체를 생성하여 IOC 컨테이너에 등록함
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

	public int join(Member member) {
		//1. 쿼리 작성
		String query = "insert into tbl_member values(?, ?, ?, ?, ?, ?, sysdate)";
		
		//2. 파라미터 작성
		Object [] paramArr = {member.getMemberId(), member.getMemberPw(), member.getMemberName(),
							  member.getMemberPhone(), member.getMemberAge(), member.getMemberGender()};
		
		//3. SQL 수행(insert, update, delete,는 모두 update 메소드를 사용한댜.)
		int cnt = jdbcTemplate.update(query, paramArr);
		
		//4. 결과 반환
		return cnt;
	}

	public int delete(String memberId) {
		// 1. 쿼리 작성
		String query = "delete from tbl_member where member_id = ?";
		
		//2. 파라미터 작성
		Object [] paramArr = {memberId};
		
		//3. sql 수행
		int result = jdbcTemplate.update(query, paramArr);
		
		//결과 처리
		return result;
	}

	public List<Member> allMemberList() {
		// 1. 쿼리 작성
		String query = "select * from tbl_member";
		
		//2. 파라미터 작성 - 쿼리 수행 시 전달 값 없으므로 선언하지 ㅇ낳음.
		
		//3. SQL 수행
		List<Member> list = jdbcTemplate.query(query, new MemberRowMapper());
		
		//4. 결과 반환
		return list;
	}

	public int idDuplChk(String memberId) {
		//1. 쿼리 작성
		String query = "select count(*) from tbl_member where member_id=?";
		
		//2. 파라미터 작성
		Object [] paramArr = {memberId};
		
		//3. SQL 실행
		int cnt = jdbcTemplate.queryForObject(query, paramArr, Integer.class);
		
		//4. 결과 반환
		return cnt;
	}
}
