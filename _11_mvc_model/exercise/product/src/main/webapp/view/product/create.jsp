<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/30/2022
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang thêm mới</h1>
<a href="/product">Back List</a>
<c:if test="${mess!=null}">
    <p>${mess}</p>
</c:if>
<form action="/product?action=add" method="post">

    <table>
        <tr>
            <td>Id product</td>
            <td><input type="text" name="idProduct" placeholder="Input id"></td>
        </tr>
        <tr>
            <td> Name Product</td>
            <td><input type="text" name="nameProduct" placeholder="Input name product"></td>
        </tr>
        <tr>
            <td> Price Product</td>
            <td><input type="text" name="priceProduct" placeholder="Input price product"></td>
        </tr>
        <tr>
            <td>  <button type="submit">Save</button></td>
        </tr>
    </table>
</form>
</body>
</html>
