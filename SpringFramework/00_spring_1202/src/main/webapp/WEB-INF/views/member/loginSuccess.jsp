<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 관리 - 로그인 - 로그인 성공</h1>
	
	<hr>
	
	<h4>ID : ${loginMember.memberId }</h4>
	<h4>PW : ${loginMember.memberPw }</h4>
	<h4>Name : ${loginMember.memberName }</h4>

	<hr>
	
	<h4><a href="/">메인으로</a></h4>
</body>
</html>