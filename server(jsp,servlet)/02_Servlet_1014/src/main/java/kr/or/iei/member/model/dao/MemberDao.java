package kr.or.iei.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.iei.common.JDBCTemplate;
import kr.or.iei.member.model.vo.Member;

public class MemberDao {

	public ArrayList<Member> selectAllMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member_tbl";
		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member member = new Member();//꺼내올 값인 Member 미리 생성
				
				member.setMemberNo(rset.getString("member_no"));
				member.setMemberId(rset.getString("member_id"));
				member.setMemberPw(rset.getString("member_pw"));
				member.setMemberName(rset.getString("member_name"));
				member.setMemberPhone(rset.getString("member_phone"));
				member.setMemberAddr(rset.getString("member_addr"));
				member.setMemberLevel(rset.getInt("member_level"));
				member.setMemberDate(rset.getString("member_date"));
				list.add(member);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public Member selectIdMember(Connection conn, String searchId) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = "select * from member_tbl where member_id = ?";
		Member m = null;
		
		try {
			pstmt  = conn.prepareStatement(query);
			pstmt.setString(1, searchId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getString("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberAddr(rset.getString("member_addr"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setMemberDate(rset.getString("member_date"));
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
	
	public ArrayList<Member> selectNameMember(Connection conn, String searchNm) {
	      // TODO Auto-generated method stub
	      ResultSet rset = null;
	      PreparedStatement pstmt = null;
	      
	      //입력받은 값의 자료형 == Stirng
	      String query = "select * from member_tbl where member_name like '%'||?||'%'";
	      ArrayList<Member> list = new ArrayList<Member>();
	      
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, searchNm);
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

	public int insertMember(Connection conn, Member insMember) {
		PreparedStatement pstmt = null;
		String query = "insert into member_tbl values(member_seq.nextval, ?, ?, ?, ?, ?, 3, sysdate)";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, insMember.getMemberId());
			pstmt.setString(2, insMember.getMemberPw());
			pstmt.setString(3, insMember.getMemberName());
			pstmt.setString(4, insMember.getMemberPhone());
			pstmt.setString(5, insMember.getMemberAddr());
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
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}
