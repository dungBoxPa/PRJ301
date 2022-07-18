<%-- 
    Document   : signin
    Created on : Dec 30, 2021, 2:28:18 PM
    Author     : Windows 10 TIMT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign up</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="static/css/login.css">
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://kit.fontawesome.com/923f3593e0.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <style>
            .login-wrapper {
                width: 100%;
                /* height: 1000px; */
            }
        </style>
    </head>

    <body>
        <div class="login-wrapper">
            <div class="login">
                <div class="login-section" style="height: auto; width: 50%">
                    <header class="welcome-login">
                        <h1>Sign Up</h1>
                        <p>Input the following form to create new account</p>
                    </header>
                    <div class="input-section" style="margin: auto; ">
                        <form action="register" method="POST">
                            <input class="user-input" name="firstName" id="input_required" type="text" placeholder="First Name" style=" width: 48%;"/>
                            <input class="user-input" name="lastName" id="input_required" type="text" placeholder="Last Name" style="width: 48%;"/>
                            <input class="user-input" name="phonenumber" id="input_required" type="text" placeholder="Phone Number" style=" width: 48%;"/>
                            <input class="user-input" name="address" id="input_required" type="text" placeholder="Adress" style=" width: 48%;"/>
                            <br>
                            <span class="input-section__icon"><i class="far fa-user"></i></span>
                            <input class="user-input" name="username" id="input_required" type="text" placeholder="@Email"/>
                            <br>
                            <span class="input-section__icon"><i class="fas fa-key"></i></span>
                            <input class="user-input" name="password1" id="input_required" type="password" placeholder="password"/>
                            <br>
                            <span class="input-section__icon"><i class="fas fa-key"></i></span>
                            <input class="user-input" name="password2" id="input_required" type="password" placeholder="Re-enter the password"/>
                            <br>
                            <input class="user-input submit-btn" type="submit" value="Sign Up"/>
                        </form>
                    </div>
                    <div class="alert" style="color: #fff;">
                        <p>${requestScope.alert}</p>
                    </div>
                    <div class="side-services d-flex">
                        <button class="side-services_btn" id="forgot" type=""><span id="forgot2">Forgot</span><span id="forgot1">Password</span></button>
                        <button class="side-services_btn" id="sign-up" style="background-color: rgb(236, 227, 147);">
                            <a href="login" style="text-decoration: none; color: #000; font-weight: bold;">Sign in</a>
                            <i class="fas fa-user-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>