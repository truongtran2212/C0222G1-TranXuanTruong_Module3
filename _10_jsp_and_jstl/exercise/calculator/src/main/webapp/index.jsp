<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/27/2022
  Time: 3:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4" style="border: 1px solid royalblue">
            <h2 style="margin-left: 30%">Simple Calculator</h2>
            <form action="/calculator" method="post" style="display: flex; flex-wrap: wrap">

                <div class="col-md-6">
                    <label for="first">First operand:</label><br>
                    <label for="operator">Operator:</label><br>
                    <label for="second">Second operand:</label>
                </div>

                <div class="col-md-6">
                    <input type="text" id="first" name="first_operand">
                    <select name="operator" id="operator">
                        <option value="+">Addition</option>
                        <option value="-">Subtraction</option>
                        <option value="*">Multiplication</option>
                        <option value="/">Division</option>
                    </select>
                    <input type="text" id="second" name="second_operand">
                </div>
                <button type="submit" class="btn btn-primary" style="margin-left: 40%">Calculate</button>
            </form>
        </div>
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
