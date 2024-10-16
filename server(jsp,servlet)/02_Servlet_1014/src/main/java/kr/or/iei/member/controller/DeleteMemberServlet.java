package kr.or.iei.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.member.model.service.MemberService;

/**
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet("/deletMember")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1) 인코딩
		request.setCharacterEncoding("utf-8");
		//2) 값 추출
		String memberNo = request.getParameter("memberNo");
		System.out.println("a 태그로 전달한 회원번호 : " + memberNo);
		//3) 비즈니스 로직 - 회원삭제
		MemberService service = new MemberService();
		int result = service.deleteMember(memberNo);
		
		//4) 결과처리
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
			out.println("<head><title>회원 정보 삭제 결과</title></head>");
			out.println("<body>");
				out.println("<h1>회원 정보 삭제 결과</h1>");
				out.println("<hr>");
				if(result>0) {
					out.println("<h3>회원 정보 삭제 완료!</h3>");
				} else {
					out.println("<h3>회원 정보 삭제 실패...</h3>");
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
