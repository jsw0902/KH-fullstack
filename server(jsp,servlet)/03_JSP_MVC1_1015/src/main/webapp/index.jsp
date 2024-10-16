<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP(Java Server Page)</h1>
	<p>
		JSP란, HTML내에서 자바 언어를 사용할 수 있는 서버측 언어 <br>
		Servlet에서 응답화면(HTML)을 구현했던 복잡한 처리를 간단하게 해결이 가능 <br><br>
		
		- 장점) <br>
		1. Servlet에서는 비즈니스 로직만 처리할 수 있고, 응답화면은 JSP에서 생성하기 때문에 역할이 분리 <br>
		2. HTML 내에서 자바 언어를 사용해서, 동적인 페이지 처리가 가능하다. <br><br>
		
		- 부가정보) <br>
		JSP는 동적으로 컴파일되기 때문에, 수정 후에 서버를 재시작하지 않아도 된다. <br>
		실행 시에 JSP가 서블릿으로 변환되어진다. <br>
	</p>
	
	<hr>
	
	<h3>MVC</h3>
	<p>
		MVC(Model View Controller)란, 디자인 패턴 중 한가지로 Model(데이터 처리), View(화면), Controller(데이터 제어)로
		분리하여 구조화 한 것. <br>
	</p>
	
	<hr>
	
	<h3>JSP내에서 자바코드를 사용하는 방법</h3>
	<ol>
		<li>
			선언문 : &lt;%! 자바코드 %&gt; <br>
			멤버 변수와 메소드를 선언하기 위해 사용
		</li>
		<li>
			<%
				String str = "문자열";
				//자바 주석
			%>
			스크립틀릿 : &lt;% 자바코드 %&gt; <br>
			JSP에서 자바코드를 기술하기 위한 제일 기본적인 방법
		</li>
		<li>
			표현식(출력식) : &lt;%= 자바코드 %&gt; <br>
			자바에서의 값(변수 또는 메소드 호출)을 화면상에 출력하기 위해 사용 <br>
			<%=str %>
		</li>
	</ol>
	
	<hr>
	
	<h3>지시어</h3>
	<p>
		지시어란, JSP 페이지 전체에 영향을 미치는 정보를 기술할 때 사용된다. <br>
		&lt; %@ page|include|taglib 속성=속성값 &gt;
	</p>
	
	<ol>
		<li>
			page 지시어 ㅣ 현재 JSP 페이지를 처리하는데 필요한 각종 정보를 기술하는 부분 <br>
			<ul>
				<li>language : 사용할 언어 유형</li>
				<li>ContentType : 해당 페이지 형식 및 문자셋 지정</li>
				<li>pageEncoding : JSP 페이지내에, 기록된 자바 코드의 인코딩 방식 설정</li>
				<li>import : 자바에서의 import와 동일한 의미</li>
				<li>errorPage : 해당 JSP상의 오류 발생 시, 보여줄 페이지 경로 지정(web.xml[배포서술자]에 지정 가능)</li>
				<li><a href="/views/noPage.jsp">존재하지 않는 페이지로 이동</a></li>
				<!-- HTML 주석 : 개발자 도구 - Element Tab에 노출됨 -->
				<%-- JSP 주석 : 개발자 도구 - Element Tab에서 보이지 않음. --%>
				
			</ul>
		</li>
		<li>
			include 지시어 : 현재 JSP 상에, 또 다른 JSP 파일을 포함시키고자 할 때 사용되는 지시어.
			<%@ include file="/views/includePage.jsp" %>
		</li>
		<li>
			tablib 지시어 : JSP 기능을 좀 더 확장시킬 수 있는 추가적인 라이브러리를 등록하는 구문
		</li>
	</ol>
	
	<%-- 
		1) 전체 회원 조회
		- DB 작업이 필요한가 ? -> O
		- 쿼리 : select * from member_tbl
		- 쿼리에 사용자 입력이 필요한가?
			- 필요	: 입력 양식이 존재하는 페이지로 이동
			- 불필요	: Controller를 호출 (MVC1 패턴에서는 Controller가 JSP)
	 --%>
	 
	 <h3>
	 	<a href="/views/allMember.jsp">전체 회원 조회</a>
	 </h3>
	 
	 <%-- 
	 	2) 아이디로 회원 조회
	 	- DB 작업이 필요한지? -> O
	 	- 쿼리 : select * from member_tbl where member_id = ?;
	 	- 쿼리에 사용자 입력값이 필요한지?
	 		- 필요 : 입력 양식이 존재하는 페이지로 이동
	 		- 불필요 : Controller 호출
	 --%>
	 <h3>
	 	<a href="/views/searchIdFrm.jsp">아이디로 회원 조회</a>
	 </h3>
	
	<%--
		3) 이름으로 회원 조회
		- DB 작업이 필요한가? -> O
		- 쿼리 : select * from member_tbl where member_name like '%'||?||'%';
		- 쿼리에 사용자 입력값이 필요한지? -> O
			- 필요 : 입력 양식이 존재하는 페이지로 이동
			- 불필요 : controller 호출
			
		쿼리에 사용자 입력값 필요
	 --%>
	 
	 <h3>
	 	<a href="/views/searchNameFrm.jsp">이름으로 회원 조회</a>
	 </h3>
	 
	 <%--
	 	4) 회원 가입
	 	- DB 작업이 필요한가? -> O
	   	- 쿼리 : insert into member_tbl(member_no, member_id, member_Pw) Values (값1,값2,값3);
	   			insert into member_tbl values(값..............);
	   	- 쿼리에 사용자 입력값이 필요한가? -> O
	   		- 필요 : 입력 양식이 존재하는 페이지로 이동
			- 불필요 : controller 호출
	  --%>
	  <h3>
	  	<a href="/views/joinFrm.jsp">회원가입</a>
	  </h3>
	  
	 <%--
	  	5) 회원 삭제
	  	- DB 작업 필요
	  	- 쿼리 : delete from member_tbl where member_no = ?;
	  	- 쿼리에 사용자 입력값이 필요한가 -> x -> 전체회원 리스트를 보여주고, 마지막 열에 삭제할 수 있는 a 태그를 생성
	 --%>
	 <h3>
	  	<a href="/views/deleteFrm.jsp">회원 삭제</a>
	 </h3>
	 
	 <hr>
	 
	 <h3>EL(Expression Language)</h3>
	 <p>
	 	JSP 2.0 버전에 추가된 언어. <br>
	 	기존 스크립틀릿으로 작성하던 자바 코드를 보다 쉽게 작성할 수 있도록 지원하는 언어 <br>
	 	
	 	[표현식]
	 	
	 	${  value } 과 같이 사용
	 </p>
	 
	 <form action="/views/elTest.jsp" method="post">
	 	<table>
	 		<tr>
	 			<th>이름</th>
	 			<td><input type="text" name="name"></td>
	 		</tr>
	 		<tr>
	 			<th>나이</th>
	 			<td><input type="text" name="age"></td>
	 		</tr>
	 		
	 		<tr>
	 			<th>주소</th>
	 			<td><input type="text" name="addr"></td>
	 		</tr>
	 		<tr>
	 			<td colspan="2">
	 				<input type="submit" value="요청">	 			
	 			</td>
	 		</tr>
	 	</table>
	 </form>
	 
	 <hr>
	 
	 <h3>JSP 내장 객체</h3>
	 <pre>
	 	JSP에서 기본적으로 제공하는 객체 <br><br>
	 	
	 	request : HttpServletRequest 참조 변수 (클라이언트 요청 정보) <br>
	 	response : HttpServletResponse 참조 변수 (요청에 대해서 처리 결과를 위해 사용) <br>
	 	out : JSPWritet 참조 변수 (브라우저 화면에 출력하기 위한 용도로 사용)
	 	session : HttpSession 참조 변수
	 	page : 현재 JSP 페이지에 대한 참조 변수
	 	application : ServletContext 참조 변수
	 </pre>
	 <%--
	 	page, request, session, application
	 	
	 	page : 1개의 JSP 페이지
	 	request : 1개의 요청. 요청한 JSP/Servlet ~ 요청을 위임받은 JSP/Servlet
	 	session : 1개의 브라우저(동일한 브라우저). 브라우저 종료하거나 세션이 만료 되었을 때 소명
	 	application : 1개의 어플리케이션 서버 중지 이전까지 유지된다.
	  --%>
	  <h3>
	  	<a href="/scopeTest?reqData-req">스코프 테스트 1번</a>
	  </h3>
	  
	  <hr>
	  
	  <h3>JSTL</h3>
	  <pre>
	  	JSP에서 자주 사용되고나 공통적으로 사용되는 Java 코드를
	  	쉽고, 간편하게 작성할 수 있도록 태그화하여 제공하는 라이브러리
	  	
	  	1) 라이브러리 추가 (/WEB-INF/lib 하위에 taglibs ~~ )
	  	2) 사용 선언
	  	3) 제공되는 태그를 사용
	  </pre>
	  
	  <h3>
	  	<a href="/views/jstlTest.jsp">jstl</a>
	  </h3>
</body>
</html>