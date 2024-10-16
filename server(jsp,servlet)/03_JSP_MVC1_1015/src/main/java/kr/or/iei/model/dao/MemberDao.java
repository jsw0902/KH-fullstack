package kr.or.iei.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.iei.common.JDBCTemplate;
import kr.or.iei.model.vo.Member;

public class MemberDao {
	
	public ArrayList<Member> selectAllMember(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member_tbl";
		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setMemberDate(rset.getString("member_date"));
				m.setMemberAddr(rset.getString("member_addr"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public Member selectIdMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member_tbl where member_id = ?";
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setMemberAddr(rset.getString("member_addr"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberDate(rset.getString("member_date"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return m;
	}
	
	 public ArrayList<Member> selectNameMember(Connection conn, String memberName){
		  ResultSet rset = null;
	      PreparedStatement pstmt = null;
	      
	      //입력받은 값의 자료형 == Stirng
	      String query = "select * from member_tbl where member_name like '%'||?||'%'";
	      ArrayList<Member> list = new ArrayList<Member>();
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, memberName);
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            Member m = new Member();
	            m.setMemberNo(rset.getString("member_no"));
	            m.setMemberId(rset.getString("member_id"));
	            m.setMemberPw(rset.getString("member_pw"));
	            m.setMemberName(rset.getString("member_name"));
	            m.setMemberPhone(rset.getString("member_phone"));
	            m.setMemberAddr(rset.getString("member_addr"));
	            m.setMemberLevel(rset.getInt("member_level"));
	            m.setMemberDate(rset.getString("member_date"));
	            
	            list.add(m);
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         JDBCTemplate.close(rset);
	         JDBCTemplate.close(pstmt);
	      }
	      return list;
	   }
	 
	 public int insertMember(Connection conn, Member m) {
		 	PreparedStatement pstmt = null;
			String query = "insert into member_tbl values(member_seq.nextval, ?, ?, ?, ?, ?, 3, sysdate)";
			int result = 0;
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, m.getMemberId());
				pstmt.setString(2, m.getMemberPw());
				pstmt.setString(3, m.getMemberName());
				pstmt.setString(4, m.getMemberPhone());
				pstmt.setString(5, m.getMemberAddr());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			return result;
	 }
	 
	 public int deleteMember(Connection conn, String memberNo) {
		 	PreparedStatement pstmt = null;
			String query = "delete from member_tbl where member_no = ?";
			int result = 0;
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, memberNo);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(pstmt);
			}
		 return result;
	 }
}
