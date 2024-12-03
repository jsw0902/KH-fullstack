package kr.or.iei;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;


@Controller
public class AjaxController {
	
	
	@GetMapping("/ajax/movePage.kh")
	public String movePage() {
		return "ajax/ajaxTest";
	}
	
	//1. 기존 서블릿 방식의 Ajax 통신
	@GetMapping("/ajax/ajaxTest1.kh")
	public void ajaxTest1(HttpServletResponse response, String str, int num) throws IOException {
		String resData = "Ajax 요청 시, 전달 문자열 : " + str + ", 전달 숫자 : " + num;
		
		response.setContentType("text/html; charset=utf-8"); 	//응답 형식 지정
		
		response.getWriter().print(resData);
		
	}
	
	//2. 스프링에서의 Ajax 통신
	//value : 클라이언트 요청 URL, produces : 응답 데이터 통신
	@GetMapping(value="/ajax/ajaxTest2.kh", produces="text/html; charset=utf-8")
	@ResponseBody
	public String ajaxTest2(String str, int num) {
		String resData = "Ajax 요청 시, 전달 문자열 : " + str + ", 전달 숫자 : " + num;
		
		return resData;
	}
	
	//3. 기존 서블릿 방식 - 응답 데이터 다수 처리
	@GetMapping("/ajax/ajaxTest3.kh")
	public void ajaxTest3(HttpServletResponse response, String str, int num) throws IOException {
		String resData1 = "Ajax 요청 시 전달 문자열 : " + str;
		String resData2 = "Ajax 요청 시 전달 숫자 : " + num;
		
		/*
		response.setContentType("text/html; charset=utf-8"); //응답 형식 지정
		response.getWriter().print(resData1);
		response.getWriter().print(resData2);
		*/
		
		/*
		JSONArray jsonArr = new JSONArray();
		jsonArr.add(resData1);
		jsonArr.add(resData2);
		
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(jsonArr);
		*/
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("res1", resData1);
		jsonObj.put("res2", resData2);
		
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(jsonObj);
	}
	
	//4. 스프링 방식 - 응답 데이터 다수 처리
	//application/json; 	: 응답 데이터를 json 오브젝트 형태로 응답.
	@GetMapping(value="/ajax/ajaxTest4.kh", produces="application/json; charset=utf-8")
	@ResponseBody
	public String ajaxTest4(String str, int num) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("res1", str);
		jsonObj.put("res2", num);
		
		return jsonObj.toJSONString();
	}
	
	@GetMapping(value="/ajax/ajaxTest5.kh", produces="application/json; charset=utf-8")
	@ResponseBody
	public String ajaxTest5() {
		
		Member member = new Member("admin111", "1234", "관리자1111", "010-1234-1234", "23", "M", "24/12/03");
		
		/*
		JSONObject jsonObj = new JSONObject();		
		jsonObj.put("memberId", member.getMemberId());
		jsonObj.put("memberPw", member.getMemberPw());
		jsonObj.put("memberName", member.getMemberName());
		jsonObj.put("memberPhone", member.getMemberPhone());
		jsonObj.put("memberAge", member.getMemberAge());
		jsonObj.put("memberGender", member.getMemberGender());
		jsonObj.put("enrollDate", member.getEnrollDate());
		return jsonObj.toJSONString();
		*/
		
		return new Gson().toJson(member);
		
		
	}
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService; 
	
	@GetMapping(value="/ajax/ajaxTest6.kh", produces="application/json; charset=utf-8")
	@ResponseBody
	public String ajaxTest6() {
		
		//전체 회원 조회 결과 리스트
		ArrayList<Member> list = memberService.allMemberList();
		
		return new Gson().toJson(list);
	}
}
