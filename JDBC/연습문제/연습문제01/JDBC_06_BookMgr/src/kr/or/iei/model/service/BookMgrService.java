package kr.or.iei.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.iei.common.JDBCTemplate;
import kr.or.iei.model.dao.BookMgrDao;
import kr.or.iei.model.vo.Author;
import kr.or.iei.model.vo.Book;

public class BookMgrService {

	private BookMgrDao bookMgrDao;

	public BookMgrService() {
		bookMgrDao = new BookMgrDao();
	}
	
	public int insertBook(Book book) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = bookMgrDao.insertBook(conn, book);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
				
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Book> selectAllBook() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Book> list = bookMgrDao.selectAllBook(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Book> selectBookName(String searchBookName) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Book> list = bookMgrDao.selectBookName(conn, searchBookName);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Author> selectAllAuthor() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Author> list = bookMgrDao.selectAllAuthor(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Author> selectAuthorName(String searchAuthorName) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Author> list = bookMgrDao.selectAuthorName(conn, searchAuthorName);
		JDBCTemplate.close(conn);
		return list;
	}

	public int updateBook(String searchBookName) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		
		return result;
	}

	

	public int updateBook(Book selectedBook) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = bookMgrDao.updateBook(conn, selectedBook);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteBook(Book selectedBook) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
			if(selectedBook != null) {
				//(2)
				result = bookMgrDao.deletBook(conn, selectedBook);
				
				if(result > 0) {
					JDBCTemplate.commit(conn);
					//삭제 실패 경우
				} else {
					JDBCTemplate.rollback(conn);
				}
				
			}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Book> selectBookAuthor(String delAuthorName) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Book> book = bookMgrDao.selectBookAuthor(conn, delAuthorName);
		JDBCTemplate.close(conn);
		return book;
	}

	public int deleteAuthor(String delAuthorName) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
			if(delAuthorName != null) {
				//(2)
				result = bookMgrDao.deletAuthor(conn, delAuthorName);
				
				if(result > 0) {
					JDBCTemplate.commit(conn);
					//삭제 실패 경우
				} else {
					JDBCTemplate.rollback(conn);
				}
				
			}
		JDBCTemplate.close(conn);
		return result;
	}

}
