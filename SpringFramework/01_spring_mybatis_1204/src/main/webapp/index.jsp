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
	<h1>Spring - Mybatis Project</h1>
	
	<%--
		Mybatis : Java 애플리케이션과 DataBase 상호 작용을 간편하게 하기 위한 영속성 프레임워크
		
		Mybatis 특징)
			
			1. 자동 매핑 : DataBase 수행 결과를 Java 객체로 자동으로 매핑하는 기술
			2. XML 파일에 SQL을 작성 : SQL이 Java 코드와 분리되어 유지보수 및 가독성 증대.
			3. 동적 SQL 지원 : if, foreach, choose ~ when ~ otherwise, where
			4. SQL 재사용 : XML에 작성된 하나의 SQL을 여러곳에서 사용이 가능.
	 --%>
	<hr>
	<%--
		아래와 같이, JSTL과 EL을 같이 사용하는게 편리
		
		- page < request < session < application의 scope가 존재,
		- 아래처럼 scope명을 명시적으로 작성하지 않으면, 범위가 좋은 scope의 attribute에 순차적으로 접근한다.
		- loginMember는 Controller에서 로그인 시, HttpSession에 등록한 Key(문자열)을 의미한다.
		
		
	 --%>
	<c:if test="${empty loginMember }">
		<form action="/member/login.kh" method="post">
			아이디 : <input type="text" name="memberId"> <br>
			비밀번호 : <input type="password" name="memberPw"> <br>
			<input type="submit" value="로그인"> 
		</form>
	</c:if>
	<c:if test="${not empty loginMember }">
		<h3>[${loginMember.memberName }]님 환영합니다!</h3>
	</c:if>
</body>
</html>