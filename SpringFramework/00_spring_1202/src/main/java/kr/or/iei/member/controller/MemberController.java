package kr.or.iei.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

@Controller	//이 컴포넌트를 작성하면 서버 구동 시 자동으로 객체를 생성하여 IoC 컨테이너에 등록함
public class MemberController {
	
	@Autowired //IoC 컨테이너에 등록된 객체(Bean) 중에, 타입이 일치하는 객체(Bean)를 자동으로 주입받음.
	private MemberService memberService;
	
	public MemberController() {
		System.out.println("MemberController 생성");
	}
	
	@PostMapping("/member/login.kh")
	public String memberLogin(Member member, HttpSession session) {
		//1. 인코딩 - web.xml
		//2. 값 추출 - 매개변수로 전달
		//3. 비즈니스 로직
		
		//@Controller 컴포넌트를 통해, 자동으로 생성되어 IoC 컨테이너 등록된, 객체를 @Autowired가 작성된 변수에 주입받았으므로, 객체의 주소값이 출력된다.
		//System.out.println(memberService); //주소값 출력
		Member loginMember = memberService.memberLogin(member);
		
		//4. 결과 처리
		if(loginMember != null){
			session.setAttribute("loginMember", loginMember);
			return "member/loginSuccess";
		}else {
			return "member/loginFail";
		}
	}
}
