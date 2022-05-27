<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/26/2022
  Time: 10:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    double amount = Double.parseDouble(request.getParameter("amount"));
    double rate = Double.parseDouble(request.getParameter("rate"));
    double result = amount * rate;
%>
<h1>Rate: <%=rate%></h1>
<h1>USD: <%=amount%></h1>
<h1>VND: <%=result%></h1>
</body>
</html>
