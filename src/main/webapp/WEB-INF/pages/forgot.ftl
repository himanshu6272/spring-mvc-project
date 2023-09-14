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
<div id="successPopup"  class="alert bg-success p-2 d-none" role="alert"><#if success?has_content>${success}</#if></div>
<#include "header.ftl">
<div class="container div-cont">
  <div class="row w-50 mx-auto">
    <div class="col bg-secondary text-center login-user-icon-div p-2 rounded-top mt-5">
      <h4 class="text-white">Forgot Password</h4>
    </div>
  </div>
  <div class="row w-50 mx-auto">
    <div class="col w-75 bg-dark p-5 rounded-bottom">
    <form action="forgotPassword" class="border border-solid border-warning rounded-lg p-4 text-warning" method="post" id="forgot-form">
            <div class="form-group">
              <label for="email-address">Email</label>
              <input type="text" class="form-control" id="email-address" placeholder="enter email" name="email">
              <small id="emailHelp" class="form-text"></small>
            </div>
            <div class="form-group">
                <label for="security-que">Security question: </label>
                <select class="form-control" name="securityQuestion" id="security-que">
                    <option value="none">None</option>
                    <option>Who is your favourite Bollywood Star?</option>
                    <option>Who is your favourite Cricketer?</option>
                    <option>Who is your favourite Teacher?</option>
                    <option>Who you love the most?</option>
                </select>
                <small id="securityQuestionHelp" class="form-text mb-4"></small>
                <input type="text" class="form-control" id="security-answer" placeholder="Enter answer here" name="securityAnswer">
                <small id="securityanswerHelp" class="form-text"></small>
            </div>
            <input type="submit" class="btn btn-outline-warning" id="submit-btn" value="Submit">
    </form>
    </div>
  </div>
</div>
<#include "footer.ftl">
<script>
    <#include "./assets/jquery/jQuery 3.6.4.js">
    <#include "./assets/jquery/jquery-ui.js">
    <#include "./assets/js/forgot.js">
</script>
</body>
</html>
