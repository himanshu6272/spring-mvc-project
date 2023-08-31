
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    <#include "./assets/css/style.css">
    <#include "./assets/bootstrap/bootstrap.min.css">
    </style>
</head>

<body class="bg-warning">
    <#include "header.ftl">
    <div class="container div-cont">
        <div class="row">
            <div class="jumbotron col mb-0 text-warning mt-5 bg-dark">
                <h1 class="display-4 font-weight-normal my-4">Welcome to Inexture</h1>
                <p class="lead text-white">We specialise in enterprise software development, leveraging our expertise in Python, Java, and Mobile App development to turn innovative ideas into successful software solutions. With our offshore team of skilled developers, we bring a wealth of experience and knowledge to the table, driving results through cutting-edge technology and precision in every detail.</p>
                <hr class="my-4 bg-warning">
                <p class="lead">
                    <a class="btn btn-outline-warning btn-lg mr-3" href="register" role="button">Register</a>
                    <a class="btn btn-outline-warning btn-lg" href="login" role="button">Login</a>
                </p>
            </div>
        </div>
    </div>
    <#include "footer.ftl">
</body>
</html>