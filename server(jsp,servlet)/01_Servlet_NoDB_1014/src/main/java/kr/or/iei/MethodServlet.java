package kr.or.iei;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MethodServlet
 */
@WebServlet("/method")
public class MethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MethodServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 	클라이언트 요청 데이터 추출
		 	
		 	request.getParameter(name속성값);
		 */
		
		
		System.out.println("MethodSerlvet의 doGet() 호출");
		
		String test1  = request.getParameter("test1");
		System.out.println(test1);
		
		String loginId  = request.getParameter("loginId");
		String loginPw  = request.getParameter("loginPw");
		System.out.println("로그인 아이디 : " + loginId);
		System.out.println("로그인 비밀번호 : " + loginPw);
		
		//int number = Integer.parseInt(request.getParameter("number")); 
		//System.out.println("숫자 : " + number);
		
		String hiddenData = request.getParameter("hiddenData");
		System.out.println("히든 데이터 : " + hiddenData);
		
		String readOnlyData = request.getParameter("readOnlyData");
		System.out.println("읽기전용 : " + readOnlyData);
		
		String disableData = request.getParameter("disableData");
		System.out.println("비활성화 : " + disableData);
		
		String food = request.getParameter("food");
		System.out.println("최애 음식 : " + food);
		
		String gender = request.getParameter("gender");
		System.out.println("성별 : " + gender);
		
		//여러개 체크하면 동일한 name값으로 여러개 전송됨
		String [] hobby = request.getParameterValues("hobby");
		if(hobby != null) { 
			for(int i=0; i<hobby.length; i++) {
				System.out.println("취미 : "+ (i+1) + "번째 : " + hobby[i]);			
			}			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MethodSerlvet의 doPost() 호출");
		doGet(request, response);
		
	}

}
