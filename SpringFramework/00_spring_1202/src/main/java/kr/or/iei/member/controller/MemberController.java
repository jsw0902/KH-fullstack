package kr.or.iei.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

@Controller	//이 컴포넌트를 작성하면 서버 구동 시 자동으로 객체를 생성하여 IoC 컨테이너에 등록함
@RequestMapping("/member/") //현재 컨트롤러 내부에 작성된 메소드로 요청 시, 모두 시작 URL이 동일하므로 공통 URL 설정
public class MemberController {
	
	@Autowired //IoC 컨테이너에 등록된 객체(Bean) 중에, 타입이 일치하는 객체(Bean)를 자동으로 주입받음.
	@Qualifier("memberService") //IoC 컨테이너에 등록된 객체(Bean) 중에, 명칭이 동일한 객체(Bena)을 주입받기 위함.
	private MemberService memberService;
	
	public MemberController() {
		System.out.println("MemberController 생성");
	}
	
	@PostMapping("login.kh")
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
	
	@GetMapping("joinFrm.kh")
	public String joinFrm() {
		//prefix : /WEB-INF/views/
		//suffix : .jsp
		return "member/join";
	}
	
	@PostMapping("join.kh")
	public String join(Member member) {
		/*
		System.out.println(member.getMemberId());
		System.out.println(member.getMemberPw());
		System.out.println(member.getMemberName());
		System.out.println(member.getMemberPhone());
		System.out.println(member.getMemberAge());
		System.out.println(member.getMemberGender());
		*/
		
		//1. 인코딩 - 필터
		//2. 값 추출 - 매개변수에 작성된 member에 세팅
		//3. 비즈니스 로직
		int result = memberService.join(member);
		
		//결과 처리
		//result > 0 == joinSuccess.jsp
		//else		 == joinFail.jsp
		if(result > 0) {
			return "member/joinSuccess";
		}else {
			return "member/joinFail";
		}
		
	}
	
	@GetMapping("logout.kh")
	public String logout(HttpSession session) {
		session.invalidate();
		
		//서블릿 프로젝트에서 responese.sendRedirect와 같은 역할
		return "redirect:/";
	}
	
	@GetMapping("mypage.kh")
	public String mypage() {
		
		return "member/mypage";
	}
	@GetMapping("delete.kh")
	public String delete(String memberId) {
		int result = memberService.delete(memberId);
		
		if(result > 0){
			return "redirect:/member/logout.kh";
		}else {
			return "member/deleteFail";			
		}
	}
	
	@GetMapping("allMemberList.kh")
	public String allMember(Model model) {//데이터를 등록하고 응답할 떄 사용되는 객체
		
		ArrayList<Member> list = memberService.allMemberList();
		model.addAttribute("memberList", list);
		
		return "member/allMember"; 
	}
	
	@GetMapping("idDuplChk.kh")
	@ResponseBody
	public String idDuplChk(String memberId) {
		
		int cnt = memberService.idDuplChk(memberId);
		
		return String.valueOf(cnt);	
	}
}
