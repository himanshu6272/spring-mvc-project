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
<#if error?has_content><div id="errorPopup" class="alert bg-danger" role="alert">${error}</div></#if>
<#include "header.ftl">
<div class="container div-cont">
  <div class="row w-50 mx-auto">
    <div class="col bg-secondary text-center login-user-icon-div p-2 rounded-top mt-5">
      <h4 class="text-white">Reset Password</h4>
    </div>
  </div>
  <div class="row w-50 mx-auto">
    <div class="col w-75 bg-dark p-5 rounded-bottom">
    <form action="resetPassword" class="border border-solid border-warning rounded-lg p-5 text-warning" method="post" id="reset-form">
            <div class="form-group">
                <label for="password">Password</label>
                <input hidden class="form-control" id="email" name="email" value="${email}">
                <input type="password" class="form-control" id="password" placeholder="Password"
                       name="password">
                <small id="passwordHelp" class="form-text"></small>
            </div>
            <div class="form-group">
                <label for="cnf-password">Confirm password</label>
                <input type="password" class="form-control" id="cnf-password" placeholder="Confirm password">
                <small id="cnfpasswordHelp" class="form-text"></small>
            </div>
            <input type="submit" class="btn btn-outline-warning w-50 mt-3" id="submit-btn" value="Reset">
    </form>
    </div>
  </div>
</div>
<#include "footer.ftl">
<script>
    <#include "./assets/jquery/jQuery 3.6.4.js">
    <#include "./assets/jquery/jquery-ui.js">
    <#include "./assets/js/reset.js">
</script>
</body>
</html>
