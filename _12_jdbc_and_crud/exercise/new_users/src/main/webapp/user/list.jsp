
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:if test="${user.status==0}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td>${user.status}</td>
                <td>
                    <a href="/user?action=update&id=${user.id}">update</a>
                </td>

                <td>
                    <a href="/user?action=delete&id=${user.id}">delete</a>
                </td>
            </tr>
        </c:if>
    </c:forEach>
</table>
</body>
</html>
