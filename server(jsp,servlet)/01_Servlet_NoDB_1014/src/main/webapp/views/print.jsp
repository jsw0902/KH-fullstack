<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>print JSP</h1>
	
	<hr>
	
	<form action="/print" method="get">
		이름 : <input type="text" name="name">  <br>
		나이 : <input type="text" name="age"> <br>
		주소 : <input type="text" name="addr"> <br>
		<input type="submit" value="요청">
	</form>
	<!-- 
		학생의 이름, 나이, 주소를 저장하는 Student 객체를 생성자를 통해, 임의로 생성하고,
		ArrayList로 관리
		
		jsp에서 이름을 입력받아, 일치하는 학생이 존재하는지 체크 후, 존재하면 해당 학생 정보를 출력하고
		존재하지 않으면 "존재하지 않습니다." 출력
	 -->
	 
	 <form action="/exam" method="get">
	 	조회 학생 이름 입력 : <input type="text" name="studentName"> <br>
	 	<input type="submit" value="조회">
	 </form>
	 
	 <!-- 
	 	아이디 및 비밀번호를 입력받고, 로그인(submit) 버튼을 클릭하면
	 	해당 정보와 일치하는 회원이 존재하는지 체크하고,
	 	존재하면 회원 정보를, 존재하지 않으면 "존재하지 않습니다."를 출력.
	 	
	 	회원 정보는 Member 클래스로 작성하고, 회원 정보는 아이디, 비밀번호, 이름, 나이가 존재한다고 가정.
	 	DB 연동 없이 작성하므로, 위 ExamServlet과 같이 임의로 5명의 회원을 생성자로 생성하시오
	 	 
	  -->
	  <form action="/exam2" method="get">
		ID : <input type="text" name="memberId">  <br>
		PW : <input type="password" name="memberPw"> <br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>