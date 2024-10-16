<%@page import="kr.or.iei.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.iei.model.service.MemberService"%>
<%@page import="kr.or.iei.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/*
	MVC1 패턴에서는 Controller와 View 역할을 JSP에 담당!
	현재 allMember.jsp에서 로직 처리와 응답 페이지 처리를 담당할것임
*/

// 1) 인코딩
request.setCharacterEncoding("utf-8");

// 2) 값 추출

// 3) 비즈니스 로직 처리 - 전체 회원 조회
MemberService service = new MemberService();
ArrayList<Member> list = service.selectAllMember();

// 4) 결과 처리
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전체 회원 조회</h1>
	
	<hr>
	
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원아이디</th>
			<th>회원이름</th>
			<th>등급</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일</th>
		</tr>
		<% for(int i = 0; i<list.size(); i++){ %>
			<tr>
				<td><%=list.get(i).getMemberNo()%></td>
				<td><%=list.get(i).getMemberId()%></td>
				<td><%=list.get(i).getMemberName()%></td>
				<% if(list.get(i).getMemberLevel() == 1){%>
						<td>관리자</td>
				<%} else if(list.get(i).getMemberLevel() == 2) {%>
						<td>정회원</td>
				<%} else{%>
						<td>준회원</td>
				<%} %>
				
				<td><%=list.get(i).getMemberPhone()%></td>
				<td><%=list.get(i).getMemberAddr()%></td>
				<td><%=list.get(i).getMemberDate()%></td>
			</tr>
		<%} %>
		
		
	</table>
</body>
</html>