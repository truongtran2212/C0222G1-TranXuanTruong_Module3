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
<a href="/service">Back list Service</a>
<form action="/service?action=create" method="post">

    <table>
        <tr>
            <td>Id Service</td>
            <td><input type="text" name="idService"></td>
        </tr>

        <tr>
            <td>service Name</td>
            <td><input type="text" name="serviceName"></td>
        </tr>

        <tr>
            <td>service Area</td>
            <td><input type="text" name="serviceArea"></td>
        </tr>

        <tr>
            <td> service Cost</td>
            <td><input type="text" name="serviceCost"></td>
        </tr>

        <tr>
            <td> service Max people</td>
            <td><input type="text" name="serviceMaxpeople"></td>
        </tr>

        <tr>
            <td> standard Room</td>
            <td><input type="text" name="standardRoom"></td>
        </tr>

        <tr>
            <td> description Other Convenience</td>
            <td><input type="text" name="descriptionOtherConvenience"></td>
        </tr>

        <tr>
            <td> pool Area</td>
            <td><input type="text" name="poolArea"></td>
        </tr>

        <tr>
            <td> number Of Floors</td>
            <td><input type="text" name="numberOfFloors"></td>
        </tr>

        <tr>
            <td> rent Type Id</td>
            <td><input type="text" name="rentTypeId"></td>
        </tr>

        <tr>
            <td> service Type Id</td>
            <td><input type="text" name="serviceTypeId"></td>
        </tr>

        <tr>
            <td>Status</td>
            <td><input type="hidden" name="status">Tao cho mặc định là 0 r</td>
        </tr>

        <tr>
            <td>
                <button type="submit">Add new</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
