package kr.or.iei.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.iei.common.JDBCTemplate;
import kr.or.iei.model.vo.Author;
import kr.or.iei.model.vo.Book;

public class BookMgrDao {

	public ArrayList<Book> selectAllBook(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Book> list = new ArrayList<Book>();
		
		String query = "select * from BOOK_TBL";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book b = new Book();
				b.setBookName(rset.getString("BOOK_NAME"));
				b.setBookContent(rset.getString("BOOK_CONTENT"));
				b.setBookKind(rset.getString("BOOK_KIND"));
				b.setBookPrice(rset.getInt("BOOK_PRICE"));
				b.setBookAuthorName(rset.getString("AUTHOR_NAME"));
				b.setBookPublish(rset.getDate("BOOK_PUBLISH"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public ArrayList<Book> selectBookName(Connection conn, String searchBookName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Book> list = new ArrayList<Book>();
		
		String query = "select * from book_tbl where book_name like '%' || ? || '%'";
		
		try {
			//SQL을 수행하고 결과를 반환받는 객체 생성
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchBookName);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book b = new Book();
				b.setBookName(rset.getString("BOOK_NAME"));
				b.setBookContent(rset.getString("BOOK_CONTENT"));
				b.setBookKind(rset.getString("BOOK_KIND"));
				b.setBookPrice(rset.getInt("BOOK_PRICE"));
				b.setBookAuthorName(rset.getString("AUTHOR_NAME"));
				b.setBookPublish(rset.getDate("BOOK_PUBLISH"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

	public ArrayList<Author> selectAllAuthor(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Author> list = new ArrayList<Author>();
		
		String query = "select * from Author_TBL";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Author a = new Author();
				a.setAuthorName(rset.getString("AUTHOR_NAME"));
				a.setAuthorAge(rset.getInt("AUTHOR_AGE"));
				a.setAuthorGender(rset.getString("AUTHOR_GENDER"));
				
				list.add(a);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public ArrayList<Author> selectAuthorName(Connection conn, String searchAuthorName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Author> list = new ArrayList<Author>();
		
		String query = "select * from author_tbl where author_name like '%' || ? || '%'";
		
		try {
			//SQL을 수행하고 결과를 반환받는 객체 생성
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchAuthorName);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Author a = new Author();
				a.setAuthorName(rset.getString("AUTHOR_NAME"));
				a.setAuthorAge(rset.getInt("AUTHOR_AGE"));
				a.setAuthorGender(rset.getString("AUTHOR_GENDER"));
				
				list.add(a);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

	public int updateBook(Connection conn, Book selectedBook) {

		//자원 반환 객체 선언
		PreparedStatement pstmt = null;
				
		//SQL 결과 처리할 Java 자료형
		int result = 0;
		
		String query = "update book_tbl set BOOK_CONTENT = ?, BOOK_KIND = ?, BOOK_PRICE = ?, AUTHOR_NAME = ? where book_name = ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치 홀더 값 세팅
			pstmt.setString(1, selectedBook.getBookContent());
			pstmt.setString(2, selectedBook.getBookKind());
			pstmt.setInt(3, selectedBook.getBookPrice());
			pstmt.setString(4, selectedBook.getBookAuthorName());
			pstmt.setString(5, selectedBook.getBookName());
			
			//SQL 수행
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int deletBook(Connection conn, Book selectedBook) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		
		String query = "delete from book_tbl where book_name = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치 홀더 값 세팅
			pstmt.setString(1, selectedBook.getBookName());
			
			//SQL 수행
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Book> selectBookAuthor(Connection conn, String delAuthorName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Book> book = new ArrayList<Book>();
		
		String query = "select * from book_tbl where AUTHOR_NAME = ?";
		
		try {
			//SQL을 수행하고 결과를 반환받는 객체 생성
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, delAuthorName);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Book b = new Book();
				b.setBookName(rset.getString("BOOK_NAME"));
				b.setBookContent(rset.getString("BOOK_CONTENT"));
				b.setBookKind(rset.getString("BOOK_KIND"));
				b.setBookPrice(rset.getInt("BOOK_PRICE"));
				b.setBookAuthorName(rset.getString("AUTHOR_NAME"));
				b.setBookPublish(rset.getDate("BOOK_PUBLISH"));
				
				book.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return book;
	}

	public int deletAuthor(Connection conn, String delAuthorName) {

		PreparedStatement pstmt = null;
		
		int result = 0;
		
		
		String query = "delete from AUTHOR_TBL where AUTHOR_NAME = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치 홀더 값 세팅
			pstmt.setString(1, delAuthorName);
			
			//SQL 수행
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertBook(Connection conn, Book book) {
		PreparedStatement pstmt = null;
		
		//SQL 결과 처리할 Java 자료형
		int result = 0;
		
		//수행 SQL 작성
		String query = "insert into book_tbl values (?,?,?,?,?,?)";
		
		//드라이버 등록, 커넥션 생성은 Service에서 
		
		try {
			//SQL을 수행하고 결과를 반환받는 객체 생성
			pstmt = conn.prepareStatement(query);
			
			//위치 홀더 값 세팅
			pstmt.setString(1, book.getBookName());
			pstmt.setString(2, book.getBookContent());
			pstmt.setString(3, book.getBookKind());
			pstmt.setInt(4, book.getBookPrice());
			pstmt.setString(5, book.getBookAuthorName());
			pstmt.setDate(6, (Date)book.getBookPublish());
			
			//SQL 수행
			result = pstmt.executeUpdate();
			
			//트랜잭션 제어를 Service에서 담당할 것임
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
