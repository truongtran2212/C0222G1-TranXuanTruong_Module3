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
    Danh sách phim
</nav>

<div class="container-fluid content">
    <div class="row h-100">
        <div class="col-md-1">&nbsp;</div>
        <div class="col-md-10 h-100" style="border: 1px solid black">
            <table class="table text-center table-striped table-hover bg-white" id="tableCinema">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Tên phim</th>
                    <th>Ngày chiếu</th>
                    <th>Số lượng vé</th>
                    <th>status</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${cinemaList}" var="cinema">
                    <c:if test="${cinema.status == 0}">
                        <tr>
                            <td>${cinema.id}</td>
                            <c:forEach items="${filmList}" var="film">
                                <c:if test="${film.id == cinema.idFilm}">
                                    <td>${film.name}</td>
                                </c:if>
                            </c:forEach>
                            <td>${cinema.showDay}</td>
                            <td>${cinema.amountTicket}</td>
                            <td>${cinema.status}</td>
                            <td>
                                <a href="/cinema?action=update&id=${cinema.id}">Edit</a>
                            </td>
                            <td>
                                <a href="#" onclick="cinemaIndex('${cinema.id}')"
                                   data-toggle="modal"
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
                    <button><a href="/cinema?action=create"><i class="fa-solid fa-plus"></i></a></button>

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
                <button type="button" class="btn btn-dark" onclick="cinemaIndex2()">
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
        <form action="/cinema?action=search" method="post">
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

    function cinemaIndex(index) {
        id = index;
        document.getElementById("name").innerHTML = "Bạn có muốn xóa suất chiếu  \n" + index;
    };

    function cinemaIndex2() {
        let link = "/cinema?action=delete&id=" + id;
        window.location.href = link;
    };
</script>

<script>
    $(document).ready(function () {
        $('#tablecinema').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    })
</script>
</html>
