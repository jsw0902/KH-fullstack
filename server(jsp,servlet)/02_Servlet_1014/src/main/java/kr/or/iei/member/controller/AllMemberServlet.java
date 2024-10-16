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
 * Servlet implementation class AllMemberServlet
 */
@WebServlet("/allMember")
public class AllMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1) 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		//2)  값 추출 -> 없음
		
		//3) 비즈니스 로직 처리
		MemberService service = new MemberService();
		ArrayList<Member> list =  service.selectAllMember();
		
		//4)결과 처리
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
			out.println("<title>전체 회원조회</title>");
		out.println("</head>");
		out.println("<body>");
			out.println("<table border='1'>");
			out.println("<tr>");
				out.println("<th>번호</th>");
				out.println("<th>아이디</th>");
				out.println("<th>비밀번호</th>");
				out.println("<th>이름</th>");
				out.println("<th>전화번호</th>");
				out.println("<th>주소</th>");
				out.println("<th>등급</th>");
				out.println("<th>가입일</th>");
			out.println("</tr>");
			for(int i=0; i<list.size(); i++) {
				Member m = list.get(i);
				out.println("<tr>");
					out.println("<td>" + m.getMemberNo() + "</td>");
					out.println("<td>" + m.getMemberId()+ "</td>");
					out.println("<td>" + m.getMemberPw()+ "</td>");
					out.println("<td>" + m.getMemberName()+ "</td>");
					out.println("<td>" + m.getMemberPhone()+ "</td>");
					out.println("<td>" + m.getMemberAddr()+ "</td>");
					if(m.getMemberLevel() == 1) {
						out.println("<td>관리자</td>");
					}else if(m.getMemberLevel() == 2) {
						out.println("<td>정회원</td>");
					}else if(m.getMemberLevel() == 3) {
						out.println("<td>준회원</td>");
					}
					out.println("<td>" + m.getMemberDate()+ "</td>");
				out.println("</tr>");
			}
			out.println("</table>");
			out.println("<a href='/'>메인으로</a>");
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
