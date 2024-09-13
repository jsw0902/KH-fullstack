package kr.or.iei.controller;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Scanner;

import kr.or.iei.common.JDBCTemplate;
import kr.or.iei.model.service.BookMgrService;
import kr.or.iei.model.vo.Author;
import kr.or.iei.model.vo.Book;

public class BookMgrController {

	private Scanner sc;
	private BookMgrService bookMgrService;
	
	public BookMgrController() {
		sc = new Scanner(System.in);
		bookMgrService = new BookMgrService();
	}
	
	public void mainMtd() {
		while(true) {
			System.out.println("====================== 도서 관리 프로그램 v1 Singleton ======================");
			System.out.println("1. 도서 전체 조회");
			System.out.println("2. 도서명 조회"); 
			System.out.println("3. 도서 정보 수정"); 
			System.out.println("4. 도서 정보 삭제");
			System.out.println("5. 도서 정보 등록");
			System.out.println("6. 저자 정보 전체 조회");
			System.out.println("7. 저자명으로 조회");
			System.out.println("8. 저자 정보 삭제");
			System.out.println("0. 종료");
			System.out.print("선택 >> ");
			int sel = sc.nextInt();
			
			switch(sel) {
			case 1:
				selectAllBook();
				break;
			case 2:
				selectBookName();
				break;
			case 3:
				updateBook();
				break;
			case 4:
				deleteBook();
				break;
			case 5:
				insertBook();
				break;
			case 6:
				selectAllAuthor();
				break;
			case 7:
				selectAuthorName();
				break;
			case 8:
				deleteAuthor();
				break;
			case 0:
				return;
			default:
				System.out.println("잘못 고르셨습니다.");
				break;
			}
		}
	}
	
	public void selectAllBook() {
		System.out.println("==================도서 전체 조회==================");
		
		ArrayList<Book> list = bookMgrService.selectAllBook();
				
		if(list.isEmpty()) { //list 비워있으면
			System.out.println("도서 정보가 존재하지 않습니다.");
		} else {
			System.out.println("도서명\t도서내용\t종류\t가격\t저자명\t출간일");
			for(Book book : list) {
				System.out.println(book.getBookName() + "\t" +
								   book.getBookContent() + "\t" +
								   book.getBookKind() + "\t" +
								   book.getBookPrice() + "\t" +
								   book.getBookAuthorName() + "\t" +
								   book.getBookPublish());
				}
			}
	}
	
	public void selectBookName() {
		System.out.println("========================도서명으로 정보 조회========================");
		sc.nextLine();
		System.out.print("조회할 도서명 입력 : ");
		String searchBookName = sc.nextLine();
		
		ArrayList<Book> list = bookMgrService.selectBookName(searchBookName);
		
		if(list.isEmpty()) { 
			System.out.println("도서 정보가 존재하지 않습니다.");
		} else {
			System.out.println("도서명\t도서내용\t종류\t가격\t저자명\t출간일");
			for(Book book : list) {
				System.out.println(book.getBookName() + "\t" +
						   book.getBookContent()+ "\t" +
						   book.getBookKind() + "\t" +
						   book.getBookPrice() + "\t" +
						   book.getBookAuthorName() + "\t" +
						   book.getBookPublish());
			}
		}
	}
	
	public void updateBook() {
		System.out.println("==================도서 정보 수정==================");
		sc.nextLine();
		System.out.print("수정할 도서명 입력 : ");
		String updTitle = sc.nextLine();
		
		ArrayList<Book> list = bookMgrService.selectBookName(updTitle);
		
		if(list.isEmpty()) { 
			System.out.println("도서 정보가 존재하지 않습니다.");
		} else {
			System.out.println("넘버링\t도서명");
			int index = 1;
			for(Book book : list) {
				System.out.println(index++ + ".\t" + book.getBookName());
				
			}
			System.out.print("수정할 도서 번호 입력: ");
	        int selectIndex = sc.nextInt();
	        Book selectedBook = list.get(selectIndex - 1);
	        if(selectedBook == null) {
	        	System.out.println("수정할 도서가 존재하지 않습니다.");
	        } else {
	        	sc.nextLine();
	        	System.out.print("수정할 도서 내용 입력 : ");
				String updBookContent = sc.nextLine();
				System.out.print("수정할 도서 종류 입력 : ");
				String updBookKind = sc.next();
				System.out.print("수정할 도서 가격 입력: ");
				int updBookPrice = sc.nextInt();
				System.out.print("수정할 저자명 입력 : ");
				String updBookAuthorName = sc.next();
				if(selectedBook.getBookAuthorName().equals(updBookAuthorName)) {
					
				}
				selectedBook.setBookContent(updBookContent);
				selectedBook.setBookKind(updBookKind);
				selectedBook.setBookPrice(updBookPrice);
				selectedBook.setBookAuthorName(updBookAuthorName);
					
				int result = bookMgrService.updateBook(selectedBook);
					
				if(result > 0) {
					System.out.println("정상적으로 수정되었습니다.");
				} else {
					System.out.println("수정 중 오류가 발생하였습니다.");
				}
	        }
		}
		
	}
	
	public void deleteBook() {
		System.out.println("========================도서 정보 삭제========================");
		sc.nextLine();
		System.out.print("삭제할 도서명 입력 : ");
		String delTitle = sc.nextLine();
		
		ArrayList<Book> list = bookMgrService.selectBookName(delTitle);
		
		if(list.isEmpty()) { 
			System.out.println("도서 정보가 존재하지 않습니다.");
		} else {
			System.out.println("넘버링\t도서명");
			int index = 1;
			for(Book book : list) {
				System.out.println(index++ + ".\t" + book.getBookName());
				
			}
			System.out.print("삭제할 도서 번호 입력: ");
	        int selectIndex = sc.nextInt();
	        Book selectedBook = list.get(selectIndex - 1);
	        if(selectedBook == null) {
	        	System.out.println("삭제할 도서가 존재하지 않습니다.");
	        } else {
	        	int result = bookMgrService.deleteBook(selectedBook);
	        	
	        	if(result > 0) {
	    			System.out.println("정상적으로 삭제 되었습니다.");
	    		} else {
	    			System.out.println("삭제할 회원이 존재하지 않습니다.");
	    		}
	        }
		}
		
	}
	
	public void insertBook() {
		System.out.println("========================도서 정보 등록========================");
		sc.nextLine();
		System.out.print("등록할 도서명 입력 : ");
		String insertTitle = sc.nextLine();
		
		ArrayList<Book> list = bookMgrService.selectBookName(insertTitle);
		
		if(list.isEmpty()) {
			System.out.print("등록할 도서 내용 입력: ");
			String newBookContent = sc.nextLine();
			System.out.print("등록할 도서 종류 입력(소설, 인문학, 에세이, 경제학): ");
			String newBookKind = sc.next();
			System.out.print("등록할 도서 가격 입력: ");
			int newBookPrice = sc.nextInt();
			System.out.print("등록할 저자명 입력: ");
			String newBookAuthor = sc.next();
			System.out.print("등록할 출간일 입력(YYYY-MM-DD 형식): ");
			String newBookPublish = sc.next();
			
			Book book = new Book(insertTitle,newBookContent , newBookKind, newBookPrice, newBookAuthor, Date.valueOf(newBookPublish));
			int result = bookMgrService.insertBook(book);
			
			if(result > 0) {
				System.out.println("정상적으로 등록 되었습니다.");
			} else {
				System.out.println("등록 중 오류 다시 등록해주세요.");
			}
			
		}else {
			System.out.println("등록되어 있는 도서명입니다.");
		}
	}
	
	public void selectAllAuthor() {
		System.out.println("==================작가 전체 조회==================");
		
		ArrayList<Author> list = bookMgrService.selectAllAuthor();
				
		if(list.isEmpty()) { //list 비워있으면
			System.out.println("작가 정보가 존재하지 않습니다.");
		} else {
			System.out.println("이름명\t나이\t성별");
			for(Author author : list) {
				System.out.println(author.getAuthorName() + "\t" +
								   author.getAuthorAge() + "\t" +
								   author.getAuthorGender());
				}
			}
	}
	public void selectAuthorName() {
		System.out.println("========================저자명으로 정보 조회========================");
		System.out.print("조회할 저자명 입력 : ");
		sc.nextLine();
		String searchAuthorName = sc.nextLine();
		
		ArrayList<Author> list = bookMgrService.selectAuthorName(searchAuthorName);
		
		if(list.isEmpty()) { 
			System.out.println("저자명 정보가 존재하지 않습니다.");
		} else {
			System.out.println("이름명\t나이\t성별");
			for(Author author : list) {
				System.out.println(author.getAuthorName() + "\t" +
						   author.getAuthorAge() + "\t" +
						   author.getAuthorGender());
			}
		}
	}
	
	public void deleteAuthor() {
		System.out.println("========================저자 정보 삭제========================");
		sc.nextLine();
		System.out.print("삭제할 저자 이름 입력 : ");
		String delAuthorName = sc.nextLine();
		
		ArrayList<Author> list = bookMgrService.selectAuthorName(delAuthorName);
		ArrayList<Book> book = bookMgrService.selectBookAuthor(delAuthorName);
			
		if(list.isEmpty()) { 
			System.out.println("저자 정보가 존재하지 않습니다.");
		} else {
			boolean hasBooks = false;
	        for (Book books : book) {
	            if (books.getBookAuthorName().equals(delAuthorName)) {
	                hasBooks = true;
	                break; // 첫 번째 일치하는 책을 찾으면 반복문 종료
	            }
	        }

	        if (hasBooks) {
	        	System.out.println("삭제할 대상이 출간된 도서 정보가 존재합니다. 삭제불가");
	        } else {
	        	int result = bookMgrService.deleteAuthor(delAuthorName);
	        	System.out.println("저자 정보 삭제 성공");
	        }
		}
	}
}
