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

        <form action="/employee?action=update&id=${employee.id}" method="post" class="w-100 bg-white">
            <a href="/employee" style="font-size: 2rem">Back list Employee</a>
            <div class="p-3">
                <h4 style="text-align: center">Chỉnh sửa nhân viên</h4>
                <div class="form-group">
                    <label>Employee Name</label>
                    <input class="form-control" type="text" name="name" value="${employee.name}">
                    <c:if test="${validate.name != null}">
                        <label class="text-danger"> ${validate.name}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Day Of Birth</label>
                    <input class="form-control" type="date" name="birthday" value="${employee.birthday}">
                    <c:if test="${validate.birthday != null}">
                        <label class="text-danger"> ${validate.birthday}</label>

                    </c:if>
                </div>

                <div class="form-group">
                    <label>Phone</label>
                    <input class="form-control" type="text" name="phone" value="${employee.phone}">
                    <%--                           pattern="^(090[0-9]{7})|(091[0-9]{7})|(\(84\)\+90[0-9]{7})|(\(84\)\+91[0-9]{7})$"--%>
                    <c:if test="${validate.phone != null}">
                        <label class="text-danger"> ${validate.phone}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input class="form-control" type="text" name="address" value="${employee.address}">
                    <c:if test="${validate.address != null}">
                        <label class="text-danger"> ${validate.address}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Salary</label>
                    <input class="form-control" type="text" name="salary" value="${employee.salary}">
                    <c:if test="${validate.salary != null}">
                        <label class="text-danger"> ${validate.salary}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Position Id</label>
                    <select name="positionId" class="w-100 form-control" value="${employee.positionId}">
                        <option value="" class="w-100">Vị trí</option>
                        <c:forEach items="${positionList}" var="position">
                            <option value="${position.id}" class="w-100">${position.name}</option>
                        </c:forEach>
                    </select>
                    <c:if test="${validate.positionId != null}">
                        <label class="text-danger"> ${validate.positionId}</label>
                    </c:if>
                </div>


                <div class="form-group">
                    <label>Division Id</label>
                    <select name="divisionId" class="w-100 form-control" value="${employee.divisionId}">
                        <option value="" class="w-100">Bộ phận</option>
                        <c:forEach items="${divisionList}" var="division">
                            <option value="${division.id}" class="w-100">${division.name}</option>
                        </c:forEach>
                    </select>
                    <c:if test="${validate.divisionId!= null}">
                        <label class="text-danger"> ${validate.divisionId}</label>
                    </c:if>
                </div>


                <div class="form-group">
                    <label>Id Card</label>
                    <input class="form-control" type="text" name="idCard" value="${employee.idCard}">
                    <%--                           pattern="^[0-9]{9}|[0-9]{12}$"--%>
                    <c:if test="${validate.divisionId!= null}">
                        <label class="text-danger"> ${validate.divisionId}</label>
                    </c:if>
                </div>


                <div class="form-group">
                    <label>Email</label>
                    <input class="form-control" type="email" name="email" value="${employee.email}">
                    <%--                           pattern="^(([^<>()\\[\\]\\\\.,;:\\s@\']+(\\.[^<>()\\[\\]\\\\.,;:\\s@\']+)*)|(\'.+\'))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$">--%>
                    <c:if test="${validate.email != null}">
                        <label class="text-danger"> ${validate.email}</label>
                    </c:if>
                </div>


                <div class="form-group">
                    <label>Education Degree Id</label>
                    <select name="educationDegreeId" class="w-100 form-control" value="${employee.educationDegreeId}">
                        <option value="" class="w-100">Học vấn</option>
                        <c:forEach items="${educationList}" var="education">
                            <option value="${education.id}" class="w-100">${education.name}</option>
                        </c:forEach>
                    </select>
                    <c:if test="${validate.educationDegreeId != null}">
                        <label class="text-danger"> ${validate.educationDegreeId}</label>
                    </c:if>
                </div>

                <input class="form-control" type="hidden" name="userName" value="${employee.userName}">

                <button class="btn btn-dark" type="submit">Update</button>
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
