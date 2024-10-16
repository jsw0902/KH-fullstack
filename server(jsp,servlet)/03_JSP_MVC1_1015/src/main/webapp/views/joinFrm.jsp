<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	
	<hr>
	
	<form action="/views/join.jsp" method="post">
		<!-- 
			member_tbl 구성도
			
			member_no == 회원번호 ==>시퀀스로 자동 삽입
			member_id == 회원아이디 ==> O
			member_pw == 비밀번호 ==> O
			member_name == 이름 ==> O
			member_phone == 전화번호 ==> O
			member_addr == 주소 ==> O
			member_level == 등급 ==> 준회원으로 자동으로 넣어줄것
			enroll_date == 가입일 ==> 오늘 날짜로 자동으로 삽입
		 -->
		 
		 <table border="1">
		 	<tr>
		 		<th><label for="memberId">아이디</label></th>
		 		<td>
		 			<input type="text" name="memberId" id="memberId">
		 		</td>
		 	</tr>
		 	<tr>
		 		<th><label for="memberPw">비밀번호</label></th>
		 		<td>
		 			<input type="password" name="memberPw" id="memberPw">
		 		</td>
		 	</tr>
		 	<tr>
		 		<th><label for="memberName">이름</label></th>
		 		<td>
		 			<input type="text" name="memberName" id="memberName">
		 		</td>
		 	</tr>
		 	<tr>
		 		<th><label for="memberPhone">전화번호</label></th>
		 		<td>
		 			<input type="text" name="memberPhone" id="memberPhone">
		 		</td>
		 	</tr>
		 	<tr>
		 		<th><label for="memberAddr">주소</label></th>
		 		<td>
		 			<input type="text" name="memberAddr" id="memberAddr">
		 		</td>
		 	</tr>
		 	<tr>
		 		<th colspan="2">
		 			<input type="submit" value="회원가입">
		 		</th>
		 		<tr>
		 	</tr>
		 	
		 </table>
	</form>
</body>
</html>