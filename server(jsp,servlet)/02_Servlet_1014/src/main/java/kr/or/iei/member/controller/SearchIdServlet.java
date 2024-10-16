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
 * Servlet implementation class SearchIdServlet
 */
@WebServlet("/searchId")
public class SearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1)인코딩
		request.setCharacterEncoding("UTF-8");
		
		//2) 값 추출
		String searchId = request.getParameter("searchId");
		
		//3) 비즈니스 로직 처리
		MemberService service = new MemberService();
		Member member = service.selectIdMember(searchId);
		
		//4)결과 처리
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head><title>아이디로 회원 조회</title></head>");
		out.println("<body>");
			out.println("<h1>아이디로 회원조회 결과</h1>");
			out.println("<hr>");
			if(member == null) {
				out.println("<h3>회원 정보가 존재하지 않습니다. </h3>");
			}else {
				out.println("<ul>");
				out.println("<li> 회원 번호 : " + member.getMemberNo() + " </li>");
				out.println("<li> 아이디 : " + member.getMemberId() + " </li>");
				out.println("<li> 비밀번호 : " + member.getMemberPw() + " </li>");
				out.println("<li> 이름 : " + member.getMemberName() + " </li>");
				out.println("<li> 전화 번호 : " + member.getMemberPhone() + " </li>");
				out.println("<li> 주소 : " + member.getMemberAddr() + " </li>");
				if(member.getMemberLevel() == 1) {
					out.println("<li>관리자</li>");
				}else if(member.getMemberLevel() == 2){
					out.println("<li>정회원</li>");
				} else {
					out.println("<li>준회원</li>");
				}
				out.println("<li> 가입일 : " + member.getMemberDate() + " </li>");
				out.println("</ul>");
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
