<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        <#include "./assets/bootstrap/bootstrap.min.css">
        <#include "./assets/css/style.css">

    </style>
</head>
<body class="bg-warning">
    <#if errorMessage?has_content><div id="errorPopup" class="alert bg-danger" role="alert">${errorMessage}</div></#if>
    <#include "header.ftl">
        <div class="container div-cont">
            <div class="row w-50 mx-auto pt-5">
                <div class="col bg-secondary text-center login-user-icon-div p-3 rounded-top">
                    <h4 class="text-white">Login here</h4>
                </div>
            </div>
            <div class="row w-50 mx-auto">
                <div class="col w-75 bg-dark p-5 rounded-bottom">
                    <form action="loginUser" class="border border-solid border-warning rounded-lg p-4 text-warning" method="post" id="login-form">
                        <div class="form-group">
                            <label for="email-address">Email</label>
                            <input type="text" class="form-control" id="email-address" placeholder="enter email" name="email">
                            <small id="emailHelp" class="form-text"></small>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" placeholder="enter password" name="password">
                            <small id="passwordHelp" class="form-text"></small>
                        </div>
                        <input type="submit" class="btn btn-outline-warning" id="submit-btn" value="Submit">
                    </form>
                    <a href="forgot">Forgot Password</a>
                    <div class="text-center text-warning"><p class="d-inline">New user: &nbsp;</p><a href="register">create account</a></div>
                </div>
            </div>
        </div>
<#include "footer.ftl">
<script>
    <#include "./assets/jquery/jQuery 3.6.4.js">
    <#include "./assets/jquery/jquery-ui.js">
    <#include "./assets/js/login.js">
</script>
</body>
</html>