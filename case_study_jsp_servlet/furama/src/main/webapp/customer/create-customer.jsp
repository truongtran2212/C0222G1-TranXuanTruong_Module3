<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<form action="/customer?action=create" method="post">
    <table>
        <tr>
            <td>Id Customer</td>
            <td><input type="text" name="idCustomer" ></td>
        </tr>

        <tr>
            <td>Customer Name</td>
            <td><input type="text" name="customerName"></td>
        </tr>

        <tr>
            <td>Day Of Birth</td>
            <td><input type="text" name="birthday"></td>
        </tr>

        <tr>
            <td> Gender </td>
            <td><input type="text" name="gender"></td>
        </tr>

        <tr>
            <td> Id Card </td>
            <td><input type="text" name="idCard"></td>
        </tr>

        <tr>
            <td> Phone </td>
            <td><input type="text" name="phone"></td>
        </tr>

        <tr>
            <td> Email </td>
            <td><input type="text" name="email"></td>
        </tr>

        <tr>
            <td> Address </td>
            <td><input type="text" name="address"></td>
        </tr>

        <tr>
            <td> Customer type id </td>
            <td><input type="text" name="customerTypeId"></td>
        </tr>

        <tr>
            <td>Status</td>
            <td><input type="hidden" name="status">Tao cho mặc định là 0 r</td>
        </tr>

        <tr>
            <td><button type="submit">Add new</button></td>
        </tr>
    </table>
</form>
</body>
</html>
