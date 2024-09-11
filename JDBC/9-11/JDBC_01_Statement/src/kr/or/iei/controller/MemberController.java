package kr.or.iei.controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import kr.or.iei.model.vo.Member;

// 해당 프로젝트에서는 VIEW의 역할을 Controller가 같이 수행할것이므로, Scanner 객체를 Controller에 생성
public class MemberController {
	
	private Scanner sc;
	
	public MemberController() { 
		sc = new Scanner(System.in);
	}

	public void mainMtd() {
		while(true) {
			System.out.println("====================== 회원 관리 프로그램 v1 Statement ======================");
			System.out.println("1. 전체 회원 조회");
			System.out.println("2. 회원 아이디로 조회"); //조회 시 입력한 아이디와 일치하는 회원정보
			System.out.println("3. 회원 이름으로 조회"); //조회 시 입력한 이름이랑 같은 회원 정보
			System.out.println("4. 회원 정보 등록");
			System.out.println("5. 회원 정보 수정");
			System.out.println("6. 회원 정보 삭제");
			System.out.println("0. 종료");
			
			System.out.print("선택 >> ");
			int sel = sc.nextInt();
			
			switch(sel) {
			case 1 : //selectAllMember();
				selectAllMember();
				break;
			case 2 : //selectIdMember();
				selectIdMember();
				break;
			case 3 : //selectNameMember();
				selectNameMember();
				break;
			case 4 : //insertMember();
				insertMember();
				break;
			case 5 : //updateMember();
				updateMember();
				break;
			case 6 : //deleteMember();
				deleteMember();
				break;
			case 0 :
				return;
			default :
				break;
			}
		}
	}
	
	//전체 회원 조회
	public void selectAllMember() {
		/*
		1) 현재 기능에서 DataBase 작업이 필요한지? ==> O
		2) Database 작업이 필요하다면 SQL 작성.
		3) SQL 작성 시, 사용자 입력이 필요한가?
			-> 입력이 필요하다면 Scanner를 통해 입력 받기
		4) SQL의 실행 결과를 어떠한 자료형으로 Java에서 처리할 지 결정
		5) DataBase 작업 수행
		 */
		
		/* 아래에 작성된 클래스 및 메소드를 이용하여 DB 작업 수행.
		Class.forName() : DBMS에서 제공한 jar 파일내의 드라이버 클래스를 등록
		Connection 약어 = DriverManager.getConnection() : DriverManger를 통해 커넥션 객체 생성
		Statement 약어 = createStatement() : 실제 SQL을 수행하고, 결과를 받아올 객체
		ResultSet 약어 = Statement.executeQuery() : Select SQL의 실행 결과를 받아줄 객체

		 * */
				
		//5.0 결과를 받아 저장할 객체 생성 SQL 작성 , 자원 반환할 객체 미리 선언
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select * from tbl_member"; //SQL의 세미콜론은 작성하지 않음
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		
		try {
			//5.1 드라이버 등록(ojdbc6.jar 파일 내에 존재하는 클래스 파일)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//5.2 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//5.3 Statement 객체 생성 (실제 SQL을 수행하고 결과을 받아올 객체)
			stmt = conn.createStatement(); 
			
			//5.4 수행할 SQL을 매개변수로 전달하며, SQL의 결과를 반환
			rset = stmt.executeQuery(query); //SQL select 전용 메소드
			
			//executeQuery()를 실행하면, 커서가 컬럼이 존재하는 행을 가리키고 있음.
			//rset.next(); // 다음 행을 가리키고, 다음 행에 데이터가 존재하면 true 존재하지 않으면 false를 반환
			
			//5.5 SQL 결과 처리
			while(rset.next()) { //다음 행의 데이터가 존재하는 동안 반복

				//현재 행의 각 컬럼 값을 get
				String memberId = rset.getString("member_id");
				String memberPw = rset.getString("member_pw");
				String memberName = rset.getString("member_name");
				String memberPhone = rset.getString("member_phone");
				int memberAge = rset.getInt("member_age");
				String memberGender = rset.getString("member_gender");
				Date enrollDate = rset.getDate("enroll_date");
				
				Member member = new Member(memberId, memberPw, memberName, memberPhone, memberAge, memberGender, enrollDate);
				list.add(member);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				//5.6 자원 반환
				rset.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//조회한 회원 출력
		System.out.println("========================회원 정보========================");
		System.out.println("아이디\t비밀번호\t이름\t전화번호\t\t나이\t성별\t가입일");
		for(Member m : list) {
			System.out.println(m.getMemberId() + "\t" +
							   m.getMemberPw() + "\t" +
							   m.getMemberName() + "\t" +
							   m.getMemberPhone() + "\t" +
							   m.getMemberAge() + "\t" +
							   m.getMemberGender() + "\t" +
							   m.getEnrolDate());
		}
	}
	
	//회원 아이디로 조회
	public void selectIdMember() {
		/*
		 1. DB 작업이 필요한지? ==> O
		 	sql : SELECT * FROM TBL_MEMBER WHERE MEMBER_ID = 'user01'
		 2. 사용자 입력이 필요한가?
		 	Scanner를 통해서, 사용자 입력을 받음.
		 3. sql의 수형 결과를 java에서 어떤 자료형으로 처리할것인가?
		 	=> Member
		 4. DB 작업 수행
		*/
		System.out.println("========================아이디로 회원 조회========================");
		System.out.print("조회할 아이디 입력 : ");
		String searchId = sc.next();
		
		//5.0 자원 반환 객체 미리 선언, 수행할 SQL 작성, SQL 결과를 처리할 객체 지정
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		Member member = null; // SQL 결과가 실패했을때의 값을 미리 지정
		String query = "Select * from tbl_member where member_id = '" + searchId + "'";
		
		try {
			//5.1 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//5.2 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//5.3 실제 SQL을 수행할 Statement 객체 생성
			stmt = conn.createStatement(); 
			
			//5.4 쿼리 수행 후, 결과 반환
			rset = stmt.executeQuery(query); //SQL select 전용 메소드
			
			/*
			입력 받은 아이디와 정확히 일치하는 회원 조회!
			단, member_id는 primary key이므로 중복된 값을 가질 수 없음.
			즉, 조회 결과는 0개 이거나 1개 ! 때문에 while이 아니고 if문으로 처리한다.
			 */
			
			//5.5 수행 결과 처리
			if(rset.next()) {
				String memberId = rset.getString("member_id");
				String memberPw = rset.getString("member_pw");
				String memberName = rset.getString("member_name");
				String memberPhone = rset.getString("member_phone");
				int memberAge = rset.getInt("member_age");
				String memberGender = rset.getString("member_gender");
				Date enrollDate = rset.getDate("enroll_date");
				
				member = new Member(memberId, memberPw, memberName, memberPhone, memberAge, memberGender, enrollDate);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//5.6 자원 반환
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(member == null) {
			//rset.next()의 결과가 false일 때 == 일치하는 회원이 존재하지 않을 때
			System.out.println("조회한 회원 정보가 존재하지 않습니다.");
		} else {
			//rset.next()의 결과가 true가 나와서, new 연산자를 통해 주소값을 할당 받았을 때
			//회원이 존재할 때
			System.out.println("========================회원 정보========================");
			System.out.println("아이디\t비밀번호\t이름\t전화번호\t\t나이\t성별\t가입일");
			System.out.println(member.getMemberId() + "\t" +
					   member.getMemberPw() + "\t" +
					   member.getMemberName() + "\t" +
					   member.getMemberPhone() + "\t" +
					   member.getMemberAge() + "\t" +
					   member.getMemberGender() + "\t" +
					   member.getEnrolDate());
			
		}
	}
	
	public void selectNameMember() {
		/*
		1) 현재 기능에서 DataBase 작업이 필요한지? ==> O
		2) Database 작업이 필요하다면 SQL 작성.
		3) SQL 작성 시, 사용자 입력이 필요한가?
			-> 입력이 필요하다면 Scanner를 통해 입력 받기
		4) SQL의 실행 결과를 어떠한 자료형으로 Java에서 처리할 지 결정
		5) DataBase 작업 수행
		 */
		
		//5.0 자원 반환 객체 미리 선언, 수행할 SQL 작성, Java에서 처리할 객체 지정
		System.out.println("========================아이디로 회원 조회========================");
		System.out.print("조회할 이름 입력 : ");
		String searchName = sc.next();
		
		//5.0 자원 반환 객체 미리 선언, 수행할 SQL 작성, SQL 결과를 처리할 객체 지정
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		Member member = null; // SQL 결과가 실패했을때의 값을 미리 지정
		String query = "Select * from tbl_member where member_name like '%' || '" + searchName + "' || '%'";
		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			//5.1 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//5.2 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//5.3 실제 SQL을 수행할 Statement 객체 생성
			stmt = conn.createStatement(); 
			
			//5.4 쿼리 수행 후, 결과 반환
			rset = stmt.executeQuery(query); //SQL select 전용 메소드
			
			//5.5 결과 처리
			while(rset.next()) {
				String memberId = rset.getString("member_id");
				String memberPw = rset.getString("member_pw");
				String memberName = rset.getString("member_name");
				String memberPhone = rset.getString("member_phone");
				int memberAge = rset.getInt("member_age");
				String memberGender = rset.getString("member_gender");
				Date enrollDate = rset.getDate("enroll_date");
				
				list.add(new Member(memberId, memberPw, memberName, memberPhone, memberAge, memberGender, enrollDate)); 
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
		
		if(list.size() < 1) {
			System.out.println("조회된 회원이 존재하지 않습니다.");
		}else {
			System.out.println("========================회원 정보========================");
			System.out.println("아이디\t비밀번호\t이름\t전화번호\t\t나이\t성별\t가입일");
			for(Member m : list) {
				System.out.println(m.getMemberId() + "\t" +
						   m.getMemberPw() + "\t" +
						   m.getMemberName() + "\t" +
						   m.getMemberPhone() + "\t" +
						   m.getMemberAge() + "\t" +
						   m.getMemberGender() + "\t" +
						   m.getEnrolDate());
			}
		}
	}
	
	//회원 정보 등록
	public void insertMember() {
		/*
		1) 현재 기능에서 DataBase 작업이 필요한지? ==> O
		2) Database 작업이 필요하다면 SQL 작성.
		3) SQL 작성 시, 사용자 입력이 필요한가? ==> 아이디, 비밀번호, 이름, 전화번호, 나이, 성별
			-> 입력이 필요하다면 Scanner를 통해 입력 받기
		4) SQL의 실행 결과를 어떠한 자료형으로 Java에서 처리할 지 결정
		5) DataBase 작업 수행
		 */
		
		System.out.println("========================회원 정보 등록========================");
		System.out.print("회원 아이디 입력 : ");
		String memberId = sc.next();
		System.out.print("회원 비밀번호 입력 : ");
		String memberPw = sc.next();
		System.out.print("회원 이름 입력 : ");
		String memberName = sc.next();
		System.out.print("회원 전화번호 입력(010-0000-0000) : ");
		String memberPhone = sc.next();
		System.out.print("회원 나이 입력 : ");
		int memberAge = sc.nextInt();
		System.out.print("회원 성별 입력(남, 여) : ");
		String memberGender = sc.next();
		//가입일 == 입력받는것이 아니고, 가입한 날짜로 자동으로 등록
		
		
		//5.0 반환할 객체 미리 선언, 수행할 SQL 작성, Java에서 처리할 자료형 선언
		Connection conn = null;
		Statement stmt = null;
		
		//select와 다르게 insert의 결과는 변경된 행의 숫자가 반환됨! Java에서 숫자를 int로 처리할 수 있음.
		int result = 0;
		
		String query = "insert into tbl_member values (" + 
										"'" + memberId + "', " +
										"'" + memberPw + "', " +
										"'" + memberName + "', " +
										"'" + memberPhone + "', " +
										memberAge + "," +
										"'" + memberGender + "', " +
										"sysdate)";
		
		try {
			//5.1 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//5.2 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//5.3 실제 SQL을 수행할 Statement 객체 생성
			stmt = conn.createStatement(); 
			
			//5.4 SQL 수행 및 결과 반환
			//insert, update, delete의 결과는 영향을 받은 형의 갯수를 반환 == 정수 형태 == java에서 정수 자료형 == int
			result = stmt.executeUpdate(query);
			
			//트랜잭션 : 한꺼번에 수행되어야 하는 일련의 작업들
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
		
		//result == 변경된
		if(result > 0) {
			System.out.println("회원 정보 등록이 완료되었습니다.");
		} else {
			System.out.println("회원 정보 등록 중, 오류가 발생하였습니다.");
		}
	}
	
	//회원 정보 수정
	public void updateMember() {
		//먼저 아이디를 입력받고, 입력받은 아이디와 일치하는 회원이 존재하면 수정할 정보들을 입력받음
		System.out.println("========================회원 정보 수정========================");
		System.out.print("수정할 아이디 입력 : ");
		String updMemberId = sc.next();
		
		//5.0 자원 반환 객체 선언, 수행할 SQL 작성, Java에서 처리할 객체 지정
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null; //일치하는 회원 조회 시
		int result = 0;		   //정보 수정 시
		
		String query = "select * from tbl_member where member_id = '" + updMemberId + "'";
		
		try {
			//5.1 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//5.2 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//5.3 실제 SQL을 수행할 객체 생성
			stmt = conn.createStatement(); 
			
			//5.4 SQL 수행 결과를 받을 객체	
			rset = stmt.executeQuery(query); // SELECT(일치하는 회원이 존재하는지)
			
			//5.5 수행 결과 처리
			if(rset.next()) {
				System.out.println("========================수정할 정보 입력========================");
				System.out.print("수정할 이름 입력 : ");
				String updMemberName = sc.next();
				System.out.print("수정할 나이 입력 : ");
				int updMemberAge = sc.nextInt();
				System.out.print("수정할 전화번호 입력(010-0000-0000) : ");
				String updMemberPhone = sc.next();
				
				query = "update tbl_member set member_name = '" + updMemberName + "', " +
											"member_age = " + updMemberAge + "," +
											"member_phone = '" + updMemberPhone + "'" +
											"where member_id = '" + updMemberId + "'";
				
				 result = stmt.executeUpdate(query);
				 
				 if(result > 0) {
					 conn.commit();
				 } else {
					 conn.rollback();
				 }
				
			}else {
				System.out.println("수정 대상이 존재하지 않습니다.");
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
		
		if(result > 0) {
			//정상 수정
			System.out.println("정상적으로 수정 되었습니다.");
			
			//다음 비즈니스 로직이 존재하면 여기에 작성
		} else {
			//수정된 행이 없을 때
			System.out.println("수정 중, 오류가 발생하였습니다.");
		}
		
	}
	
	//회원 정보 삭제
	public void deleteMember() {
		System.out.println("========================회원 정보 삭제========================");
		System.out.print("삭제할 아이디 입력 : ");
		String delMemberId = sc.next();
		
		Connection conn = null;
		Statement stmt = null;
		int result = 0;		   
		
		String query = "delete from tbl_member where member_id = '" + delMemberId + "'";
		
		try {
			//5.1 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//5.2 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_test", "1234"); 
			
			//5.3 실제 SQL을 수행할 Statement 객체 생성
			stmt = conn.createStatement(); 
			
			//5.4 SQL 수행 및 결과 반환
			//insert, update, delete의 결과는 영향을 받은 형의 갯수를 반환 == 정수 형태 == java에서 정수 자료형 == int
			result = stmt.executeUpdate(query);
			
			//트랜잭션 : 한꺼번에 수행되어야 하는 일련의 작업들
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
		
		if(result > 0) {
			System.out.println(delMemberId + " 회원 정보 삭제 완료되었습니다.");
		} else {
			System.out.println("입력하신 아이디가 없습니다.");
		}
		
	}
}
