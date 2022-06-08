<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
    <style>
        .content {
            display: flex;
            align-items: center;
            justify-content: center;
        }

    </style>
</head>
<body class="bg-dark">
<div class="w-100">
    <div class="w-25 m-0 p-0 float-left">&nbsp;</div>
    <div class=" w-50 content float-left p-0">

        <form action="/cinema?action=create" method="post" class="w-100 bg-white">
            <a href="/cinema" style="font-size: 2rem">Back list Cinema</a>
            <div class="p-3">
                <h4 style="text-align: center">Thêm phim mới</h4>

                <div class="form-group">
                    <label>Mã Phim</label>
                    <input class="form-control" type="text" name="id">
                    <c:if test="${validate.id != null}">
                        <label class="text-danger"> ${validate.id}</label>
                    </c:if>
                </div>


                <div class="form-group">
                    <label>Tên phim</label>
                    <select name="idFilm" class="w-100 form-control">
                        <option value="" class="w-100">tên phim</option>
                        <c:forEach items="${filmList}" var="film">
                            <option value="${film.id}" class="w-100">${film.name}</option>
                        </c:forEach>
                    </select>
                    <c:if test="${validate.idFilm != null}">
                        <label class="text-danger"> ${validate.idFilm}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Ngày chiếu</label>
                    <input class="form-control" type="date" name="showDay">
                                        <c:if test="${validate.showDay != null}">
                                            <label class="text-danger"> ${validate.showDay}</label>

                                        </c:if>
                </div>

                <div class="form-group">
                    <label>Số lượng vé</label>
                    <input class="form-control" type="text" name="amountTicket">
                                        <c:if test="${validate.amountTicket != null}">
                                            <label class="text-danger"> ${validate.amountTicket}</label>
                                        </c:if>
                </div>

                <button class="btn btn-dark" type="submit">Add new</button>
            </div>
        </form>

    </div>
    <div class="w-25 m-0 p-0 float-left">&nbsp;</div>
</div>

</body>
<script src="/jquery/jquery-3.5.1.min.js"></script>
<script src="/datatables/js/jquery.dataTables.min.js"></script>
<script src="/datatables/js/dataTables.bootstrap4.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="bootstrap413/js/bootstrap.bundle.min.js"></script>
</html>
