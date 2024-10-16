<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));
String addr = request.getParameter("addr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>기존 JSP에서 지원하는 출력식을 이용해 데이터를 사용자 화면에 출력</h3>
	<span>이름 : <%=name %></span> <br>
	<span>나이 : <%=age %></span><br>
	<span>주소 : <%=addr %></span><br>
	
	<hr>
	
	<h3>EL을 이용한 출력</h3>
	<span>이름 : ${param.name}</span> <br>
	<span>나이 : ${param.age}</span><br>
	<span>주소 : ${param.addr}</span><br>
	<!-- 
		param이 의미하는건 form 태그를 이용해서 요청 시, 전달한 파라미터 또는
		url 형식으로 요청하며 전달한 파라미터를 참조한다.
	 -->
	 
	 <h3>EL 연산자</h3>
	 <pre>
	 	Java 			: 		EL
	 	+,-			:		+,-
	 	*,/			:		*,div
	 	%			:		mod
	 	&&,||			:		and,or
	 	!			:		not
	 	<			:		lt
	 	>			:		gt
	 	<=			:		le
	 	>=			:		ge
	 	==			:		eq
	 	!=			:		ne
	 </pre>
	 
	 <span>3 + 5 : ${3+5}</span><br>
	 <!--<span>5 div 2 : ${5 div 2 }</span><br>-->
	 
	 <span>10 mod 3 : ${10 mod 3} </span><br>
	 <span>true and false : ${true and false}</span><br>
	 <span>not false : ${not false}</span><br>
	 <span>4 lt 2 : ${4 lt 2}</span><br>
	 <span>3 le 4 : ${3 le 4}</span><br>
	 <span>5 eq 10 : ${5 eq 10}</span><br>
	 
	 <%!ArrayList<Integer> list = null;%>
	 <span>list is null : <%=list==null %></span><br>
	 <span>list is empty : ${empty list} </span><br>
	 
	 <br>
	 
	 <%list = new ArrayList<Integer>();%>
	 <span>list is null : <%=list==null%></span><br>
	 <span>list is empty : ${empty list}</span><br>
	 
	 
</body>
</html>