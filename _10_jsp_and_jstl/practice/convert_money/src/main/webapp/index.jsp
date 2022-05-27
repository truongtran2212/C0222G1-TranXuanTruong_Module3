<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/26/2022
  Time: 9:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form action="convert_money.jsp" method="post">

    <label for="amount">Amount:</label>
    <input type="text" id="amount" name="amount" placeholder="USD">

    <label for="rate"> Rate:</label>
    <input type="text" id="rate" name="rate" placeholder="VND">

    <button type="submit">Convert</button>
</form>
</body>
</html>
