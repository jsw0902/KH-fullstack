<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>스코프 테스트 2번!!</h3>
	
	<hr>
	
	request : ${requestScope.reqData} <br>
	session : ${sessionScope.sessionData} <br>
	application : ${ applicationScope.applicationData } <br>
	
</body>
</html>