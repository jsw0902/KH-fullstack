<%@page import="kr.or.iei.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.iei.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//인코딩
request.setCharacterEncoding("utf-8");

//값 추출

//비즈니스 로직 - 전체 회원 조회
MemberService service = new MemberService();
ArrayList<Member> list = service.selectAllMember();
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
			<th>아이디</th>
			<th>이름</th>
			<th>삭제</th>
		</tr>
		<% for(int i = 0; i<list.size(); i++){
			Member m = list.get(i);	
		%>
			<tr>
				<td><%=m.getMemberNo()%></td>
				<td><%=m.getMemberId()%></td>
				<td><%=m.getMemberName()%></td>
				<td><a href="/views/delete.jsp?memberNo=<%=m.getMemberNo()%>">삭제</a></td>
				<%-- locahost:80/delete.jsp?memberNo=3 --%>
			</tr>
		<%} %>
		
		
	</table>
</body>
</html>