<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/31/2022
  Time: 9:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Back List</a>
<table>
    <c:forEach items="${productList}" var="product">
    <tr>
        <td>${product.getIdProduct()}</td>

        <td>${product.getNameProduct()}</td>

        <td>${product.getPriceProduct()}</td>

    </tr>
    </c:forEach>
</table>
</body>
</html>
