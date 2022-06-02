<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/2/2022
  Time: 11:17 AM
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
<form action="/user?action=create" method="post">
    <table>
        <tr>
            <td>Id</td>
            <td><input type="hidden" name="id" >Tao cho tự tăng r</td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td> Country </td>
            <td><input type="text" name="country"></td>
        </tr>
        <tr>
            <td>Status</td>
            <td><input type="hidden" name="status">Tao cho mặc định là 0 r</td>
        </tr>
        <tr>
            <td>  <button type="submit">Add new</button></td>
        </tr>
    </table>
</form>
</body>
</html>
