package kr.or.iei.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;

/**
 * Servlet implementation class DelMemberServlet
 */
@WebServlet("/delMemberList")
public class DelMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelMemberServlet() {
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
		
		//3) 비즈니스 로직
		MemberService service = new MemberService();
		ArrayList<Member> list = service.selectAllMember();
		
		//4) 결과 처리
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
			out.println("<head><title>전체 회원 리스트</title></head>");
			out.println("<body>");
				out.println("<h1>전체 회원 리스트</h1>");
				out.println("<hr>");
				out.println("<table border='1'>");
					out.println("<tr>");
						out.println("<th> 아이디 </th>");
						out.println("<th> 이름 </th>");
						out.println("<th> 전화번호 </th>");
						out.println("<th> 주소 </th>");
						out.println("<th> 가입일 </th>");
						out.println("<th> 삭제 </th>");
					out.println("</tr>");
					
					for(int i = 0; i<list.size(); i++) {
						Member m = list.get(i);
						
						out.println("<tr>");
							out.println("<td>"+ m.getMemberId() +"</td>");
							out.println("<td>"+ m.getMemberName() +"</td>");
							out.println("<td>"+ m.getMemberPhone() +"</td>");
							out.println("<td>"+ m.getMemberAddr() +"</td>");
							out.println("<td>"+ m.getMemberDate() +"</td>");
							out.println("<td><a href='/deletMember?memberNo="+ m.getMemberNo() +"'>삭제<a></td>");
						out.println("</tr>");
					}
				out.println("</table>");
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
