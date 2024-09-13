package kr.or.iei.model.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.iei.common.JDBCTemplate;
import kr.or.iei.model.dao.MemberDao;
import kr.or.iei.model.vo.Member;

public class MemberService {
	
	private MemberDao memberDao;

	public MemberService() {
		memberDao = new MemberDao();
	}
	
	public Member selectIdMember(String searchId) {
		//자원 반환 객체 (COnnerction)
		
		Connection conn = JDBCTemplate.getConnection();
		Member m = memberDao.selectIdMember(conn, searchId);;
		JDBCTemplate.close(conn);
		return m;
	}

	public ArrayList<Member> selectAllMember() {
		//자원 반환 객체
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = memberDao.selectAllMember(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertMember(Member member) {
		//자원 반환 객체
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = memberDao.insertMember(conn, member);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
				
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Member> selcetNameMember(String searchName) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = memberDao.selcetNameMember(conn, searchName);
		JDBCTemplate.close(conn);
		return list;
	}

	public int updateMember(Member updMember) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = memberDao.updateMember(conn, updMember);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteMember(String delMemberId) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = memberDao.selectIdMember(conn, delMemberId);
		int result = 0;
			if(member != null) {
				//(2)
				result = memberDao.deletMember(conn, delMemberId);
				
				if(result == 0) {
					//삭제 실패 경우
					JDBCTemplate.rollback(conn);
				} else {
					//삭제 성공
					//conn.commit(); //삭제 회원 관리 테이블에도 정상적으로 동록된 경우에 commit
					
					//(3)
					result = memberDao.insertDelMember(conn, member);
					
					if(result > 0) {
						JDBCTemplate.commit(conn);
					} else {
						JDBCTemplate.rollback(conn);
					}
				}
				
			}
		JDBCTemplate.close(conn);
		return result;
	}

}
