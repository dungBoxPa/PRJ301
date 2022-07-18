<%-- 
    Document   : login
    Created on : Dec 30, 2021, 2:27:05 PM
    Author     : Windows 10 TIMT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=chrome">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="static/css/login.css">
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://kit.fontawesome.com/f89c9331b3.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <style>

        </style>
    </head>

    <body>
        <div class="login-wrapper">
            <div class="login">
                <div class="login-section">
                    <div class="welcome-login">
                        <h1>Sign In</h1>
                        <p>Login here using your email and password</p>
                    </div>

                    <div class="input-section" style="margin: auto;">

                        <form action="login" method="POST">
                            <span class="input-section__icon"><i class="far fa-user"></i></span>
                            <input class="user-input" name="username" id="input_required" type="text" placeholder="@Username"></input>
                            <br>
                            <span class="input-section__icon"><i class="fas fa-key"></i></span>
                            <input class="user-input" name="password" id="input_required" type="password" placeholder="Password">
                            <span></span>
                            <br>
                            <button class="user-input submit-btn" type="submit">Log In</button>
                        </form>
                    </div>
                    <div class="side-services d-flex">
                        <button class="side-services_btn" id="forgot" type=""><span id="forgot2">Forgot</span><span id="forgot1">Password</span></button>
                        <button class="side-services_btn" id="sign-up" style="background-color: rgb(236, 227, 147);">
                            <a href="register" style="text-decoration: none; color: #000; font-weight: bold;">Sign Up</a>
                            <i class="fas fa-user-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        alert("${requestScope.alert}");
    </script>
</html>