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

        <form action="/employee?action=create" method="post" class="w-100 bg-white">
            <c:if test="${mess!=null}">
                <h6>${mess}</h6>
            </c:if>
            <a href="/employee" style="font-size: 2rem">Back list Employee</a>
            <div class="p-3">
                <h4 style="text-align: center">Thêm mới nhân viên</h4>
                <div class="form-group">
                    <label>Employee Name</label>
                    <input class="form-control" type="text" name="name">


                    <%--              name ở đây là key của Map<>--%>
                    <%--                    Map<> có thể . thẳng key giống như thuộc tính--%>
                    <c:if test="${validate.name != null}">
                        <label class="text-danger"> ${validate.name}</label>

                    </c:if>
                </div>

                <div class="form-group">
                    <label>Day Of Birth</label>
                    <input class="form-control" type="date" name="birthday">

                    <%--                    birthday ở đây là key của Map<>--%>
                    <%--                    Map<> có thể . thẳng key giống như thuộc tính--%>
                    <c:if test="${validate.birthday != null}">
                        <label class="text-danger"> ${validate.birthday}</label>

                    </c:if>
                </div>

                <div class="form-group">
                    <label>Phone</label>
                    <input class="form-control" type="text" name="phone">

                    <%--                    phone ở đây là key của Map<>--%>
                    <%--                    Map<> có thể . thẳng key giống như thuộc tính--%>
                    <c:if test="${validate.phone != null}">
                        <label class="text-danger"> ${validate.phone}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input class="form-control" type="text" name="address">
                    <%--                    address ở đây là key của Map<>--%>
                    <%--                    Map<> có thể . thẳng key giống như thuộc tính--%>
                    <c:if test="${validate.address != null}">
                        <label class="text-danger"> ${validate.address}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Salary</label>
                    <input class="form-control" type="text" name="salary">
                    <%--                    salary ở đây là key của Map<>--%>
                    <%--                    Map<> có thể . thẳng key giống như thuộc tính--%>

                    <c:if test="${validate.salary != null}">
                        <label class="text-danger"> ${validate.salary}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Position Id</label>
                    <select name="positionId" class="w-100 form-control">
                        <option value="" class="w-100">Vị trí</option>
                        <c:forEach items="${positionList}" var="position">
                            <option value="${position.id}" class="w-100">${position.name}</option>
                        </c:forEach>
                    </select>

                    <%--                    positionId ở đây là key của map--%>
                    <%--                    map có thể . thẳng key giống như thuộc tính--%>


                    <c:if test="${validate.positionId != null}">
                        <label class="text-danger"> ${validate.positionId}</label>
                    </c:if>
                </div>


                <div class="form-group">
                    <label>Division Id</label>
                    <select name="divisionId" class="w-100 form-control">
                        <option value="" class="w-100">Bộ phận</option>
                        <c:forEach items="${divisionList}" var="division">
                            <option value="${division.id}" class="w-100">${division.name}</option>
                        </c:forEach>
                    </select>

                    <%--                    divisionId ở đây là key của Map<>--%>
                    <%--                    Map<> có thể . thẳng key giống như thuộc tính--%>
                    <c:if test="${validate.divisionId!= null}">
                        <label class="text-danger"> ${validate.divisionId}</label>
                    </c:if>
                </div>


                <div class="form-group">
                    <label>Id Card</label>
                    <input class="form-control" type="text" name="idCard">

                    <%--                    idCard ở đây là key của Map<>--%>
                    <%--                    Map<> có thể . thẳng key giống như thuộc tính--%>
                    <c:if test="${validate.idCard!= null}">
                        <label class="text-danger"> ${validate.idCard}</label>
                    </c:if>
                </div>


                <div class="form-group">
                    <label>Email</label>
                    <input class="form-control" type="email" name="email">
                    <%--                    email ở đây là key của Map<>--%>
                    <%--                    Map<> có thể . thẳng key giống như thuộc tính--%>
                    <c:if test="${validate.email != null}">
                        <label class="text-danger"> ${validate.email}</label>
                    </c:if>
                </div>


                <div class="form-group">
                    <label>Education Degree Id</label>
                    <select name="educationDegreeId" class="w-100 form-control">
                        <option value="" class="w-100">Học vấn</option>
                        <c:forEach items="${educationList}" var="education">
                            <option value="${education.id}" class="w-100">${education.name}</option>
                        </c:forEach>
                    </select>
                    <%--                    educationDegreeId ở đây là key của Map<>--%>
                    <%--                    Map<> có thể . thẳng key giống như thuộc tính--%>
                    <c:if test="${validate.educationDegreeId != null}">
                        <label class="text-danger"> ${validate.educationDegreeId}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>User Name</label>
                    <input class="form-control" type="text" name="userName"
                           placeholder="inputsomething@furama.com.vn">

                    <%--                    userName ở đây là key của Map<>--%>
                    <%--                    Map<> có thể . thẳng key giống như thuộc tính--%>
                    <c:if test="${validate.userName != null}">
                        <label class="text-danger"> ${validate.userName}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <input class="form-control" type="password" name="password">
                    <%--                    password ở đây là key của Map<>--%>
                    <%--                    Map<> có thể . thẳng key giống như thuộc tính--%>
                    <c:if test="${validate.password!= null}">
                        <label class="text-danger"> ${validate.password}</label>
                    </c:if>
                </div>
                <button class="btn btn-dark" type="submit">Add new</button>
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
