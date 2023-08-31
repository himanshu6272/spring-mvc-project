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
<#include "header.ftl">
<div class="container div-cont">
  <div class="row" id="register-user-header">
    <div class="col bg-secondary text-center user-icon-div p-3">
      <div id="profile-image" class="mx-auto">
        <img src="${imgUrl}" alt="Displayed Image">
      </div>
      <h3 class="text-white">User Details</h3>
    </div>
  </div>
  <div class="row">
    <div class="col p-0 bg-light">
      <form  onsubmit="return validate()" action="registerServlet" id="registration-form" method="post" enctype="multipart/form-data"
                              class="border border-solid border-black rounded-lg p-4">
        <div class="row">
          <div class="form-group col-6">
            <label for="fname">First name</label>
            <input disabled type="text" class="form-control" id="fname" name="firstname" value="${user.getFirstName()}">
            <small id="fnameHelp" class="form-text"></small>
          </div>
          <div class="form-group col-6">
            <label for="lname">Last name</label>
            <input disabled type="text" class="form-control" id="lname" name="lastname" value="${user.getLastName()}">
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

              <div class="form-group col-5">
                <label class="d-block">Role</label>
                <input disabled type="radio" name="role" class="role" id="admin" value="ADMIN" <#if user.role == 'ADMIN'>checked</#if>>
                <label for="admin">Admin</label>
                <input disabled type="radio" name="role" class="role" id="user" value="USER" <#if user.role == 'USER'>checked</#if>>
                <label for="user">User</label>
                <small id="rolehelp" class="form-text"></small>
              </div>
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
            <input disabled type="text" class="form-control mb-2"  id="inputStreet" placeholder="enter street">
            <input disabled type="text" class="form-control mb-2" id="inputCity" placeholder="enter city">
            <input disabled type="text" class="form-control  mb-2" id="inputState" placeholder="enter state">
            <input disabled type="text" class="form-control mb-2" id="inputZip" placeholder="enter zipcode">
            <input disabled type="text" class="form-control " id="inputCountry" placeholder="enter country">
            <button type="button" class="btn btn-primary" id="save-address-btn">Add</button>
            <button type="button" class="btn btn-primary" id="cancel-address-btn">Cancel</button>
          </div>
          <div id="addresses" class="mb-3 border border-solid border-warning">
          <#list addresses as address>
          <div class="address border border-black p-2 m-3">
          <div class="d-flex mb-2">
          <input hidden name="addressId" value="${address.getId()}">
          <div class="d-inline mr-2">
          <label>Street</label><br>
          <input disabled name="street" value="${address.getStreet()}"><br>
          </div>
          <div class="d-inline mr-2">
          <label>City</label><br>
          <input disabled name="city" value="${address.getCity()}"><br>
          </div>
          <div class="d-inline mr-2">
          <label>State</label><br>
          <input disabled name="state" value="${address.getState()}"><br>
          </div>
          <div class="d-inline mr-2">
          <label>Zip</label><br>
          <input disabled name="zip" value="${address.getZip()}"><br>
          </div>
          <div class="d-inline mr-2">
          <label>Country</label><br>
          <input disabled name="country" value="${address.getCountry()}"><br>
          </div>
          </div>
          <a type="button" class="btn btn-primary remove-address-btn text-white">Remove</a>
          </div>
          </#list>
        </div>

        <div class="row">
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
                <select class="form-control" name="security-que" id="security-que">
                    <option value="none">None</option>
                    <option>Who is your favourite Bollywood Star?</option>
                    <option>Who is your favourite Cricketer?</option>
                    <option>Who is your favourite Teacher?</option>
                    <option>Who you love the most?</option>
                </select>
                <small id="securityQuestionHelp" class="form-text mb-4"></small>
                <input type="text" class="form-control" id="security-answer" placeholder="Enter answer here" name="security-answer" value="${user.getSecurityAnswer()}">
                <small id="securityanswerHelp" class="form-text"></small>
            </div>

            <div class="form-group col-6 mt-4">
                <label for="profile-photo">Profile Photo</label><br>
                <input type="file" id="profile-photo" name="profile-photo">
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
    <#include "./assets/js/validation.js">
    <#include "./assets/js/view.js">
</script>


</body>
</html>