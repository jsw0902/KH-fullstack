<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이름으로 회원 조회</h1>
	
	<hr>
	
	<form action="/views/searchName.jsp" method="get">
		조회할 이름 입력 : <input type="text" name="memberName"> <br>
		<input type="submit" value="조회">
	</form>
</body>
</html>