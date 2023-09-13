<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <title>Registration Form</title>
    <style>
        <#include "./assets/css/style.css">
        <#include "./assets/bootstrap/bootstrap.min.css">
    </style>
</head>

<body class="bg-warning">
    <div style="position:fixed;top:80px;left:20px;z-index:2;">
    <#if errors?has_content>
    <#list errors as error>
    <div class="errorPopup alert bg-danger py-0 m-1" role="alert">${error}</div>
    </#list>
    </#if>
    </div>
    <#include "header.ftl">
        <div class="container">
            <div class="row" id="register-user-header">
                <div class="col bg-secondary text-center user-icon-div p-3">
                    <h3 class="text-white">Register here</h3>
                </div>
            </div>
            <div class="row">
                <div class="col p-0 bg-light">
                    <form id="registration-form" action="create" method="post" enctype="multipart/form-data"
                    class="border border-solid border-black rounded-lg p-4">
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="fname">First name</label>
                            <input type="text" class="form-control" id="fname" placeholder="Enter first name"
                               name="firstName">
                            <small id="fnameHelp" class="form-text"></small>
                        </div>
                        <div class="form-group col-6">
                            <label for="lname">Last name</label>
                            <input type="text" class="form-control" id="lname" placeholder="Enter last name"
                               name="lastName">
                            <small id="lnameHelp" class="form-text"></small>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="mobile-number">Mobile number</label>
                            <input type="text" class="form-control" id="mobile-number" placeholder="Enter mobile number"
                               name="mobile">
                            <small id="mobileHelp" class="form-text"></small>
                        </div>
                        <div class="form-group col-6">
                            <label for="email-address">Email address</label>
                            <input type="email" class="form-control" id="email-address" placeholder="Enter email"
                               name="email">
                            <small id="emailHelp" class="form-text"></small>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="row">
                                <div class="form-group col-5">
                                    <label class="d-block">Role</label>
                                    <input type="radio" name="role" class="role" id="admin" value="ADMIN">
                                    <label for="admin">Admin</label>
                                    <input type="radio" name="role" class="role" id="user" value="USER">
                                    <label for="user">User</label>
                                    <small id="roleHelp" class="form-text"></small>
                                </div>
                                <div class="form-group col-7">
                                    <label class="d-block">Gender</label>
                                    <input type="radio" name="gender" class="gender" id="male" value="male">
                                    <label for="male">Male</label>
                                    <input type="radio" name="gender" class="gender" id="female" value="female">
                                    <label for="female">Female</label>
                                    <input type="radio" name="gender" class="gender" id="others" value="others">
                                    <label for="others">Others</label>
                                    <small id="genderHelp" class="form-text"></small>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-6">
                            <label for="dob">Date of Birth</label><br>
                            <input type="text" id="dob" name="dob">
                            <span id="calendar-icon" class="fa fa-calendar"></span>
                            <small id="dateHelp" class="form-text"></small>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="d-block">Address</label>
                        <button type="button" class="btn btn-outline-primary" id="add-address-btn">Add Address</button>
                        <small id="addressHelp" class="form-text"></small>
                        <div class="form-group w-100 d-none mt-3" id="address">
                            <input type="text" class="form-control mb-2" placeholder="Street" id="inputStreet" >
                            <input type="text" class="form-control mb-2" id="inputCity" placeholder="City" >
                            <input type="text" class="form-control  mb-2" id="inputState" placeholder="State" >
                            <input type="text" class="form-control mb-2" id="inputZip" placeholder="Zip" >
                            <input type="text" class="form-control " id="inputCountry" placeholder="County" >
                            <button type="button" class="btn btn-primary" id="save-address-btn">Add</button>
                            <button type="button" class="btn btn-primary" id="cancel-address-btn">Cancel</button>
                        </div>
                        <div id="addresses"></div>
                    </div>

                    <div class="row">
                        <div class="form-group col-6">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" placeholder="Password"
                               name="password">
                            <small id="passwordHelp" class="form-text"></small>
                        </div>
                        <div class="form-group col-6">
                            <label for="cnf-password">Confirm password</label>
                            <input type="password" class="form-control" id="cnf-password" placeholder="Confirm password">
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
                            <input type="text" class="form-control" id="security-answer" placeholder="Enter answer here" name="securityAnswer">
                            <small id="securityanswerHelp" class="form-text"></small>
                        </div>

                        <div class="form-group col-6 mt-4">
                            <label for="profile-photo">Profile Photo</label><br>
                            <input type="file" id="profile-photo" name="profieImage">
                            <small id="profilephotoHelp" class="form-text"></small>
                        </div>
                    </div>

                    <input type="submit" value="Submit" class="btn btn-primary w-25" id="submit-btn" />
                    <input type="reset" value="Reset" class="btn btn-primary ml-2 w-25" />
                    </form>
                </div>
            </div>
        </div>
<#include "footer.ftl">
<script>
        <#include "./assets/jquery/jQuery 3.6.4.js">
        <#-- <#include "./assets/js/validation.js"> -->
        <#include "./assets/jquery/jquery-ui.js">
</script>

</body>
</html>