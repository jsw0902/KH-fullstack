package kr.or.iei.oop.chap05;

public class Start {

	public static void main(String[] args) {
		/*
		 요구사항)
		 
		 쇼핑몰 웹 사이트를 개발하려고 한다.
		 상품 정보를 저장할 데이터 클래스를 생성하라
		 상품 정보에는 상품 이름(productName), 가격(price), 브랜드(brand)가 존재한다.
		 기본 생성자, 매개변수가 있는 생성자를 작성하고, Start 클래스에서
		 2개의 상품 객체를 생성한다.
		 단, 1개의 상품 객체는 객체 생성 후, setter를 이용하여 각 정보를 초기화하고
		 나머지 1개의 상품 객체는 객체 생성과 동시에 생성자를 이용하여 초기화하라
		 
		 클래스명 : Product
		 */
		
		// 요구사항 1
				/*
				Product pd1 = new Product();
				
				pd1.setBrand("뉴발란스");
				pd1.setPrice(120000);
				pd1.setProductName("뉴발란스 530");
				
				System.out.println("브랜드 : " + pd1.getBrand());
				System.out.println("상품명 : " + pd1.getProductName());
				System.out.println("가격 : " + pd1.getPrice());
				
				System.out.println("================================================");
				
				Product pd2 = new Product(87000, "stussy 반팔", "stussy"); //매개변수 있는 생성자
				
				System.out.println("브랜드명 : " + pd2.getBrand());
				System.out.println("상품명 : " + pd2.getProductName());
				System.out.println("가격 : " + pd2.getPrice());
				*/
		
		/*
		 * 
		 요구사항 2)
		 회원 정보를 관리하고자 한다
		 회원의 정보를 저장할 데이터 클래스를 생성하라
		 회원 정보에는 회원아이디(memberId), 회원 비밀번호(memberPw), 회원 이름(memberName), 회원 나이(memberAge),
		 			회원 주소(memberAddr), 회원 성별(memberGender), 가입일(enrollDate)가 존재한다.
		 			
		 			
		 			memberId = String
		 			memberPw = String
		 			memberName = String
		 			memberAge = int
		 			memberAddr = String
		 			memberGender = String
		 			enrollDate = String
		 			
		 			단, 데이터 클래스 내부에 매개변수가 있는 생성자를 작성하고,
		 			Start 클래스에서 총 2명의 회원 객체를 생성한다.
		 			1명의 회원 정보 초기화는 setter() 메소드를 활용하고,
		 			나머지 1명의 회원 정보 초기화는 매개변수가 있는 생성자를 활용하여 초기화하여라
		 			
		 			초기화 이후, 2명의 회원객체에 대한 모든 정보를 출력하라.
		 			
		 			클래스명 : Member
		 			
		 * 
		 */
		
		/*
		//요구사항 2
		Member memb1 = new Member();
		
		memb1.setMemberId("2090wsj");
		memb1.setMemberPw("wkdtmddnjs92");
		memb1.setMemberName("장멸치");
		memb1.setMemberAddr("경기도 안성시");
		memb1.setMemberGender("여자");
		memb1.setMemberAge(25);
		memb1.setEnrollDate("2002년9월2일");
		
		Member memb2 = new Member("jsw0902", "wkdtmddnjs", "장승원", "남자", "경기도 남양주시", 23, "2024년8월9일");
		
		System.out.println("아이디 : " + memb1.getMemberID());
		System.out.println("비밀번호 : " + memb1.getMemberPw());
		System.out.println("고객 이름 : " + memb1.getMemberName());
		System.out.println("고객 성별 : " + memb1.getMemberGender());
		System.out.println("고객 주소: " + memb1.getMemberAddr());
		System.out.println("고객 나이: " + memb1.getMemberAge());
		System.out.println("가입일 : " + memb1.getEnrollDate());
		
		System.out.println("==========================================================================================");
		
		System.out.println("아이디 : " + memb2.getMemberID());
		System.out.println("비밀번호 : " + memb2.getMemberPw());
		System.out.println("고객 이름 : " + memb2.getMemberName());
		System.out.println("고객 성별 : " + memb2.getMemberGender());
		System.out.println("고객 주소: " + memb2.getMemberAddr());
		System.out.println("고객 나이: " + memb2.getMemberAge());
		System.out.println("가입일 : " + memb2.getEnrollDate());
		*/
		
		/*
		 요구사항3)
		 도서 정보를 관리할 도서 관리 프로그램을 개발하고자 한다.
		 
		 도서 1권에 대한 정보는 도서명(booName), 도서 가격(bookPrice), 도서 저자(bookAuthor),
		 					출판사(publisher)로 한다
		 도서 정보를 저장할 데이터 클래스(bookInfo)를 생성하고
		 총 2개의 도서 정보 객체를 생성하라.
		 
		 1개의 객체는 setter()
		 그 외 1개의 객체는 매개변수 있는 생성자로 활용하여 초기화
		 
		 
		 */
		
		//요구사항 3
		BookInfo bi1 = new BookInfo();
		bi1.setBookName("호날두 자소전");
		bi1.setBookPrice(99999);
		bi1.setBookAuthor("크리스티아누 호날두");
		bi1.setPublisher("킹갓두");
		
		
		BookInfo bi2 = new BookInfo("정몽규 자소전", 7000, "정몽규", "정몽규 나가");
		
		System.out.println("도서명 : " + bi1.getBookName());
		System.out.println("가격 : " + bi1.getBookPrice());
		System.out.println("저자명 : " + bi1.getBookAuthor());
		System.out.println("출판사 : " + bi1.getPublisher());
		
		System.out.println("=====================================================================");
		
		System.out.println("도서명 : " + bi2.getBookName());
		System.out.println("가격 : " + bi2.getBookPrice());
		System.out.println("저자명 : " + bi2.getBookAuthor());
		System.out.println("출판사 : " + bi2.getPublisher());
	}

}
