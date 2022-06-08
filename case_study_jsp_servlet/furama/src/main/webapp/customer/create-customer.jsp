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

        <form action="/customer?action=create" method="post" class="w-100 bg-white">
            <c:if test="${mess!=null}">
                <h6>${mess}</h6>
            </c:if>
            <a href="/customer" style="font-size: 2rem">Back list Customer</a>
            <div class="p-3">
                <div class="form-group">
                    <label>Id Customer</label>
                    <input class="form-control" type="text" name="idCustomer">
                    <c:if test="${validate.get('idCustomer') != null}">
                        <label class="text-danger"> ${validate.get('idCustomer')}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Customer Name</label>
                    <input class="form-control" type="text" name="customerName">
                    <c:if test="${validate.get('customerName') != null}">
                        <label class="text-danger"> ${validate.get('customerName')}</label>
                    </c:if>

                </div>

                <div class="form-group">
                    <label>Day Of Birth</label>
                    <input class="form-control" type="date" name="birthday">
                    <c:if test="${validate.get('birthday') != null}">
                        <label class="text-danger"> ${validate.get('birthday')}</label>
                    </c:if>

                </div>

                <div class="form-group">
                    <label>Gender</label>
                    <select name="gender" class="w-100 form-control">
                        <option value="1" class="w-100">Nam</option>
                        <option value="0" class="w-100">Nữ</option>
                    </select>
                    <c:if test="${validate.get('gender') != null}">
                        <label class="text-danger"> ${validate.get('gender')}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Id Card</label>
                    <input class="form-control" type="text" name="idCard">
                    <c:if test="${validate.get('idCard') != null}">
                        <label class="text-danger"> ${validate.get('idCard')}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Phone</label>
                    <input class="form-control" type="text" name="phone">
                    <c:if test="${validate.get('phone') != null}">
                        <label class="text-danger"> ${validate.get('phone')}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input class="form-control" type="email" name="email">
                    <c:if test="${validate.get('email') != null}">
                        <label class="text-danger"> ${validate.get('email')}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input class="form-control" type="text" name="address">
                    <c:if test="${validate.get('address') != null}">
                        <label class="text-danger"> ${validate.get('address')}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Customer type id</label>
                    <select name="customerTypeId" class="w-100 form-control">
                        <option value="" class="w-100">Customer Type</option>
                        <c:forEach items="${customerTypeList}" var="customerType">
                            <option value="${customerType.id}">${customerType.name}</option>
                        </c:forEach>
                    </select>
                    <c:if test="${validate.get('customerTypeId') != null}">
                        <label class="text-danger"> ${validate.get('customerTypeId')}</label>
                    </c:if>
                </div>

                <div class="form-group">
                    <label>Status</label>
                    <input class="form-control" type="hidden" name="status">
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
