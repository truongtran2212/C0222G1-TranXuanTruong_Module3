<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/3/2022
  Time: 9:42 AM
  To change this template use File | Settings | File Templates.
--%>
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

        <form action="/customer?action=update" method="post" class="w-100 bg-white">
            <c:if test="${mess!=null}">
                <h6>${mess}</h6>
            </c:if>
            <a href="/customer" style="font-size: 2rem">Back list Customer</a>
            <div class="p-3">
                <div class="form-group">
                    <label>Id Customer</label>
                    <input class="form-control" type="text" name="idCustomer"
                           value="${requestScope["customer"].getIdCustomer()}">
                </div>

                <div class="form-group">
                    <label>Customer Name</label>
                    <input class="form-control" type="text" name="customerName"
                           value="${requestScope["customer"].getCustomerName()}">
                </div>

                <div class="form-group">
                    <label>Day Of Birth</label>
                    <input class="form-control" type="text" name="birthday"
                           value="${requestScope["customer"].getBirthday()}">
                </div>

                <div class="form-group">
                    <label>Gender</label>
                    <select name="gender" class="w-100 form-control"  value="${requestScope["customer"].getGender()}">
                        <option value="1" class="w-100">Nam</option>
                        <option value="0" class="w-100">Nữ</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Id Card</label>
                    <input class="form-control" type="text" name="idCard"
                           value="${requestScope["customer"].getIdCard()}">
                </div>

                <div class="form-group">
                    <label>Phone</label>
                    <input class="form-control" type="text" name="phone" value="${requestScope["customer"].getPhone()}">
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input class="form-control" type="text" name="email" value="${requestScope["customer"].getEmail()}">
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input class="form-control" type="text" name="address"
                           value="${requestScope["customer"].getAddress()}">
                </div>

                <div class="form-group" >
                    <label>Customer type id</label>
                    <select name="customerTypeId" class="w-100 form-control" value="${requestScope["customer"].getCustomerTypeId()}">
                        <option value="1" class="w-100">Diamond</option>
                        <option value="2" class="w-100">Platinum</option>
                        <option value="3" class="w-100">Gold</option>
                        <option value="4" class="w-100">Silver</option>
                        <option value="5" class="w-100">Member</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Status</label>
                    <input class="form-control" type="text" name="status"
                           value="${requestScope["customer"].getStatus()}">
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
