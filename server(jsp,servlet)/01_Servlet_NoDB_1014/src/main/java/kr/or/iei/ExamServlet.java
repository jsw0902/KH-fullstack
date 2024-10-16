package kr.or.iei;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.iei.model.vo.Student;

/**
 * Servlet implementation class ExapServlet
 */
@WebServlet("/exam")
public class ExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	ArrayList<Student> students;
    public ExamServlet() {
        super();
        students = new ArrayList<Student>();
        students.add(new Student("카리나", 20, "부천"));
        students.add(new Student("윈터", 23, "서울"));
        students.add(new Student("오해원", 22, "부산"));
        students.add(new Student("호날두", 30, "대전"));
        students.add(new Student("메시", 40, "제주도"));
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1) 인코딩
		request.setCharacterEncoding("UTF-8");
		
		//2) 값 추출
		String studentName = request.getParameter("studentName");
		
		boolean srchChk = false;
		
		//페이지 형식 및 인코딩 설정
		response.setContentType("text/html; charset=UTF-8");
		
		//응답 연결로 생성
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
			out.println("<head>");
			out.println("</head>");
			out.println("<body>");
				out.println("<h1>회원 정보</h1>");
		
		//3) 비즈니스 로직
		for(int i=0; i<students.size(); i++) {
			Student student = students.get(i);
			String name = student.getStudentName();
			
			if(name.equals(studentName)) {
				srchChk = true;
				out.println("<span>학생 이름 :" + student.getStudentName() + " </span><br>");
				out.println("<span>학생 나이 :" + student.getStudentage() + " </span><br>");
				out.println("<span>학생 주소 :" + student.getStudentAddr() + " </span><br>");
			}
		}
		
		if(!srchChk) {
			//학생 정보를 찾지 못한 경우
			out.println("<h3> 학생 정보 조회 실패 </h3>");
			
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
