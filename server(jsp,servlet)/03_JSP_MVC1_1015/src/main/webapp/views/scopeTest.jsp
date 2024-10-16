<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Scope Test 결과</h1>
	
	<hr>
	<%--
		각 스코프에 저장되어 있는 데이터를 접근할 때,
		아래 ${스코프.키값}로 작성되어 있는 것처럼 접근!
		단, 접근 시 스코프를 작성하지 않을 수도 있다.
		작성하지 않으면 사용 범위가 좁은 순서대로 참조한다.
		
		(가장 좁음) page < request < session < application (가장 넓음)
	 --%>
	<h3>request</h3>
	request : ${requestScope.reqData}<br>
	<a href="/views/scopeTest2.jsp">스코프 테스트 2번</a><br>
	
	<br><br>
	
	<h3>session</h3>
	session : ${sessionScope.sessionData}<br>
	<a href="/views/scopeTest2.jsp">스코프 테스트 2번</a> <br>
	
	<br><br>
	
	<h3>application</h3>
	application : ${applicationScope.applicationData} <br>
	<a href="/views/scopeTest2.jsp">스코프 테스트 2번</a> <br>
</body>
</html>