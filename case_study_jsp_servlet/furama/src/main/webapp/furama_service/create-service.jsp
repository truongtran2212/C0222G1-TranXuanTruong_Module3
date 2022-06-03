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

        <form action="/service?action=create" method="post" class="w-100 bg-white">
            <c:if test="${mess!=null}">
                <h6>${mess}</h6>
            </c:if>
            <a href="/service" style="font-size: 2rem">Back list Service</a>
            <div class="p-3">
                <div class="form-group">
                    <label>Id Service</label>
                    <input class="form-control" type="text" name="idService">
                </div>

                <div class="form-group">
                    <label>Service Name</label>
                    <input class="form-control" type="text" name="serviceName">
                </div>

                <div class="form-group">
                    <label>Service Area</label>
                    <input class="form-control" type="text" name="serviceArea">
                </div>

                <div class="form-group">
                    <label>Service Cost</label>
                    <input class="form-control" type="text" name="serviceCost">
                </div>

                <div class="form-group">
                    <label>Service Max people</label>
                    <input class="form-control" type="text" name="serviceMaxpeople">
                </div>

                <div class="form-group">
                    <label>Standard Room</label>
                    <input class="form-control" type="text" name="standardRoom">
                </div>

                <div class="form-group">
                    <label>Description Other Convenience</label>
                    <input class="form-control" type="text" name="descriptionOtherConvenience">
                </div>


                <div class="form-group">
                    <label>Pool Area</label>
                    <input class="form-control" type="text" name="poolArea">
                </div>

                <div class="form-group">
                    <label>Number Of Floors</label>
                    <input class="form-control" type="text" name="numberOfFloors">
                </div>

                <div class="form-group">
                    <label>Rent Type Id</label>
                    <select name="rentTypeId" class="w-100 form-control">
                        <option value="1" class="w-100">Year</option>
                        <option value="2" class="w-100">Month</option>
                        <option value="3" class="w-100">Day</option>
                        <option value="4" class="w-100">Member</option>
                    </select>
                </div>


                <div class="form-group">
                    <label>Service Type Id</label>
                    <select name="serviceTypeId" class="w-100 form-control">
                        <option value="1" class="w-100">Villa</option>
                        <option value="2" class="w-100">Houser</option>
                        <option value="3" class="w-100">Room</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Status</label>
                    <input class="form-control" type="hidden" name="status">
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
