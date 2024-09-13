package kr.or.iei.model.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.iei.model.dao.MemberDao;
import kr.or.iei.model.vo.Member;

public class MemberService {
	
	private MemberDao memberDao;

	public MemberService() {
		memberDao = new MemberDao();
	}
	
	public Member selectIdMember(String searchId) {
		//자원 반환 객체 (COnnerction)
		
		Connection conn = null;
		Member m = null;
		
		try {
			//드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//DB 작업 수행
			m = memberDao.selectIdMember(conn, searchId);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return m;
	}

	public ArrayList<Member> selectAllMember() {
		//자원 반환 객체
		Connection conn = null;
		ArrayList<Member> list = new ArrayList<Member>();
		
		
		try {
			//드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//DB 작업 수행
			list = memberDao.selectAllMember(conn);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return list;
	}

	public int insertMember(Member member) {
		//자원 반환 객체
		Connection conn = null;
		int result = 0;
				
		try {
			//드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			result = memberDao.insertMember(conn, member);
			
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
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return result;
	}

	public ArrayList<Member> selcetNameMember(String searchName) {
		Connection conn = null;
		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			//드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			list = memberDao.selcetNameMember(conn, searchName);
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}

	public int updateMember(Member updMember) {
		Connection conn = null;
		int result = 0;
		
		try {
			//드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			result = memberDao.updateMember(conn, updMember);
			
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
		int result = 0;
		
		try {
			//드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			conn.setAutoCommit(false);
			/*
			 1. 입력받은 아이디와 일치하는 회원이 존재하는지
			 2. 회원 정보 삭제
			 3. 삭제 회원 관리 테이블에 등록
			 
			 Connection은 SQL이 정상적으로 수행되면 자동으로 commit을 진행함
			 그렇기 때문에, 아래 코드에서 삭제가 정상적으로 진행되고
			 삭제된 회원 정보를 등록하는 과정에서 오류가 발생하였다고 하더라도
			 이미 정상 삭제 시, commit이 되었음. 
			 
			 개발자가 트랜잭션을 제어하기 위해서, 커넥션의 AutoCommit을 false로 세팅 
			 
			 
			 * */
			
			//(1)
			Member member = memberDao.selectIdMember(conn, delMemberId);
			
			if(member != null) {
				//(2)
				result = memberDao.deletMember(conn, delMemberId);
				
				if(result == 0) {
					//삭제 실패 경우
					conn.rollback();
				} else {
					//삭제 성공
					//conn.commit(); //삭제 회원 관리 테이블에도 정상적으로 동록된 경우에 commit
					
					//(3)
					result = memberDao.insertDelMember(conn, member);
					
					if(result > 0) {
						conn.commit();
					} else {
						conn.rollback();
					}
				}
				
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}

}
