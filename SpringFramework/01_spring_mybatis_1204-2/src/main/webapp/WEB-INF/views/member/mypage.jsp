<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<form action="/member/update.kh" method="post">
	    <table border="1">
	        <tr>
	            <th>아이디</th>
	            <td>
	                <input type="hidden" name="memberId" value="${loginMember.memberId}">
	                <span>${loginMember.memberId}</span>
	            </td>
	        </tr>
	        <tr>
	            <th>비밀번호</th>
	            <td>
	                <input type="password" name="memberPw" value="${loginMember.memberPw}">
	            </td>
	        </tr>
	        <tr>
	            <th>이름</th>
	            <td>
	                <input type="text" name="memberName" value="${loginMember.memberName}">
	            </td>
	        </tr>
	        <tr>
	            <th>전화번호</th>
	            <td>
	                <input type="text" name="memberPhone" value="${loginMember.memberPhone}">
	            </td>
	        </tr>
	        <tr>
	        	<th>나이</th>
	            <td>
	                <input type="text" name="memberAge" value="${loginMember.memberAge}">
	            </td>
	        </tr>
	        <tr>
	            <th>성별</th>
	            <td>
	                <input type="radio" name="memberGender" value="M" ${loginMember.memberGender == 'M' ? 'checked' : ''}> 남자
	                <input type="radio" name="memberGender" value="W" ${loginMember.memberGender == 'W' ? 'checked' : ''}> 여자
	            </td>
	        </tr>
	    </table>
	    <input type="submit" value="수정하기">
	</form>
	<h4><a href="/">메인으로</a></h4>
</body>
</html>