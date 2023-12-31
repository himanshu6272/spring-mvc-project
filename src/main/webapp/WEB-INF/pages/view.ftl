<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <title>User Details</title>
  <style>
    <#include "./assets/css/style.css">
    <#include "./assets/bootstrap/bootstrap.min.css">
  </style>
</head>

<body class="bg-warning">
<div id="errorPopup" class="alert" role="alert">
</div>
<div id="successPopup"  class="alert bg-success p-2 d-none" role="alert"><#if success?has_content>${success}</#if></div>
<#include "header.ftl">
<div class="container div-cont">
  <div class="row" id="register-user-header">
    <div class="col bg-secondary text-center user-icon-div p-3">
      <div id="profile-image" class="mx-auto">
        <img alt="Profile photo" src="${imgUrl}" />
      </div>
      <h3 class="text-white">User Details</h3>
    </div>
  </div>
  <div class="row">
    <div class="col p-0 bg-light">
      <form action="edit" id="registration-form" method="post" enctype="multipart/form-data"
                              class="border border-solid border-black rounded-lg p-4">
        <div class="row">
          <div class="form-group col-6">
            <label for="fname">First name</label>
            <input hidden type="text" name="id" value="${user.getId()}">
            <input disabled type="text" class="form-control" id="fname" name="firstName" value="${user.getFirstName()}">
            <small id="fnameHelp" class="form-text"></small>
          </div>
          <div class="form-group col-6">
            <label for="lname">Last name</label>
            <input disabled type="text" class="form-control" id="lname" name="lastName" value="${user.getLastName()}">
            <small id="lnameHelp" class="form-text"></small>
          </div>
        </div>
        <div class="row">
          <div class="form-group col-6">
            <label for="mobile-number">Mobile number</label>
            <input disabled type="text" class="form-control" id="mobile-number" name="mobile" value="${user.getMobile()}">
            <small id="mobileHelp" class="form-text"></small>
          </div>
          <div class="form-group col-6">
            <label for="email-address">Email address</label>
            <input disabled type="email" class="form-control" id="email-address" name="email" value="${user.getEmail()}">
            <small id="emailHelp" class="form-text"></small>
          </div>
        </div>

        <div class="row">
          <div class="col-6">
            <div class="row">
              <#if loggedIn == "ADMIN">
              <div class="form-group col-5">
                <label class="d-block">Role</label>
                <input disabled type="radio" name="role" class="role" id="admin" value="ADMIN" <#if user.role == 'ADMIN'>checked</#if>>
                <label for="admin">Admin</label>
                <input disabled type="radio" name="role" class="role" id="user" value="USER" <#if user.role == 'USER'>checked</#if>>
                <label for="user">User</label>
                <small id="rolehelp" class="form-text"></small>
              </div>
              </#if>
              <div class="form-group col-7">
                <label class="d-block">Gender</label>
                <input disabled type="radio" name="gender" class="gender" id="male" value="male" <#if user.gender == 'male'>checked</#if>>
                <label for="male">Male</label>
                <input disabled type="radio" name="gender" class="gender" id="female" value="female" <#if user.gender == 'female'>checked</#if>>
                <label for="female">Female</label>
                <input disabled type="radio" name="gender" class="gender" id="others" value="others" <#if user.gender == 'others'>checked</#if>>
                <label for="others">Others</label>
                <small id="genderHelp" class="form-text"></small>
              </div>
            </div>
          </div>
          <div class="form-group col-6">
            <label for="dob">Date of Birth</label><br>
            <input disabled type="text" id="dob" name="dob" value="${user.getDob()}">
            <span id="calendar-icon" class="fa fa-calendar"></span>
            <small id="dateHelp" class="form-text"></small>
          </div>
        </div>

        <div class="form-group">
          <label class="d-block">Address</label>
          <button type="button" class="btn btn-outline-primary mb-2 d-none" id="add-address-btn">Add Address</button>
          <small id="addressHelp" class="form-text"></small>
          <div class="form-group w-100 d-none mt-3" id="address">
            <input disabled type="text" class="form-control mt-2"  id="inputStreet" placeholder="enter street">
            <small id="streetHelp" class="form-text mt-0"></small>
            <input disabled type="text" class="form-control mt-2" id="inputCity" placeholder="enter city">
            <small id="cityHelp" class="form-text mt-0"></small>
            <input disabled type="text" class="form-control  mt-2" id="inputState" placeholder="enter state">
            <small id="stateHelp" class="form-text mt-0"></small>
            <input disabled type="text" class="form-control mt-2" id="inputZip" placeholder="enter zipcode">
            <small id="zipHelp" class="form-text mt-0"></small>
            <input disabled type="text" class="form-control mt-2" id="inputCountry" placeholder="enter country">
            <small id="countryHelp" class="form-text mt-0 mb-3"></small>
            <button type="button" class="btn btn-primary" id="save-address-btn">Add</button>
            <button type="button" class="btn btn-primary" id="cancel-address-btn">Cancel</button>
          </div>

          <div id="addresses" class="mb-3 border border-solid border-warning">
          <#list addresses as address>
          <div class="address border border-black p-2 m-3">
          <input hidden name="aid" value="${address.getAid()}">
          <label>Street</label><br>
          <input disabled class="form-control" name="street" value="${address.getStreet()}">
          <label>City</label><br>
          <input disabled class="form-control" name="city" value="${address.getCity()}">
          <label>State</label><br>
          <input disabled class="form-control" name="state" value="${address.getState()}">
          <label>Zip</label><br>
          <input disabled class="form-control" name="zip" value="${address.getZip()}">
          <label>Country</label><br>
          <input disabled class="form-control" name="country" value="${address.getCountry()}">
          <a type="button" class="btn btn-primary remove-address-btn text-white mt-3">Remove</a>
          </div>
          </#list>
        </div>

        <#-- <div class="row">
          <div class="form-group col-6">
            <label for="password">Password</label>
            <input disabled type="password" class="form-control" id="password" name="password" value="${user.getPassword()}">
            <small id="passwordHelp" class="form-text"></small>
          </div>
          <div class="form-group col-6">
            <label for="cnf-password">Confirm password</label>
            <input disabled type="password" class="form-control" id="cnf-password" value="${user.getPassword()}">
            <small id="cnfpasswordHelp" class="form-text"></small>
          </div>
          </div>
          <div class="row">
            <div class="form-group col-6">
                <label for="security-que">Security question: </label>
                <select class="form-control" name="securityQuestion" id="security-que">
                    <option value="none">None</option>
                    <option>Who is your favourite Bollywood Star?</option>
                    <option>Who is your favourite Cricketer?</option>
                    <option>Who is your favourite Teacher?</option>
                    <option>Who you love the most?</option>
                </select>
                <small id="securityQuestionHelp" class="form-text mb-4"></small>
                <input type="text" class="form-control" id="security-answer" placeholder="Enter answer here" name="securityAnswer" value="${user.getSecurityAnswer()}">
                <small id="securityanswerHelp" class="form-text"></small>
            </div> -->

            <div class="form-group col-6 mt-4">
                <label for="profile-photo">Profile Photo</label><br>
                <input type="file" id="profile-photo" name="profieImage">
                <small id="profilephotoHelp" class="form-text"></small>
            </div>
          </div>

        <div class="text-center w-100 mt-3">
        <button type="button" class="btn btn-primary w-25 mx-3" id="edit-user-btn">Edit</button>
        <input disabled type="submit" value="Update" class="btn btn-primary w-25 mx-3 update-user-btn" id="submit-btn" />
        </div>
      </form>
      </div>
    </div>
  </div>
  </div>
</div>
<#include "footer.ftl">
<script >
    <#include "./assets/jquery/jQuery 3.6.4.js">
    <#include "./assets/jquery/jquery-ui.js">
    <#include "./assets/js/view.js">
</script>


</body>
</html>