package kr.or.iei.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kr.or.iei.model.vo.Member;

/*
	DAO : Data Access Object : 데이터에 접근하기 위한 객체
	
	- Database에 접근하는 역할.
	- SQL 수행 시, 사용자 입력값이 필요하면 Controller에게 전달받아 수행하고, 결과를 Controller에게 반환
	- 규칙 : Dao 클래스의 각 메소드는 단 1개의 SQL만을 수행
 */
public class MemberDao {

	public Member selectIdMember(String searchId) {
		//1) 반환할 객체 미리 선언, 수행할 SQL 작성, 결과 처리할 Java의 자료형을 지정
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		//2) SQL 수행 결과를 처리할 Java 자료형 지정.
		Member member = null; //조회 실패했을때의 값을 미리 지정.
		
		//3) 수행할 SQL을 작성.
		String query = "select * from tbl_member where member_id = '" + searchId + "'";
		
		try {
			//4) 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//5) 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//6) Statement 객체 생성 (실제 SQL을 수행하고 결과을 받아올 객체)
			stmt = conn.createStatement(); 
			
			//7) 수행할 SQL을 매개변수로 전달하며, SQL의 결과를 반환
			rset = stmt.executeQuery(query);
			
			//8) 결과 처리
			if(rset.next()) {
				String memberId = rset.getString("member_id");
				String memberPw = rset.getString("member_pw");
				String memberName = rset.getString("member_name");
				String memberPhone = rset.getString("member_phone");
				int memberAge = rset.getInt("member_age");
				String memberGender = rset.getString("member_gender");
				Date enrollDate = rset.getDate("enroll_date");
				
				member = new Member(memberId,memberPw,memberName,memberPhone,memberAge,memberGender,enrollDate);
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
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return member;
	}
	
	public ArrayList<Member> selectNameMember(String searchName){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
		
		Member member = null;
		
		String query = "select * from tbl_member where member_name like '%" + searchName + "%'";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//5) 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//6) Statement 객체 생성 (실제 SQL을 수행하고 결과을 받아올 객체)
			stmt = conn.createStatement(); 
			
			//7) 수행할 SQL을 매개변수로 전달하며, SQL의 결과를 반환
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberGender(rset.getString("member_gender"));
				m.setMemberAge(rset.getInt("member_age"));
				m.setEnrolDate(rset.getDate("enroll_date"));
				list.add(m);
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
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
		
	}

	public ArrayList<Member> selectAllMember(){
		//1) 자원 반환 객체 미리 선언
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		//2) 결과에 대해서 처리할 Java 자료형 지정
		ArrayList<Member> list = new ArrayList<Member>();
		
		//3) 수행할 SQL 작성
		String query = "select * from tbl_member";
		
		try {
			//4) 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//5) 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//6) Statement 객체 생성 (실제 SQL을 수행하고 결과을 받아올 객체)
			stmt = conn.createStatement(); 
			
			//7) 수행할 SQL을 매개변수로 전달하며, SQL의 결과를 반환
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberGender(rset.getString("member_gender"));
				m.setMemberAge(rset.getInt("member_age"));
				m.setEnrolDate(rset.getDate("enroll_date"));
				list.add(m);
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
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public int inserMember(Member m) {
		//1) 자원 반환 객체 미리 선언
		Connection conn = null;
		Statement stmt = null;
		
		//2) 수행할 SQL 작성
		String query = "insert into tbl_member values (" + 
										"'" + m.getMemberId() + "', " +
										"'" + m.getMemberPw() + "', " +
										"'" + m.getMemberName() + "', " +
										"'" + m.getMemberPhone() + "', " +
											  m.getMemberAge() + "," +
										"'" + m.getMemberGender() + "', " +
										"sysdate)";
		//3) SQL 수행 결과를 처리할 Java 자료형
		int result = 0;
		try {
			//4) 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//5) 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//6) 실제 SQL을 수행할 Statement 객체 생성
			stmt = conn.createStatement(); 
			
			//7) SQL 수행 및 결과 반환
			result = stmt.executeUpdate(query);
			
			//8)DML(insert, update, delete) 결과 처리
			if(result > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int deleteMember(String delMemberId) {
		Connection conn = null;
		Statement stmt = null;
		
		String query = "delete from tbl_member where member_id = '" + delMemberId + "'";
		
		int result = 0;
		
		try {
			//4) 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//5) 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//6) 실제 SQL을 수행할 Statement 객체 생성
			stmt = conn.createStatement(); 
			
			//7) SQL 수행 및 결과 반환
			result = stmt.executeUpdate(query);
			
			//8)DML(insert, update, delete) 결과 처리
			if(result > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}

	public int updateMember(Member updMember) {
		//1. 자원 반환 객체 선언
		Connection conn = null;
		Statement stmt = null;
		
		//2. 수행할 SQL 작성
		String query = "update tbl_member set member_name = '" + updMember.getMemberName() + "', "+
											 "member_phone= '" + updMember.getMemberPhone() + "', " +
											 "member_age = " + updMember.getMemberAge()+
											 "where member_id = '" + updMember.getMemberId()+ "'";
		//3. SQL 수행 결과를 처리할 Java 자료형 지정
		int result = 0;
		
		try {
			//4) 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//5) 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//6) SQL을 수행할 객체 생성
			stmt = conn.createStatement(); 
			
			//7) SQL 수행 및 결과 반환
			result = stmt.executeUpdate(query);
			
			//8)DML(insert, update, delete) 결과 처리
			if(result > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}
}
