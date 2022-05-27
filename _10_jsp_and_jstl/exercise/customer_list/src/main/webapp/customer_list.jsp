
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/27/2022
  Time: 2:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table style="border: 1px solid black">
    <h2>Danh sách khách hàng</h2>

    <tr style="margin-left: 50px">
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>

    <c:forEach items="${customerList}" var="customers">
        <tr >
            <td>${customers.customerName}</td>
            <td>${customers.dateOfBirth}</td>
            <td>${customers.address}</td>
            <td><img src="${customers.image}" style="height: 100px; width: 200px"></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
