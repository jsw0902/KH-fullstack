package kr.or.iei.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import kr.or.iei.common.JDBCTemplate;
import kr.or.iei.model.dao.MemberDao;
import kr.or.iei.model.vo.Member;

public class MemberService {
	MemberDao dao;
	
	public MemberService() {
		dao = new MemberDao();
	}
	
	public ArrayList<Member> selectAllMember(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = dao.selectAllMember(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public Member selectIdMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = dao.selectIdMember(conn, memberId);
		JDBCTemplate.close(conn);
		return member;
		
	}
	
	public ArrayList<Member> selectNameMember(String memberName){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = dao.selectNameMember(conn, memberName);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		Member chkMember = dao.selectIdMember(conn, m.getMemberId());
		int result = -1;
		
		if(chkMember == null) {			
			result = dao.insertMember(conn, m);
			
			if(result > 0) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
		}
		
		return result;
	}
	
	public int deleteMember(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.deleteMember(conn, memberNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
}
