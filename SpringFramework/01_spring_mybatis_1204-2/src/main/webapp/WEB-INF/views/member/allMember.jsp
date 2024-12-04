<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<h1>회원 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>성별</th>
                <th>나이</th>
                <th>가입일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="member" items="${memberList}">
                <tr>
                    <td>${member.memberId}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberPhone}</td>
                    <td>
                        <c:choose>
                            <c:when test="${member.memberGender == 'M'}">남자</c:when>
                            <c:otherwise>여자</c:otherwise>
                        </c:choose>
                    </td>
                    <td>${member.memberAge}</td>
                    <td>${member.enrollDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>