package kr.or.iei;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PrintServlet
 */
@WebServlet("/print")
public class PrintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1) 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 추출
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String addr = request.getParameter("addr");
		
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("주소 : " + addr);
		
		//-----------------------------------------------
		
		
		//3) 페이지 형식 및 인코딩 설정
		response.setContentType("text/html; charset=UTF-8");
		
		//4) Client 응답을 위한 연결 통로(스트림) 생성
		PrintWriter out = response.getWriter();
		
		//5) 응답할 html 구문 생성
		out.println("<html>");
			out.println("<head>");
			out.println("</head>");
			out.println("<body>");
				out.println("<h1>회원 정보</h1>");
				out.printf("<span>회원 이름 : %s </span><br>", name);
				out.printf("<span>회원 나이 : %s </span><br>", age);
				out.printf("<span>회원 주소 : %s </span><br>", addr);
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
