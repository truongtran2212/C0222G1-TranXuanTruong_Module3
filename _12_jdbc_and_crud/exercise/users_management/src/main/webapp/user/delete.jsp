<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/1/2022
  Time: 8:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/users">Back List</a>
<h1>Delete Product</h1>
<p>
    <c:if test="${mess != null}">
        <span>${mess}</span>
    </c:if>
</p>
<p>
    <a href="/users">Back List</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>
            User Information
        </legend>
        <table>
            <tr>
                <td>Name:</td>
                <td>${user.getName()}</td>
            </tr>
            <tr>
                <td>Price:</td>
                <td>${user.getEmail}</td>
            </tr>
            <tr>
                <td>Country:</td>
                <td>${user.getCountry}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete anyway"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
