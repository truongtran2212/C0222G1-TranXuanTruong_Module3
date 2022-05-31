<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/31/2022
  Time: 1:34 PM
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
    <tr>
        <th>Id Product</th>
        <th>Name Product</th>
        <th>Price Product</th>

    </tr>
    <tr>
        <td>${product.getIdProduct()}</td>

        <td>${product.getNameProduct()}</td>

        <td>${product.getPriceProduct()}</td>
    </tr>
</table>
</body>
</html>
