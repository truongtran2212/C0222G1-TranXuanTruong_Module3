<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/31/2022
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>

<table border="1" style="border-collapse:  collapse">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>email</th>
        <th>country</th>
        <th>status</th>
    </tr>
    <c:forEach items="${userList}" var="user">
        <c:if test="status == 0">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td>${user.status}</td>
            <td>
                <a href="/users?action=update&id=${user.id}">update</a>
            </td>

            <td>
                <a href="/users?action=delete&id=${user.id}">delete</a>
            </td>
        </tr>
        </c:if>
    </c:forEach>
</table>
</body>
</html>
