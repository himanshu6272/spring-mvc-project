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

<#include "header.ftl">
<div class="container div-cont bg-secondary">
  <div class="row">
    <div class="bg-dark w-100 p-2">
        <h3 class="text-warning d-inline ml-4" style="margin-right:200px;">Admin Dashboard</h3>
        <input type="text" id="myInput" placeholder="Search for names.." class="ml-5">
    </div>
    <table class="table text-warning text-center border-bottom border-white" id="myTable">
      <tr>
        <th style="width:10%;">Sr. No.</th>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Action</th>
      </tr>
      <#list users as user>
      <tr>
        <td>${user.getId()}</td>
        <td>${user.getFirstName()}</td>
        <td>${user.getEmail()}</td>
        <td>${user.getRole()}</td>
        <td class="w-25">
        <a href="view/${user.getId()}" class="btn btn-warning py-1 view-user-btn">View</a>
        <a href="" class="btn btn-warning py-1 remove-user-btn">Delete</a>
        </td>
      </tr>
      </#list>
    </table>
  </div>
</div>
<#include "footer.ftl">

<script>
    <#include "./assets/jquery/jQuery 3.6.4.js">
    <#include "./assets/jquery/jquery-ui.js">
    <#include "./assets/js/admin.js">
</script>

</body>
</html>