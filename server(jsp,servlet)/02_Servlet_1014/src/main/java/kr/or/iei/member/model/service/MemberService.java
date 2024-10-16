package kr.or.iei.member.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.iei.common.JDBCTemplate;
import kr.or.iei.member.model.dao.MemberDao;
import kr.or.iei.member.model.vo.Member;

public class MemberService {
	MemberDao dao;
	
	
	public MemberService() {
		dao = new MemberDao();
		
	}


	public ArrayList<Member> selectAllMember() {
		
		//커넥션 객체 얻어오기
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = dao.selectAllMember(conn);
		JDBCTemplate.close(conn);
		return list;
	}


	public Member selectIdMember(String searchId) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = dao.selectIdMember(conn, searchId);
		JDBCTemplate.close(conn);
		return member;
	}


	public ArrayList<Member> selectNameMember(String searchNm) {
	      // TODO Auto-generated method stub
	      Connection conn = JDBCTemplate.getConnection();
	      ArrayList<Member> list = dao.selectNameMember(conn,searchNm);
	      return list;
	   }

	public int insertMember(Member insMember) {
		Connection conn = JDBCTemplate.getConnection();
		
		//입력한 아이디와 일치하는 회원이 기존에 DB에 존재하는지 체크 
		//select * from member_tbl where member_id = ?;
		Member chkMember = dao.selectIdMember(conn, insMember.getMemberId());
		int result = -1;
		
		if(chkMember == null) {
			result = dao.insertMember(conn, insMember);
			
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		}
		
		JDBCTemplate.close(conn);
		return result;
	}


	public int deleteMember(String memberNo) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteMember(conn, memberNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


	

}
