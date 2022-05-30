<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/30/2022
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách sản phẩm</h1>

<a href="view/product/create.jsp">Thêm mới</a>
<table style="border: 1px solid black">
    <tr>
        <th>STT</th>
        <th>id Product</th>
        <th>name Product</th>
        <th>price Product</th>
        <th>role</th>
    </tr>

    <c:forEach items="${productList}" var="product" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.idProduct}</td>
            <td>${product.nameProduct}</td>
            <td>${product.priceProduct}</td>
            <td>
                <a href="/product?action=update&idProduct=${product.idProduct}">update</a>
            </td>

            <td>
                <a href="/product?action=delete&idProduct=${product.idProduct}">delete</a>
            </td>

        </tr>
    </c:forEach>
</table>
</body>
</html>
