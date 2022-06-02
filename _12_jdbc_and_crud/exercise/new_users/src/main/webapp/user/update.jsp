<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/1/2022
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${mess!=null}">
    <p>${mess}</p>
</c:if>
<a href="/user">Back list</a>
<form action="/user?action=update" method="post">
    <table>
        <tr>
            <td>Id</td>
            <td><input type="hidden" name="id" value="${requestScope["user"].getId()}"></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name" value="${requestScope["user"].getName()}"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email" value="${requestScope["user"].getEmail()}"></td>
        </tr>
        <tr>
            <td> Country </td>
            <td><input type="text" name="country" value="${requestScope["user"].getCountry()}"></td>
        </tr>
        <tr>
            <td>Status</td>
            <td><input type="hidden" name="status" value="${requestScope["user"].getStatus()}"></td>
        </tr>
        <tr>
            <td>  <button type="submit">Update</button></td>
        </tr>
    </table>
</form>
</body>
</html>
