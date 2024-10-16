<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>클라이언트 -> 서버 요청</h1>
	<hr>
	
	<h3>요청 방식에 따른 차이점</h3>
	<p>
		GET : URL 정보 뒤에, 쿼리스트링 형식으로 요청 데이터를 전송. <br>
			- URL 길이에 제한이 있다. <br>
			- URL에 정보가 노출되므로, 상대적으로 보안에 취약 <br>
			- 캐싱 기능(동일한 요청 여러번 진행 시, 브라우저 캐시에서 응답해주는 기능) <br><br>
		
		POST : 요청 데이터를, 본문(BODY)에 포함시켜 요청 <br>
			- 데이터 길이에 제한이 없다. <br>
			- GET 방식보다 상대적으로 보안이 우수하다. <br>
			- 캐싱 기능이 없다. <br>
	</p>
	
	<form action="/index" method="get">
		<input type="submit" value="indexServlet에 Get 요청">
	</form>
	<br>
	<form action="/index" method="post">
		<input type="submit" value="indexServlet에 Post 요청">
	</form>
	<br>
	<!-- method 속성을 입력하지 않으면, 기본적으로 get 방식의 요청 -->
	<form action="/index">
		<input type="submit" value="indexServlet 호출(메소드 미작성)">
	</form>
	
	<hr>
	
	<h3>HttpServletRequest와 HttpServletResponse 객체</h3>
	
	<p>
		HttpServletRequest : 클라이언트가 Http 요청 시, 요청 정보를 담고 있는 객체 <br>
		HttpServletResponse : 클라이언트 요청에 대한 처리 결과를 응답하기 위해서 사용되는 객체 <br>
		
	</p>
	
	<fieldset>
		<form action="/method" method="get">
			요청 데이터 1번 : <input type="text" name="test1"> <br>
			ID : <input type="text" name="loginId"> <br>
			PW : <input type="password" name="loginPw"><br>
			숫자 : <input type="text" name="number"><br>
			히든데이터 : <input type="hidden" name="hiddenData" value="hiddenVal"> <br>
			readonly : <input type="text" name="readOnlyData" value="readDate" readonly> <br>
			disable : <input type="text" name="disableData" value="disData" disabled> <br>
			최애 음식은 ?
			<select name="food">
				<option value="pizza">피자 </option>
				<option value="chieken">치킨 </option>
				<option value="potato">감자튀김 </option>
			</select>
			<br>
			<input type="radio" name="gender" value="N"> 남자
			<input type="radio" name="gender" value="F"> 여자
			<br>
			<input type="checkbox" name="hobby" value="A"> 배구
			<input type="checkbox" name="hobby" value="B"> 농구
			<input type="checkbox" name="hobby" value="C"> 축구
			<input type="checkbox" name="hobby" value="D"> 축구
			<br>
			<input type="submit" value="요청">
		</form>
	</fieldset>
	
	<a href="/views/print.jsp">print.jps이동</a>
	
	
</body>
</html>