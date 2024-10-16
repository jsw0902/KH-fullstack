<%@page import="kr.or.iei.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- JSTL 라이브러리 사용 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. 변수 선언</h3>
	<pre>
		1.1 선언
		- c:set 태그를 사용해서 선언
		- 내장 객체(page, request, session, application)에 속성을 추가하는 태그
		- 태그의 속성으로는 var(변수명), value(값), scope(범위)를 가진다.
	</pre>
	
	<c:set var="num" value="100" /><!-- page 스코프 -->
	<c:set var="num" value="200" scope="request" />
	
	<%-- 스코프를 지정하지 않으면, 좁은 범위부터 탐색 --%>
	${num} + ${requestScope.num} = ${num + requestScope.num} <br>
	
	<pre>
		1.2 삭제
		- c:remove 태그를 사용해서 삭제
		- 변수 선언 시, var 속성의 값으로 삭제
		- 속성으로 var(삭제할변수명), scope(범위)를 가진다.
	</pre> 
	
	<c:set var="num" value="300" scope="session" />
	
	page : ${num} <br>
	request : ${requestScope.num} <br>
	session : ${sessionScope.num} <br>
	
	request 범위의 num 삭제 <br>
	<c:remove var="num" scope="request"/>
	page : ${num} <br>
	request : ${requestScope.num} <br>
	session : ${sessionScope.num} <br>
	
	<br><br>
	
	모든 범위의 num 삭제 <br>
	<c:remove var="num"/><!-- scope 지정하지 않으면 해당 변수명으로 등록된 변수 모두 삭제 -->
	page : ${num} <br>
	request : ${requestScope.num} <br>
	session : ${sessionScope.num} <br>
	
	
	<hr><br>
	
	<h3>조건문 - c:if </h3>
	<pre>
		- c:if 태그를 사용하여 작성
		- test라는 속성을 이용하여 조건식을 작성한다!!
		- test라는 속성의 값은 EL을 이용하여 작성
		- if문만 사용 가능하고, else문은 사용 불가
	</pre>
	
	<c:set var="num1" value="100"/>
	<c:set var="num2" value="200"/>
	
	<c:if test="${num1 > num2}">
		num1이 num2보다 큽니다!! <%-- 조건식의 결과가 false이므로, 화면에 출력되지 않음 --%>
	</c:if>
	
	<br>
	
	<c:if test="${num1 < num2}">
		num1이 num2보다 작습니다!! <%-- 조건식의 결과가 true이므로, 출력한다. --%>
	</c:if>
	
	<br>
	
	<c:if test="${num1 ne num2}">
		num1과 num2이 다르다.
	</c:if>
	
	<br><br>
	
	<h3>조건문 choose ~ when ~ otherwise</h3>
	<pre>
		- c:choose, c:when, c:otherwise 태그를 사용하여 작성한다.
		- 자바에서의 switch와 Oracle의 Case~End와 유사!
		- c:when의 test 속성으로 조건식 작성! c:if와 동일하게 조건식은 EL로 작성
	</pre>
	
	<br>

	<c:set var="num3" value="10"/>
	
	<c:choose>
		<c:when test="${num > 10}">
		num3은 10보다 큽니다.
		</c:when>
		<c:when test="${num < 10}">
		num3은 10보다 작습니다.
		</c:when>
		<c:otherwise>
		num3은 10!!
		</c:otherwise>
	</c:choose>
	
	<br><br>
	
	<h3>반복문 forEach</h3>
	<pre>
		- c:forEach 태그를 사용하여 작성한다.
		- 속성으로는 var(현재 반복 회차를 저장할 변수명), begin(시작값), end(종료값), step(반복시마다 증감할 값[기본값은 1]),
		  itmes(반복 접근할 객체), varStatus(부가 정보)	
	</pre>
	
	<c:forEach var="i" begin="1" end="6" step="1">
		<h${i}>${i}번째 반복중</h${i}>
	</c:forEach>
	
	<table border="1">
		<c:forEach var="i" begin="1" end="10" step="1" varStatus="vs">
			<tr>
				<td>${i}</td>
				<td>${i}번째 게시글입니다!!</td>
				<td>varStatus-index : ${vs.index}</td>
				<td>varStatus-count : ${vs.count}</td>
				<td>varStatus-first : ${vs.first}</td>
				<td>varStatus-last : ${vs.last}</td>
			</tr>
		</c:forEach>
	</table>
	<br><br>
	<%
		ArrayList<Member> list = new ArrayList<Member>();
		list.add(new Member("1", "id1", "pw1","이름1" , "010-1234-1234", "주소1", 1, "2024-10-16"));
		list.add(new Member("2", "id2", "pw2","이름2" , "010-1234-1234", "주소2", 2, "2024-10-16"));
		list.add(new Member("3", "id3", "pw3","이름3" , "010-1234-1234", "주소3", 3, "2024-10-16"));
	%>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>등급</th>
			<th>가입일</th>
		</tr>
		<c:forEach var="member" items="<%=list %>">
			<tr>
				<td>${member.memberNo}</td>
				<td>${member.memberId}</td>
				<td>${member.memberPw}</td>
				<td>${member.memberName}</td>
				<td>${member.memberPhone}</td>
				<td>${member.memberAddr}</td>
				<c:choose>
					<c:when test="${member.memberLevel eq 1}">
						<td>관리자</td>
					</c:when>
					<c:when test="${member.memberLevel eq 2}">
						<td>정회원</td>
					</c:when>
					<c:otherwise>
						<td>준회원</td>
					</c:otherwise>
				</c:choose>
				<td>${member.memberDate}</td>
			</tr>
		</c:forEach>
	</table>
	
	
</body>
</html>