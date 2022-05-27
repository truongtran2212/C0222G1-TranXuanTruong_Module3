<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/26/2022
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>$Title$</title>
    <link rel="stylesheet" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="VoucherCSS.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4" style="border: 1px solid royalblue">
            <h3 style="text-align: center">Product Discount Calculator</h3>

            <form action="/voucher" method="post"  style="display: flex; flex-wrap: wrap">


                <div class="col-md-6">
                    <label for="description">Product Description:</label>
                    <br>
                    <label for="price">List Price:</label>
                    <br>
                    <label for="discount">Discount Percent:</label>
                </div>


                <div class="col-md-6" >
                    <input type="text" id="description" name="description" placeholder="description" value="${productDescription}">

                    <input type="text" id="price" name="price" placeholder="price" value="${listPrice}">

                    <input type="text" id="discount" name="discount" placeholder="discountPercent" value="${discountPercent}">
                </div>

                <button type="submit" class="btn btn-primary" >Calculate Discount</button>
            </form>
        </div>
        <div class="col-md-4">Discount Amount: ${discountAmount}</div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>

<script src="bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>

</html>
