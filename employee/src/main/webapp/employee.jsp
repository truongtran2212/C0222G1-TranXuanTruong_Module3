<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
    <script src="https://kit.fontawesome.com/dbc3483aca.js" crossorigin="anonymous"></script>
    <style>
        .center-box {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .head-text {
            font-size: 30px;
            font-weight: bold;
            height: 10%;
        }

        .content {
            height: 90%;
        }

        .footer {
            display: flex;
            align-items: center;
            justify-content: space-around;
        }
    </style>
</head>
<body class="h-100">
<nav class="navbar navbar-light bg-dark text-white center-box head-text">
    Danh sách nhân viên
</nav>

<div class="container-fluid content">
    <div class="row h-100">
        <div class="col-md-1">&nbsp;</div>
        <div class="col-md-10 h-100" style="border: 1px solid black">
            <table class="table text-center table-striped table-hover bg-white" id="tableEmployee">
                <thead>
                <tr>
                    <th>No.</th>
                    <th>Tên Nhân Viên</th>
                    <th>Ngày sinh</th>
                    <th>SĐT</th>
                    <th>Địa chỉ</th>
                    <th>Lương</th>
                    <th>Chức vụ</th>
                    <th>Bộ phận</th>
                    <th>Học vấn</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${employeeList}" var="employee">
                    <c:if test="${employee.status == 0}">
                        <tr>
                            <td>${employee.id}</td>
                            <td>${employee.name}</td>
                            <td>${employee.birthday}</td>
                            <td>${employee.phone}</td>
                            <td>${employee.address}</td>
                            <td>${employee.salary}</td>


                            <c:forEach items="${positionList}" var="position">
                                <c:if test="${position.id == employee.positionId}">
                                    <td>${position.name}</td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${divisionList}" var="division">
                                <c:if test="${division.id == employee.divisionId}">
                                    <td>${division.name}</td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${educationList}" var="education">
                                <c:if test="${education.id == employee.educationDegreeId}">
                                    <td>${education.name}</td>
                                </c:if>
                            </c:forEach>
                            <td>
                                <a href="/employee?action=update&id=${employee.id}">Edit</a>
                            </td>
                            <td>
                                <a href="#" onclick="employeeIndex(${employee.id}, '${employee.name}')" data-toggle="modal"
                                   data-target="#delete">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
            <div>

                <div class="w-100  footer" style="color: #b21f2d; font-size: 2rem">
                    <button><a href="/employee?action=create"><i class="fa-solid fa-plus"></i></a></button>

                    <button><a href="#" data-toggle="modal"
                               data-target="#search"><i class="fa-solid fa-magnifying-glass"></i></a></button>
                </div>

                <div style="text-align: center; color: #28a745; font-size: 1.5rem">
                    <c:if test="${message!=null}">
                        ${message}
                    </c:if>
                </div>
            </div>

        </div>

        <div class="col-md-1">&nbsp;</div>
    </div>
</div>

<%--modal delete--%>
<div class="modal" id="delete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                    <h4 class="modal-title w-100 text-center" id="name"></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-dark" onclick="employeeIndex2()">
                    <a class="text-white">Xóa</a>
                </button>
                <button type="button" class="btn btn-dark " data-dismiss="modal">Hủy</button>
            </div>
        </div>
    </div>
</div>


<%--modal search--%>

<div class="modal" id="search">
    <div class="modal-dialog">
        <form action="/employee?action=search" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title w-100 text-center">Chọn thuộc tính bạn muốn tìm kiếm</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body footer border- 0">
                    <input type="text" name="nameSearch" placeholder="Tên nhân viên" class="form-control">
                    <select name="divisionIdSearch" class="form-control custom-select bg-light">
                        <option value="">Bộ phận</option>
                        <c:forEach items="${divisionList}" var="division">
                            <option value="${division.id}">${division.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="modal-footer border-0">
                    <button type="submit" class="btn btn-dark">
                        Tìm kiếm
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>

<script src="/jquery/jquery-3.5.1.min.js"></script>
<script src="/datatables/js/jquery.dataTables.min.js"></script>
<script src="/datatables/js/dataTables.bootstrap4.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="bootstrap413/js/bootstrap.bundle.min.js"></script>

<script>
    var id;

    function employeeIndex(index, employeeName) {
        id = index;
        document.getElementById("name").innerHTML = "Bạn có muốn xóa nhân viên tên \n"+ employeeName;
    };

    function employeeIndex2() {
        let link = "/employee?action=delete&id=" + id;
        window.location.href = link;
    };
</script>

<script>
    $(document).ready(function () {
        $('#tableEmployee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    })
</script>
</html>
