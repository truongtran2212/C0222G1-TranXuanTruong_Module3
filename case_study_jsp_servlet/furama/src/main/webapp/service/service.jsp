<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap-4.0.0-dist/css/bootstrap.min.css">
</head>
<body>

<h1>Danh sách khách hàng</h1>

<table border="1" style="border-collapse:  collapse">
    <tr>
        <th>Id Service</th>
        <th>service Name</th>
        <th>service Area</th>
        <th>service Cost</th>
        <th>service Max people</th>
        <th>standard Room</th>
        <th>description Other Convenience</th>
        <th>pool Area</th>
        <th>number Of Floors</th>
        <th>rent Type Id</th>
        <th>service Type Id</th>
        <th>status</th>
        <th colspan="2" style="text-align: center">Mission</th>
    </tr>

    <c:forEach items="${serviceList}" var="service">
        <c:if test="${service.status==0}">
            <tr>
                <td>${service.idService}</td>
                <td>${service.serviceName}</td>
                <td>${service.serviceArea}</td>
                <td>${service.serviceCost}</td>
                <td>${service.serviceMaxpeople}</td>
                <td>${service.standardRoom}</td>
                <td>${service.descriptionOtherConvenience}</td>
                <td>${service.poolArea}</td>
                <td>${service.numberOfFloors}</td>
                <td>${service.rentTypeId}</td>
                <td>${service.serviceTypeId}</td>
                <td>${service.status}</td>
                <td>
                    <a href="/user?action=update&id=${user.id}">
                        <button type="button" class="btn btn-primary">update</button>
                    </a>
                </td>
                <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#h${user.id}">
                        Delete
                    </button>
                    <div class="modal fade" id="h${user.id}" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>You want delete</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <a href="/user?action=delete&id=${user.id}">
                                        <button type="button" class="btn btn-primary">delete</button>
                                    </a>

                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:if>
    </c:forEach>
</table>

<button><a href="/service/create-service.jsp">Add new</a></button>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>

<script src="/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>