package kr.or.iei;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.model.vo.Member;
import kr.or.iei.model.vo.Student;

/**
 * Servlet implementation class Exam2Servlet
 */
@WebServlet("/exam2")
public class Exam2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	ArrayList<Member> members;
    public Exam2Servlet() {
        super();
        members = new ArrayList<Member>();
        members.add(new Member("a1234", "0000", "장승원", 23));
        members.add(new Member("b1234", "1111", "호날두", 27));
        members.add(new Member("c1234", "2222", "메시", 30));
        members.add(new Member("d1234", "3333", "음바페", 26));
        members.add(new Member("abc1234", "4444", "홀란드", 24));
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		boolean srchChk = false;
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
			out.println("<head>");
			out.println("</head>");
			out.println("<body>");
				out.println("<h1>회원 정보</h1>");
				
		for(int i = 0; i<members.size(); i++) {
			Member member = members.get(i);
			String memid = member.getMemberId();
			String mempw = member.getMemberPw();
			
			if(memberId.equals(members.get(i).getMemberId()) &&
					memberPw.equals(members.get(i).getMemberPw())) {
				srchChk = true;
				
				out.println("<span>회원 아이디 :" + member.getMemberId() + " </span><br>");
				out.println("<span>회원 비밀번호 :" + member.getMemberPw() + " </span><br>");
				out.println("<span>회원 이름 :" + member.getMemberName() + " </span><br>");
				out.println("<span>회원 나이 :" + member.getMemberAge() + " </span><br>");
			}
		}
		
		if(!srchChk) {
			//학생 정보를 찾지 못한 경우
			out.println("<h3> 회원 존재하지 않습니다. </h3>");
			
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
