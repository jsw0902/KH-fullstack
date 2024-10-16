<%@page import="kr.or.iei.model.service.MemberService"%>
<%@page import="kr.or.iei.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//1) 인코딩
request.setCharacterEncoding("utf-8");

//2) 값 추출
String memberId = request.getParameter("memberId");
String memberPw = request.getParameter("memberPw");
String memberName = request.getParameter("memberName");
String memberPhone = request.getParameter("memberPhone");
String memberAddr = request.getParameter("memberAddr");

//3) 비즈니스 로직 - 회원가입
Member m = new Member();
m.setMemberId(memberId);
m.setMemberPw(memberPw);
m.setMemberName(memberName);
m.setMemberPhone(memberPhone);
m.setMemberAddr(memberAddr);

MemberService service = new MemberService(); 
int result = service.insertMember(m);

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 가입 결과</h1>
	
	<hr>
	
	<%if(result == -1) {%>
	<h3>입력한 아이디와 중복되는 회원이 존재합니다.</h3>
	<%}else if(result == 0) {%>
	<h3>등록 실패</h3>
	<%} else{ %>
	<h3>등록 완료</h3>
	<%} %>
</body>
</html>