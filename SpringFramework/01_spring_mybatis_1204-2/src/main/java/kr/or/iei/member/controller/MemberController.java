package kr.or.iei.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@GetMapping("/member/joinFrm.kh")
	public String joinFrm() {
		return "member/join";
	}
	
	@PostMapping("/member/join.kh")
	public String join(Member member) {
		
		int result = memberService.join(member);
		
		if(result > 0) {
			return "redirect:/";
		}else {
			return "member/joinFrm";
		}
		
	}
	
	@GetMapping("/member/idDuplChk.kh")
	@ResponseBody
	public String idDuplChk(String memberId) {
		
		int cnt = memberService.idDuplChk(memberId);
		
		return String.valueOf(cnt);
	}
	
	@GetMapping("/member/delete.kh")
	public String delete(String memberId, HttpSession session) {
		int result = memberService.delete(memberId);
		
		if(result > 0){
			return "redirect:/member/logout.kh";
		}else {
			return "member/deleteFail";			
		}
	}
	
	@GetMapping("/member/logout.kh")
	public String logoOut(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/member/allMemberList.kh")
	public String allMember(Model model) {
		
		ArrayList<Member> list = memberService.allMemberList();
		model.addAttribute("memberList", list);
		
		return "member/allMember"; 
	}
	
	@GetMapping("/member/mypage.kh")
	public String mypage() {
		
		return "member/mypage";
	}
	
	@PostMapping("/member/update.kh")
	public String updateMember(Member member, HttpSession session) {
	    int result = memberService.updateMember(member);
	    
	    if (result > 0) {
	    	 session.setAttribute("loginMember", member);
	        return "redirect:/"; // 마이페이지로 리다이렉트
	    } else {
	        return "member/updateFail"; // 수정 실패 시 실패 페이지로 이동
	    }
	}
}
