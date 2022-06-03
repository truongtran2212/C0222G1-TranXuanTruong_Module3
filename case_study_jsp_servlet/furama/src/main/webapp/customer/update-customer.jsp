<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/3/2022
  Time: 9:42 AM
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
<a href="/customer">Back list Customer</a>
<form action="/customer?action=update" method="post">

    <table>
        <tr>
            <td>Id Customer</td>
            <td><input type="hidden" name="idCustomer" value="${requestScope["customer"].getIdCustomer()}" ></td>
        </tr>

        <tr>
            <td>Customer Name</td>
            <td><input type="text" name="customerName" value="${requestScope["customer"].getCustomerName()}" ></td>
        </tr>

        <tr>
            <td>Day Of Birth</td>
            <td><input type="text" name="birthday" value="${requestScope["customer"].getBirthday()}"></td>
        </tr>

        <tr>
            <td> Gender </td>
            <td><input type="text" name="gender" value="${requestScope["customer"].getGender()}"></td>
        </tr>

        <tr>
            <td> Id Card </td>
            <td><input type="text" name="idCard" value="${requestScope["customer"].getIdCard()}"></td>
        </tr>

        <tr>
            <td> Phone </td>
            <td><input type="text" name="phone" value="${requestScope["customer"].getPhone()}"></td>
        </tr>

        <tr>
            <td> Email </td>
            <td><input type="text" name="email" value="${requestScope["customer"].getEmail()}"></td>
        </tr>

        <tr>
            <td> Address </td>
            <td><input type="text" name="address" value="${requestScope["customer"].getAddress()}"></td>
        </tr>

        <tr>
            <td> Customer type id </td>
            <td><input type="text" name="customerTypeId" value="${requestScope["customer"].getCustomerTypeId()}"></td>
        </tr>

        <tr>
            <td>Status</td>
            <td><input type="hidden" name="status" value="${requestScope["customer"].getStatus()}" >Tao cho mặc định là 0 r</td>
        </tr>

        <tr>
            <td><button type="submit">Update</button></td>
        </tr>
    </table>
</form>
</body>
</html>
