package kr.or.iei.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1)인코딩
		request.setCharacterEncoding("utf-8");
		
		//2) 값 추출
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		String memberPhone = request.getParameter("memberPhone");
		String memberAddr = request.getParameter("memberAddr");
		
		//3) 비즈니스 로직 - 회원가입 - DB 등록
		MemberService service = new MemberService();
		
		Member insMember = new Member();
		
		insMember.setMemberId(memberId);
		insMember.setMemberPw(memberPw);
		insMember.setMemberName(memberName);
		insMember.setMemberPhone(memberPhone);
		insMember.setMemberAddr(memberAddr);
		
		int result = service.insertMember(insMember);
		
		//4) 결과 처리
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		 out.println("<html>");
	        out.println("<head>");
	        out.println("<title>회원가입결과</title>");
	        out.println("</head>");
	        out.println("<body>");
	        out.println("<h1>회원 가입 결과</h1>");
	        out.println("<hr>");
	        if(result == -1) {
	        	out.println("<h3>입력한 아이디와 일치하는 회원이 존재합니다.</h3>");
	        }else if(result == 0) {
	        	out.println("<h3>회원 등록 실패</h3>");
	        }else {
	        	out.println("<h3>회원 등록 완료</h3>");
	        }
	        out.println("</body>");
	     out.println("</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
