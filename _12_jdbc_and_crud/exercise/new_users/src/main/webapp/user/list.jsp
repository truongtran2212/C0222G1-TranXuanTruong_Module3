<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap-4.0.0-dist/css/bootstrap.min.css">
</head>
<body>
<h1>Danh sách khách hàng</h1>
<form action="/user" method="get">
    <input type="text" name="country" placeholder="input country">
    <input type="hidden" name="action" value="search">
    <button type="submit">Search</button>

</form>
<a href="user/create.jsp"> Thêm mới</a>
<table border="1" style="border-collapse:  collapse">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>email</th>
        <th>country</th>
        <th>status</th>
    </tr>
    <c:forEach items="${userList}" var="user">
        <c:if test="${user.status==0}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td>${user.status}</td>
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

</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>

<script src="/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
</html>
