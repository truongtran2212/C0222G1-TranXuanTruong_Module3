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
            <img src="https://kynghiviet.vn/public/upload/Tour/2020/FURAMA%20RESORT%20DA%20NANG/furama%20logo.png"
                 height="100px" width="100%">
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
        <form action="/customer" method="get">

            <input type="hidden" name="action" value="search">
            <input type="text" name="name" placeholder="nhập tên">
            <select name="id">
                <option value="">Select Customer Type</option>
                <c:forEach items="${customerTypeList}" var="customerType">
                    <option value="${customerType.id}">${customerType.name}</option>
                </c:forEach>
            </select>
            <button type="submit">Search</button>
        </form>
    </div>


    <div class="center container">
        <h1 style="text-align: center">Danh sách khách hàng</h1>

        <table border="1" style="border-collapse:  collapse; margin-left: 40px; width: 100%">
            <tr>
                <th>Id Customer</th>
                <th>Customer Name</th>
                <th>Birthday</th>
                <th>Gender</th>
                <th>Id Card</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>Customer Type Id</th>
                <th>Status</th>
                <th colspan="2" style="text-align: center">Mission</th>
            </tr>
            <c:forEach items="${customerList}" var="customer">
                <c:if test="${customer.status==0}">
                    <tr>
                        <td>${customer.idCustomer}</td>
                        <td>${customer.customerName}</td>
                        <td>${customer.birthday}</td>
                        <td>
                            <c:if test="${customer.gender==1}">Nam</c:if>
                            <c:if test="${customer.gender==0}">Nữ</c:if>
                        </td>
                        <td>${customer.idCard}</td>
                        <td>${customer.phone}</td>
                        <td>${customer.email}</td>
                        <td>${customer.address}</td>
                        <td>
                            <c:if test="${customer.customerTypeId == 1}">Diamond</c:if>

                            <c:if test="${customer.customerTypeId == 2}">Platinum</c:if>

                            <c:if test="${customer.customerTypeId == 3}">Gold</c:if>

                            <c:if test="${customer.customerTypeId == 4}">Silver</c:if>

                            <c:if test="${customer.customerTypeId == 5}">Member</c:if>

                        </td>
                        <td>${customer.status}</td>
                        <td>
                            <a href="/customer?action=update&idCustomer=${customer.idCustomer}">
                                <button type="button" class="btn btn-primary">update</button>
                            </a>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#h${customer.idCustomer}">
                                Delete
                            </button>
                            <div class="modal fade" id="h${customer.idCustomer}" tabindex="-1" role="dialog"
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
                                            <a href="/customer?action=delete&idCustomer=${customer.idCustomer}">
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
        <a href="/customer/create-customer.jsp" ><button type="button" class="btn btn-primary">Add new</button></a>
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
