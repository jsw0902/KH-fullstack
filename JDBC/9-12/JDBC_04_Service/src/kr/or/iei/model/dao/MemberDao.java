package kr.or.iei.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.iei.model.vo.Member;

public class MemberDao {

	public Member selectIdMember(Connection conn, String searchId) {
		//1. 자원 반환 객체 선언
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//2. SQL 수행 후, 처리할 Java 자료형
		Member m = null;
		
		//3. 수행할 SQL 작성
		String query = "select * from tbl_member where member_id = ?";
		
		//4. 드라이버 등록
		//5.커넥션 객체 작성 
		//Service에서 드라이버 등록 및 객체 생성하여 매개변수로 전달 받음
		
		try {
			//6. SQL을 수행하고 결과를 반환받는 객체 생성
			pstmt = conn.prepareStatement(query);
			
			//7. 위치홀더 값 세팅
			pstmt.setString(1, searchId);
			
			//8. SQL 수행 및 결과 받음
			rset = pstmt.executeQuery();
			
			//9. SQL 결과 처리 
			if(rset.next()) {
				m = new Member();
				
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberGender(rset.getString("member_gender"));
				m.setMemberAge(rset.getInt("member_age"));
				m.setEnrolDate(rset.getDate("enroll_date"));
				
			}else {
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				//커넥션은 Service에서 생성하였으니, 반환도 Service에서 진행할 것임 
				pstmt.close();
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return m;
	}

	
	public ArrayList<Member> selectAllMember(Connection conn) {
		// 자원 반환 객체 선언
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//SQL 수행 후, 처리할 Java 자료형
		ArrayList<Member> list = new ArrayList<Member>();
		
		//수행할 SQL 작성
		String query = "select * from tbl_member";
		
		//드라이버 등록, 커넥션 생성 ==> Service에서 진행하였음
		
		try {
			//SQL을 수행하고 결과를 반환받는 객체 생성
			pstmt = conn.prepareStatement(query);
			
			//SQL 수행 및 결과 받음
			rset = pstmt.executeQuery();
			
			//SQL 결과 처리 
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
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				//커넥션은 Service에서 생성하였으니, 반환도 Service에서 진행할 것임 
				pstmt.close();
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}


	
	public int insertMember(Connection conn, Member member) {
		//자원 반환 객체 선언
		PreparedStatement pstmt = null;
		
		//SQL 결과 처리할 Java 자료형
		int result = 0;
		
		//수행 SQL 작성
		String query = "insert into tbl_member values (?,?,?,?,?,?, sysdate)";
		
		//드라이버 등록, 커넥션 생성은 Service에서 
		
		try {
			//SQL을 수행하고 결과를 반환받는 객체 생성
			pstmt = conn.prepareStatement(query);
			
			//위치 홀더 값 세팅
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPw());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getMemberPhone());
			pstmt.setInt(5, member.getMemberAge());
			pstmt.setString(6, member.getMemberGender());
			
			//SQL 수행
			result = pstmt.executeUpdate();
			
			//트랜잭션 제어를 Service에서 담당할 것임
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				//커넥션은 Service에서 생성하였으니, 반환도 Service에서 진행할 것임 
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}


	public ArrayList<Member> selcetNameMember(Connection conn, String searchName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
		
		String query = "select * from tbl_member where member_name like '%' || ? || '%'";
		
		try {
			//SQL을 수행하고 결과를 반환받는 객체 생성
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchName);
			rset = pstmt.executeQuery();
			
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
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}


	public int updateMember(Connection conn, Member updMember) {
		
		//자원 반환 객체 선언
		PreparedStatement pstmt = null;
				
		//SQL 결과 처리할 Java 자료형
		int result = 0;
		
		String query = "update tbl_member set member_name = ?, member_age = ?, member_gender = ? where member_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치 홀더 값 세팅
			pstmt.setString(1, updMember.getMemberName());
			pstmt.setInt(2, updMember.getMemberAge());
			pstmt.setString(3, updMember.getMemberGender());
			pstmt.setString(4, updMember.getMemberId());
			
			//SQL 수행
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}


	public int deletMember(Connection conn, String delMemberId) {
		
		PreparedStatement pstmt = null;
		
		//SQL 결과 처리할 Java 자료형
		int result = 0;
		
		String query = "delete from tbl_member where member_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치 홀더 값 세팅
			pstmt.setString(1, delMemberId);
			
			//SQL 수행
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}


	public int insertDelMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into tbl_del_member values (?,?,?, sysdate)";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치 홀더 값 세팅
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getMemberPhone());
			
			//SQL 수행
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}


	

}
