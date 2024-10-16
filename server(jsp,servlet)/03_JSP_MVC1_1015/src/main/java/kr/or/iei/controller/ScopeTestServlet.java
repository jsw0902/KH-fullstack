package kr.or.iei.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ScopeTestServlet
 */
@WebServlet("/scopeTest")
public class ScopeTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScopeTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String reqData = request.getParameter("reqData");
		System.out.println("reqData : " + reqData);
		
		//session : 1개의 브라우저(동일한 브라우저내에서! 세션 만료 시, 소멸 된다)
		HttpSession session = request.getSession();
		session.setAttribute("sessionData", "sesData");
		
		//application : 서버 기동 ~ 중지할 때 사이까지 공유
		ServletContext application = request.getServletContext();
		application.setAttribute("applicationData", "appData");
		
		RequestDispatcher view = request.getRequestDispatcher("/views/scopeTest.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
