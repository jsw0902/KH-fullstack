<%@page import="kr.or.iei.model.vo.Member"%>
<%@page import="kr.or.iei.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1) 인코딩
request.setCharacterEncoding("utf-8");

//2) 값 추출
String memberId = request.getParameter("memberId");

//3) 비즈니스 로직 - 아이디로 회원 조회
MemberService service = new MemberService();
Member member = service.selectIdMember(memberId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이디로 회원 조회</h1>
	
	<hr>
	
	<h3>회원 정보</h3>
	
	<% if(member == null){ %>
		<h5>일치하는 회원이 존재하지 않습니다</h5>
	<%} else { %>
		<ul>
			<li>번호 : <%=member.getMemberNo() %></li>
			<li>아이디 : <%=member.getMemberId() %></li>
			<li>이름 : <%=member.getMemberName() %></li>
			
			<%if(member.getMemberLevel() == 1){%>
			<li>등급 : 관리자</li>
			<%}else if(member.getMemberLevel() == 2) {%>
			<li>등급 : 정회원</li>
			<%}else {%>
			<li>등급 : 준회원</li>
			<%} %>
			
			<li>전화번호 : <%=member.getMemberPhone() %></li>
			<li>주소 : <%=member.getMemberAddr() %></li>
			<li>가입일 : <%=member.getMemberDate() %></li>
		</ul>
	<%} %>
</body>
</html>