<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap-4.0.0-dist/css/bootstrap.min.css">
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

        <form action="/employee?action=update" method="post" class="w-100 bg-white">
            <c:if test="${mess!=null}">
                <h6>${mess}</h6>
            </c:if>
            <a href="/employee" style="font-size: 2rem">Back list Employee</a>
            <div class="p-3">
                <div class="form-group">
                    <label>Id Employee</label>
                    <input class="form-control" type="hidden" name="id"
                           value="${requestScope["employee"].getIdEmployee()}">
                </div>
                <div class="form-group">
                    <label>Employee Name</label>
                    <input class="form-control" type="text" name="name"
                           value="${requestScope["employee"].getName()}">
                </div>

                <div class="form-group">
                    <label>Day Of Birth</label>
                    <input class="form-control" type="date" name="birthday"
                           value="${requestScope["employee"].getBirthday()}">
                </div>

                <div class="form-group">
                    <label>Id Card</label>
                    <input class="form-control" type="text" name="idCard"
                           value="${requestScope["employee"].getIdCard()}">
                </div>

                <div class="form-group">
                    <label>Salary</label>
                    <input class="form-control" type="text" name="salary"
                           value="${requestScope["employee"].getSalary()}">
                </div>

                <div class="form-group">
                    <label>Phone</label>
                    <input class="form-control" type="text" name="phone"
                           value="${requestScope["employee"].getPhone()}">
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input class="form-control" type="text" name="email"
                           value="${requestScope["employee"].getEmail()}">
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input class="form-control" type="text" name="address"
                           value="${requestScope["employee"].getAddress()}">
                </div>

                <div class="form-group">
                    <label>Position Id</label>
                    <select name="positionId" class="w-100 form-control">
                        <option value="1" class="w-100">Quản lý</option>
                        <option value="2" class="w-100">Nhân viên</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Education Degree Id</label>
                    <select name="educationDegreeId" class="w-100 form-control">
                        <option value="1" class="w-100">Trung Cấp</option>
                        <option value="2" class="w-100">Cao Đẳng</option>
                        <option value="3" class="w-100">Đại Học</option>
                        <option value="4" class="w-100">Sau Đại Học</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Division Id</label>
                    <select name="divisionId" class="w-100 form-control">
                        <option value="1" class="w-100">Sale-Marketing</option>
                        <option value="2" class="w-100">Hành chính</option>
                        <option value="3" class="w-100">Phục vụ</option>
                        <option value="4" class="w-100">Quản lý</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>User Name</label>
                    <input class="form-control" type="hidden" name="userName"
                           value="${requestScope["employee"].getUserName()}">
                </div>

                <div class="form-group">
                    <label>Status</label>
                    <input class="form-control" type="hidden" name="status"
                           value="${requestScope["employee"].getStatus()}">
                </div>
                <button class="btn btn-dark" type="submit">Update</button>
            </div>
        </form>
    </div>
    <div class="w-25 m-0 p-0 float-left">&nbsp;</div>
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
