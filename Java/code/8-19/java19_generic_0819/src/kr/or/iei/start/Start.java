package kr.or.iei.start;

import kr.or.iei.controller.TestController;
import kr.or.iei.model.vo.Baseball;
import kr.or.iei.model.vo.Basketball;
import kr.or.iei.model.vo.GenericEx;
import kr.or.iei.model.vo.Soccer;
import kr.or.iei.model.vo.User;
import kr.or.iei.model.vo.User2;
import kr.or.iei.model.vo.User3;
import kr.or.iei.model.vo.Sports;
public class Start {

	public static void main(String[] args) {
		/*
		User user1 = new User();
		user1.setName("장승원");
		user1.setAge(23);
		user1.setBasketball(new Basketball("fast", 10, "농구복"));
		
		if(user1.getBaseBall() != null) {
			//야구 정보
			
		}else if(user1.getBasketball() != null) {
			//농구 정보
			
		} else if(user1.getSoccer() != null) {
			//축구 정보
			
		}
		*/
		Baseball base;
		
		User<Soccer> user1 = new User<Soccer>(); //User 클래스 hobby 변수의 타입을 Soccer 지정.
		user1.setName("장승원");
		user1.setAge(23);
		System.out.println(user1.getHobby()); //null. 타입만 Soccer일뿐 실제 참조하는 Soccer 주소를 할당받지 않음.
		user1.setHobby(new Soccer("more fast", 22, "축구복"));
		System.out.println("user1의 취미 정보 : " + user1.getHobby().getHowToMove());
		
		//매개변수 생성자를 이용
		User<Baseball> user2 = new User<Baseball>("호날두 ", 38, new Baseball("조금 느리게", 18, "야구복"));
		
		//제네릭 타입이 2개인 User2 객체 생성
		User2<String, Integer> user3 = new User2<String, Integer>();
		
		//User<GenericEx> user4 = new User<GenericEx>();
		
		//제네릭의 상한 제한
		User3<Sports> user5 = new User3<Sports>();
		User3<Soccer> user6 = new User3<Soccer>();
		User3<Baseball> user7 = new User3<Baseball>();
		//User3<GenericEx> user8 = new User3<GenericEx>(); //User3은 Sports 클래스를 상속받은 타입만 지정 가능하다.
		
		//제네릭의 하한 제한
		TestController test = new TestController();
		//user1 == Soccer
		//user2 == Baseball
		
		//제네릭의 상한 제한
		test.testMtd(user2); //User2는 Baseball 취미
		//test.testMtd(user1); //User1은 Soccer가 취미
		User<Sports> user8 = new User<Sports>();
		test.testMtd(user8);
		/*
		User<Object> user9 = new User<Object>();
		test.testMtd(user9);
		*/
	}

}
