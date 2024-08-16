package kr.or.iei.start;

import java.util.Scanner;

import kr.or.iei.model.vo.Book;
import kr.or.iei.controller.StudentController;
import kr.or.iei.model.vo.*;

public class Start {

	public static void main(String[] args) {
/*		
		
		 * 도서명(bookname), 저자(author), 가격(price), 출판사(publisher) 속성을 가진, 
		 * Book 클래스 생성
		 * 
		 * 변수, 생성자(기본, 일반), getter, setter 생성..
		 * 
		 * 클래스 작성 후, Book 객체를 생성하고 초기화
		 * 3개 객체 생성
		 * 사용자 입력을 받아서, 입력받은 값으로 찰당.
		 * 반복문 활용
		 * 1번째 객체는 매개변수 있는 생성자 활용하여 초기화.
		 * 2번째 객체는 기본 생성자로 객체화 후, setter 메소드를 이용하여 초기화
		 */
		/*
		Scanner sc = new Scanner(System.in);
		
		Book book1 = null;
		Book book2 = null;
		Book book3 = null;
		
		for(int i=0; i<3; i++) {
			System.out.print("도서명 : ");
			String bookName = sc.nextLine();
			System.out.print("저자명 : ");
			String author = sc.nextLine();
			System.out.print("가격 : ");
			int price = sc.nextInt();
			sc.nextLine();
			String publisher = sc.nextLine();
			
			if(i == 0) {
				book1 = new Book(bookName, author, price, publisher);
			} else if (i == 1) {
				book2 = new Book(bookName, author, price, publisher);
				
			} else {
				book3 = new Book(bookName, author, price, publisher);
			}
			//Book book = new Book();
		}
		
		
		//================================= 객체 배열 ============================================
		/*
		 * 객체 배열 : 기본 자료형의 배열과 동일하게 선언하고, 할당한다. 단 자료형 위ㅣㅊ에 클래스명을 작성.
		 * 
		 * [객체 배열 작성법]
		 * 글래스 [] 객체배열명 = new 클래스[배열길이];
		 *
		 * 
		 * 
		 */
/*		
		Book [] bookArr = new Book[3]; //Book 객체가 늘어갈 수 있는 객체 배열 생성
		
		//할당 v1
		Book book1 = new Book();
		book1.setBookname("도서명 1");
		book1.setAuthor("장승원");
		book1.setPrice(232343);
		book1.setPublisher("교보출판사");
		
		bookArr[0] = book1; //Book 객체 배열에 Book 객체
		
		Book book2 = new Book("도서명2", "장승원", 152000, "교보출판사");
		bookArr[1] = book2;
		
		Book book3 = new Book("도서명3", "원승장", 52000, "출판사명");
		bookArr[2] = book3;
		
		//할당 v2
		bookArr[0] = new Book("도서명4", "장승원", 232323, "출판사명2");
		bookArr[1] = new Book("도서명5", "장승원", 232323, "출판사명3");
		bookArr[2] = new Book("도서명6", "장승원", 232323, "출판사명4");
		
		//할당 v3
		Book [] bookArr2 = {
				new Book("도서명7", "장승원", 32323, "출판사"),
				new Book("도서명8", "장승원", 32323, "출판사"),
				new Book("도서명9", "장승원", 32323, "출판사")
		};
		
		//할당 v4 - 반복문 활용
		Book [] bookArr3 = new Book[3];
		for(int i = 0; i<bookArr3.length; i++) {
			bookArr3[i] = new Book("도서명10", "장승원", 23145646, "출판사명");
		}
		
		//Book 객체 배열에는, 각 인덱스에 Book 객체가 할당되어 있으므로, 변수의 자료형 또한 Book
		Book book = bookArr[0];
		
		Book [] bookArr4 = new Book[3]; //0,1,2번 인덱스
		bookArr4[2] = new Book(); //아래 Book 객체의 멤버에 접근하기 위해서는, Book 객체를 할당(초기화) 해주어야 한다.
		bookArr4[2].getAuthor(); //NullPointerException 오류 발생 : 객체 배열의 각 인덱스에 Book 객체가 할당되지 않았음.
*/		
		/*
		 // 예시
		Book [] bookArr4 = new Book[3]; //0,1,2번 인덱스
		bookArr4[2].getAuthor();
		
		//위에 처럼 사용하게 되면
		Book.getAuthor가 아니라 Null.getAuthor()를 사용하는 것
		 */
		
		
		//Product 객체가 들어갈 길이가 5인 객체배열
		//Member 객체가 들어갈 길이가 5인 객체배열
		/*
		Product [] productArr= {
			new Product(87000, "스투시 반팔", "스투시"),
			new Product(187000, "스투시 후드티", "스투시"),
			new Product(287000, "스투시 바람막이", "스투시"),
			new Product(110000, "뉴발란스 530", "뉴발란스"),
			new Product(179000, "나이키 바람막이", "나이키")
		};
		System.out.println(productArr); //Product 객체 배열의 주소
		System.out.println(productArr[0]); //Product 객체 배열의 0번째 인덱스에 있는, Product 객체의 주소
		System.out.println(productArr[0].getBrand());
		
		Member [] memberArr = new Member[5];
		
		memberArr[0] = new Member("jsw0902", "qwer1234", "장승원", "남자", "경기도 남양주시", 23,"2024-08-12");
		memberArr[1] = new Member("jsw020902", "qwer123", "승장원", "남자", "경기도 남양주시", 23,"2024-08-12");
		memberArr[2] = new Member("jsw92", "qwer12", "원승장", "남자", "경기도 남양주시", 23,"2024-08-12");
		memberArr[3] = new Member("jsw292", "qwer1", "장승우원", "여자", "경기도 남양주시", 23,"2024-08-12");
		memberArr[4] = new Member("jsw20902", "qwer", "장승원원", "여자", "경기도 남양주시", 23,"2024-08-12");
*/		
		
		StudentController studentController = new StudentController();
		studentController.mainMtd();
	}

}
