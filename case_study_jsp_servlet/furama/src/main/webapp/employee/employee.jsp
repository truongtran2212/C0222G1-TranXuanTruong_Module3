<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap-4.0.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="CustomerCSS.css">
</head>
<body>

<div class="container-fluid" style="background-color: #7FFFD4">
    <div class="row" style="display: flex">
        <div class="col-md-2">
            <a href="/furama"><img
                    src="https://kynghiviet.vn/public/upload/Tour/2020/FURAMA%20RESORT%20DA%20NANG/furama%20logo.png"
                    height="100px" width="100%"></a>
        </div>
        <div class="col-md-8"></div>
        <div class="col-md-2">
            <h5 style="padding-left: 30px; margin-top: 20px">Trần Xuân Trường</h5>
        </div>
    </div>
</div>

<div class="container-fluid body"
     style="background-image:
     url(https://furamavietnam.com/wp-content/uploads/2018/07/Vietnam_Danang_Furama_Resort_Exterior_Beach.jpg);
      background-size: cover; height: 100%">

    <div>
        <form action="/employee" method="get">

            <input type="hidden" name="action" value="search">
            <input type="text" name="name" placeholder="nhập tên">
            <input type="text" name="address" placeholder="nhập tên">
            <button type="submit">Search</button>
        </form>
    </div>

    <div class="center container-fluid">
        <h1 style="text-align: center">Danh sách nhân viên</h1>

        <table border="1" style="border-collapse:  collapse; margin-left: 40px; width: 100%">
            <tr>
                <th>Id Employee</th>
                <th>Employee Name</th>
                <th>Birthday</th>
                <th>Id Card</th>
                <th>Salary</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>Position Id</th>
                <th>Education Degree Id</th>
                <th>Division Id</th>
                <th>User Name</th>
                <th>Status</th>
                <th colspan="2" style="text-align: center">Mission</th>
            </tr>

            <c:forEach items="${employeeList}" var="employee">
                <c:if test="${employee.status==0}">
                    <tr>
                        <td>${employee.idEmployee}</td>
                        <td>${employee.name}</td>
                        <td>${employee.birthday}</td>
                        <td>${employee.idCard}</td>
                        <td>${employee.salary}</td>
                        <td>${employee.phone}</td>
                        <td>${employee.email}</td>
                        <td>${employee.address}</td>
                        <td>
                            <c:if test="${employee.positionId == 1}">Quản lý</c:if>

                            <c:if test="${employee.positionId == 2}">Nhân viên</c:if>

                        </td>

                        <td>
                            <c:if test="${employee.educationDegreeId == 1}">Trung Cấp</c:if>

                            <c:if test="${employee.educationDegreeId == 2}">Cao Đẳng</c:if>

                            <c:if test="${employee.educationDegreeId == 3}">Đại Học</c:if>

                            <c:if test="${employee.educationDegreeId == 4}">Sau Đại Học</c:if>

                        </td>

                        <td>
                            <c:if test="${employee.divisionId == 1}">Sale-Marketing</c:if>

                            <c:if test="${employee.divisionId == 2}">Hành chính</c:if>

                            <c:if test="${employee.divisionId == 3}">Phục vụ</c:if>

                            <c:if test="${employee.divisionId == 4}">Quản lý</c:if>

                        </td>
                        <td>${employee.userName}</td>

                        <td>${employee.status}</td>
                        <td>
                            <a href="/employee?action=update&id=${employee.idEmployee}">
                                <button type="button" class="btn btn-primary">update</button>
                            </a>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#h${employee.idEmployee}">
                                Delete
                            </button>
                            <div class="modal fade" id="h${employee.idEmployee}" tabindex="-1" role="dialog"
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
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                            </button>
                                            <a href="/employee?action=delete&id=${employee.idEmployee}">
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
    </div>
    <div style="text-align: center">
        <a href="/employee/create-employee.jsp">
            <button type="button" class="btn btn-primary">Add new</button>
        </a>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>

<script src="/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
</html>
