<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>02_Servlet</h1>
	
	<hr>
	
	<!-- 
		1) 전체 회원 조회
		
		- DB 작업이 필요한가? = O
		- 쿼리 : select * from member_tbl;
		- 쿼리의 사용자 입력값이 필요한지? -> X
			-> 필요하다면 : 입력 양식이 존재하는 페이지로 이동
			-> 필요하지 않다면 : Servlet 에 요청
	 -->
	 
	 <h3>
	 	<a href='/allMember'>전체 회원 조회</a>
	 </h3>
	 
	 <!-- 
	 	2) 아이디로 회원 조회
	 	
	 	- DB 작업이 필요한지? -> O
	 	- 쿼리 : select * from member_tbl where member_id = ?;
	 	- 쿼리에 사용가 입력값이 필요한가?
	 		- 필요 : 입력양식이 존재하는 페이지로 이동
	 		- 필요X : 서블릿에 요청
	  -->
	  
	  <h3>
	  	<a href='/views/searchId.jsp'>아이디로 회원 조회</a>
	  </h3>
	  
	  <!-- 
	  	3) 이름으로 회원 조회
	  	
	  	- DB 작업이 필요한지? -> 0
	  	- 쿼리 : select * from member_tbl where member_name like '%' || ? || '%'
	  	- 쿼리에 사용자 입력값이 필요한지?
	  		- 필요 : 입력 양식이 존재하는 페이지로 이동
	  		- 필요 X : 서블릿에 요청
	   -->
	   
	   <h3>
	   	<a href="/views/searchName.jsp">이름으로 회원 조회</a>
	   </h3>
	   
	   <!-- 
	   	4) 회원가입
	   	
	   	- DB 작업이 필요한지 -> O
	   	- 쿼리 : insert into member_tbl(member_no, member_id, member_Pw) Values (값1,값2,값3);
	   			insert into member_tbl values(값..............);
	   	- 쿼리에 사용자 입력앖이 필요한가? -> O
	   		- 필요 : 입력 양식이 존재하는 페이지로 이동
	   		- 필요 X : 서블릿에 요청
	    -->
	    
	    <h3>
	    	<a href="/views/join.jsp">회원가입</a>
	    </h3>
	    
	    <!-- 
	    	5) 회원정보 삭제
	    	
	    	-> 전체회원을 테이블 형식으로 보여주고, 마지막 열에 삭제할 수 있는 a 태그를 만들고
	    	해당 a태그를 클릭하면 회원 정보가 삭제 
	     -->
	     
	     <h3>
	     	<a href="/delMemberList">전체 회원 조회2</a>
	     </h3>
</body>
</html>