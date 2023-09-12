<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
    <#include "./assets/bootstrap/bootstrap.min.css">
    </style>
    </head>
<body>
    <nav class="navbar navbar-light sticky-top font-weight-bold p-3">
        <a class="navbar-brand ml-5" href="index"><i class="fa-sharp fa-solid fa-house fa-2xl text-warning"></i></a>
        <#-- <#if loggedIn == 'ADMIN'><a href="admin/admin.getId()" class="btn btn-outline-warning ml-5 d-none" id="dashboard-btn">Dashboard</a></#if> -->
        <div class="mr-5" id="header-div">
            <a href="register" class="btn btn-outline-warning" id="register-btn">Register</a>
            <#-- <#if loggedIn == 'ADMIN'><a href="view/admin.getId()" class="btn btn-outline-warning d-none" id="update-profile-btn">Edit Profile</a></#if> -->

            <a href="login" class="btn btn-outline-warning ml-2" id="login-btn">Login</a>
        </div>
    </nav>
</body>
</html>
