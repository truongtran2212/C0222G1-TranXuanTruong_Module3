<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/30/2022
  Time: 9:33 PM
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
<a href="/product">Back List</a>
<form action="/product?action=update" method="post">
    <table>
        <tr>
            <td>Id product</td>
            <td><input type="text" name="idProduct" value="${requestScope["product"].getIdProduct()}"></td>
        </tr>
        <tr>
            <td> Name Product</td>
            <td><input type="text" name="nameProduct" value="${requestScope["product"].getNameProduct()}"></td>
        </tr>
        <tr>
            <td> Price Product</td>
            <td><input type="text" name="priceProduct" value="${requestScope["product"].getPriceProduct()}"></td>
        </tr>
        <tr>
            <td>  <button type="submit">Update</button></td>
        </tr>
    </table>
</form>
</body>
</html>
