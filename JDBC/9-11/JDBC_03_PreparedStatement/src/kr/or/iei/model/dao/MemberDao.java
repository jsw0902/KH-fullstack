package kr.or.iei.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.or.iei.model.vo.Member;

public class MemberDao {

	/*
	 	Statement
	 	- SQL 인젝션 위험 (사용자 의도와는 다른 SQL를 수행시킨다.)
	 	- 가독성이 좋지 않다.
	 	
	 	Statement의 단점을 보완한게 PreparedStatement다
	 	
	 */
	public Member selectIdMember(String searchId) {
		//1. 자원 반환 객체 미리 선언
		Connection conn = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		//2. SQL 결과를 처리할 Java 자료형 지정
		Member member = null;
		
		//3. 수행할 SQL를 작성
		String query = "select * from tbl_member where member_id = ?";
		
		/*
		 위치 홀더 => ?<- 모르거나 ?에 뭐가 들어가는지 맟추는게 아님 진짜 ?로 사용함
		 
		 위치 홀더는 값을 대체하는 것이지 테이블이나 컬럼명을 대체할 수 없다.
		 
		 SQL 수행 시, 전달되는 파라미터가 대체될 위치에 작성하는 문자
		 
		 */
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//5) 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//6. SQL를 수행할 객체 생성
			pstmt = conn.prepareStatement(query); //미리 컴파일을 시켜놓음
			
			//7. 위치홀더 값 대체
			pstmt.setString(1, searchId);
			
			//8. SQL 수행 및 결과 반환
			rset = pstmt.executeQuery();
			
			//9. 결과 처리
			if(rset.next()) {
				member = new Member();
				member.setMemberId(rset.getString("member_id"));
				member.setMemberPw(rset.getString("member_pw"));
				member.setMemberName(rset.getString("member_name"));
				member.setMemberPhone(rset.getString("member_phone"));
				member.setMemberGender(rset.getString("member_gender"));
				member.setMemberAge(rset.getInt("member_age"));
				member.setEnrolDate(rset.getDate("enroll_date"));
				
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
		
		return member;
	}
}
