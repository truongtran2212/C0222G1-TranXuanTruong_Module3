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
        <th>Id Customer</th>
        <th>Customer Name</th>
        <th>Birthday</th>
        <th>Gender</th>
        <th>Id Card</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Customer Type Id</th>
        <th>Status</th>
        <th colspan="2" style="text-align: center">Mission</th>
    </tr>
    <c:forEach items="${customerList}" var="customer">
        <c:if test="${customer.status==0}">
            <tr>
                <td>${customer.idCustomer}</td>
                <td>${customer.customerName}</td>
                <td>${customer.birthday}</td>
                <td>${customer.gender}</td>
                <td>${customer.idCard}</td>
                <td>${customer.phone}</td>
                <td>${customer.email}</td>
                <td>${customer.address}</td>
                <td>${customer.customerTypeId}</td>
                <td>${customer.status}</td>
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

<a href="/customer/create-customer.jsp">Add new</a>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>

<script src="/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
</html>
