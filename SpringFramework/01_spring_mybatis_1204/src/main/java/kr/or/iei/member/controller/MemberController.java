package kr.or.iei.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired 
	@Qualifier("service") 
	private MemberService memberService;
	
	@PostMapping("/member/login.kh")
	public String memberLogin(Member member, HttpSession session) {
		// 1. 인코딩 - 필터
		// 2. 값 추출 - 매개변수에 작성된 member에 할당되어있다.
		// 3. 로직 - 로그인
		
		//MemberService 클래스 상단에, Service 어노테이션(컴포넌트)을 작성하여, 서버 구동 시 자동으로 생성된 객체(Bean)를 Autowired 
		//어노테이션을 통해 주입받았으므로, new 연산자(객체 생성) 없이 사용이 가능하다.
		
		Member loginMember = memberService.memberLogin(member);
		
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			return "redirect:/";
		}else {
			return "member/loginFail";			
		}
		
	}

}