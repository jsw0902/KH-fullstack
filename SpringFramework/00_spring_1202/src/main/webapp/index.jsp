<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello Spring~!</h1>
	
	<%--
		
		Framework : 개발에 필요한 기본적인 기능들을 일정한 구조와 규칙대로 미리 구현해둔 틀,
					개발자가 효율적으로 애플리케이션을 만들 수 있도록 재사용 가능한 코드들과 도구들의 집합.
					
		Spring Framework : Java 기반의 엔터프라이즈급(기업용 or 대규모) 애플리케이션을 개발하기 위한 경량 프레임워크
		
		Maven : 자바용 프로젝트 빌드 관리 도구.
				기존 라이브러리 파일들을 다운로드 받아서 /WEB-INF/lib 추가하는 방식에서,
				pom.xml(Project Object Model) 파일에 자바 버전이나 라이브러리 버전 정보를 추가해서 통합하여 관리하는 방식.
				
		IOC와 DI
		
		- IOC (Inversion of Control) : 제어의 역전 or 제어의 역행이라는 의미.
									   Spring framework에서 객체들을 Bean이라고 얘기한다.
									   프로그램 구동에 필요한 객체들을 Ioc 컨테이너가 관리한다.
		- DI () : 의존성 주입이라는 의미를 가짐. Ioc 컨테이너가 관리하는 Bean을 자동으로 읽어와 객체에 주입 
		
		Spring MVC 
			- DispatcherServlet : 유일한 서블릿 클래스로써, 클라이언트 요청이 들어오면 컨트롤러에 해당 요청을 위임하는 역할
			- HandlerMapping : 각 컨트롤러 메소드별 URL 정보를 가지고 있다가, DispatcherServlet이 적절한 컨트롤러에 요청할 수 있도록 지원함.
			- Controller : 클라이언트 요청에 대해서 처리하고, 적절한 View나 Model를 반환하는 역할
			- ViewResolver : 컨트롤러가 반환하는 논리적인 뷰 이름을 실제 뷰 페이지 경로로 변환하는 역할
			
	 --%>
	 
	 <hr>

	 <h2>Spring GET, POST 처리</h2>

	 <h3>
		<a href="/getTest.kh">GET 요청 테스트</a>
	 </h3>
	 <form action="/postTest.kh" method="post">
		<input type="submit" value="POST 테스트 요청">
	 </form>

	 <h2>서블릿 VS 스프링 요청 파라미터 처리</h2>
 	 <h2>기존 Servlet 서블릿 방식</h2>
	 <form action="/servletParamTest.kh" method="get">
	 	ID : <input type="text" name="testId"> <br>
	 	PW : <input type="text" name="testPw"> <br>
	 	<input type="submit" value="서블릿 파라미터 테스트">
	 </form>
	 
	 <h3>Spring 방식 - 1</h3>
	 <form action="/springParamTest.kh" method="post">
	 	ID : <input type="text" name="testId"> <br>
	 	PW : <input type="text" name="testPw"> <br>
	 	<input type="submit" value="스프링 파라미터 테스트1">
	 </form>
	 
	 <h3>Spring 방식 - 2</h3>
	 <form action="/springParamTest2.kh" method="post">
	 	ID : <input type="text" name="memberId"> <br>
	 	PW : <input type="text" name="memberPw"> <br>
	 	Name : <input type="text" name="memberName"> <br>
	 	Phone : <input type="text" name="memberPhone"> <br>
	 	<input type="submit" value="스프링 파라미터 테스트2">
	 </form>
	 
	 <h2> 서블릿 VS 스프링 응답 데이터 처리 </h2>
	 
	 <h3><a href="/servletResponseTest.kh">서블릿 방식</a></h3>
	 <h3><a href="/springResponseTest1.kh">스프링 방식 - 1</a></h3>
	 <h3><a href="/springResponseTest2.kh">스프링 방식 - 2</a></h3>
	 
	 
	 <h3>스프링 요청 및 응답 처리</h3>
	 <form action="/springReqAndResTest.kh" method="post">
	 	ID : <input type="text" name="memberId"> <br>
	 	PW : <input type="text" name="memberPw"> <br>
	 	<input type="submit" value="스프링 요청 및 응답">
	 </form>
	 
	 <hr>
	 
	 <c:if test="${empty loginMember}">
		<form action="/member/login.kh" method="post">
			아이디 : <input type="text" name="memberId"> <br>
			비밀번호 : <input type="text" name="memberPw"> <br>
			<input type="submit" value="로그인">
		</form>	 
	 </c:if>
	 
</body>
</html>