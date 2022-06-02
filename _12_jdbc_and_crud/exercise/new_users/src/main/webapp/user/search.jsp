<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/1/2022
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/user">Back List</a>
<table style="border: 1px solid black">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>email</th>
        <th>country</th>
        <th>status</th>
    </tr>

    <c:forEach items="${userList}" var="user">
        <tr>
            <td>${user.getId()}</td>

            <td>${user.getName()}</td>

            <td>${user.getEmail()}</td>

            <td>${user.getCountry()}</td>

            <td>${user.getStatus()}</td>

        </tr>
    </c:forEach>
</table>
</body>
</html>
