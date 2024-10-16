<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디로 회원 조회</title>
</head>
<body>
	<!-- 
		사용자에게 조회할 아이디를 입력받고, 조회 버튼을 누르면
		해당 아이디와 일치하는 회원이 존재하는지 처리할
		서블릿에 요청
	 -->
	 <form action="/searchId" method="get">
	 	조회할 아이디 입력 : <input type="text" name="searchId"><br>
	 	<input type="submit" value="조회">
	 </form>
</body>
</html>