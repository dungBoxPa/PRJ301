<%-- 
    Document   : PersonalInfor
    Created on : Mar 12, 2022, 9:40:34 AM
    Author     : Windows 10 TIMT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://kit.fontawesome.com/923f3593e0.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="static/css/homeStyle.css">
        <style>
            #navbar {
                overflow: hidden;
                background-color: rgba(235, 30, 30, 0.2);
            }
            /* Navbar links */

            #navbar a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px;
                text-decoration: none;
            }

            .sticky {
                position: fixed;
                top: 0;
                width: 100%;
                background-color: rgba(235, 30, 30);
                z-index: 9999!important;
            }

            .category-items > ul{
                padding: 0;
            }

            .pagination a{
                padding: 6px 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);

            }

            .pagination a:hover{
                background-color: #ffbc00b3;
                color: #fff;
            }
            .acitve{
                background-color: #ffbc00b3;
                color: #fff;
            }
        </style>

    </head>
    <body>
        <div class="wrapper">
            <div class="header">
                <div class="header__top">
                    <div class="top__footer">
                        <div class="pulse"> </div>
                        <div class="call__header margin_10px" style="margin: auto 0;">
                            <p class="text__space__15px top__footer__element">
                                <i class="fas fa-phone-alt"></i> 099.999.999
                            </p>
                        </div>
                        <div class="address__header margin_10px">
                            <p class="text__space__15px top__footer__element">
                                <i class="fas fa-map-marker-alt"></i> 95 South Park Ave, USA
                            </p>
                        </div>
                        <div class="email__header margin_10px">
                            <p class="text__space__15px top__footer__element">
                                <i class="fas fa-envelope"></i> listingo@gmail.com
                            </p>
                        </div>

                    </div>

                </div>
                <div class="header__bottom  d-flex justify-content-between" id="navlist">
                    <a href="homelist" class="logo" style="margin: auto 0;  margin-left: 140px; color: #fff;">
                        <i class="fab fa-shopify">
                            <span>cellphone</span>
                            <span class="lastLetter">z</span> 
                        </i>
                    </a>
                    <div  id="SearchBoxContainer">
                        <form class="search_engine" action="search" method="GET" autocomplete="on" >
                            <input type="text" id="search-input" name="search" value="" autocomplete="off" onfocus="DisplaySearchResultBox();" placeholder="Bạn cần tìm gì?" style="color: #000;" />
                            <div class="search-results" id="searchResultDisplayDiv">
                                <ul class="suggested-results">
                                    <c:forEach items="${requestScope.searchList}" var="list" begin="0" end="4">
                                        <li class="">
                                            <a href="loadproductinfo?pro_id=${list.pro_id}">
                                                <div class="box-img">
                                                    <img src="${list.img_path}"/>
                                                </div>
                                                <div class="box-info">
                                                    <div class="box-name">
                                                        <p>${list.pro_name}</p>
                                                    </div>
                                                    <div class="box-price">
                                                        <p>${list.price} ₫</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="search_engine-icon">
                                <button type="submit" style="border: none; background-color: #fff; width: 100%; height: 100%;">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                    <nav class="navbar" style="margin: auto 0;">
                        <div class="container-fluid ">
                            <ul class="nav" style="line-height: 13px;">
                                <li class="nav-item d-flex">
                                    <div class="nav_item-pic">
                                        <i class="fas fa-phone-square-alt" style="font-size: 25px; margin-right: 5px;"></i>
                                    </div>
                                    <div class="nav_item-content">
                                        <a href="#" class="text-white">
                                            Gọi mua hàng<br> <span style="font-weight: bold;">099.999.999</span>
                                        </a>
                                    </div>
                                </li>
                                <li class="nav-item d-flex">
                                    <div class="nav_item-pic">
                                        <i class="fas fa-truck" style="font-size: 25px; margin-right: 5px;"></i>
                                    </div>
                                    <div class="nav_item-content">
                                        <a href="home.html" class="text-white">
                                            Tra cứu<br> đơn hàng
                                        </a>
                                    </div>
                                </li>
                                <li class="nav-item d-flex">
                                    <div class="nav_item-pic">
                                        <i class="fas fa-cart-arrow-down" style="font-size: 25px; margin-right: 5px;"></i>
                                    </div>
                                    <div class="nav_item-content">
                                        <a href="cart" class="text-white">
                                            Giỏ<br> hàng
                                        </a>
                                    </div>
                                </li>
                                <li class="nav-item d-flex">
                                    <div class="nav_item-pic">
                                        <i class="fas fa-user" style="font-size: 25px; margin-right: 5px;"></i>
                                    </div>
                                    <div class="nav_item-content nav_item-logout">
                                        <a href="#" class="text-white">
                                            Xin chào<br/> ${sessionScope.member.firstName} ${sessionScope.member.lastName}
                                        </a>
                                        <div class="log-out">
                                            <ul style="padding: 0;">
                                                <li>
                                                    <i class="fa-solid fa-address-book"></i>
                                                    <a href="logout?action=information">Thông tin cá nhân</a>
                                                </li>
                                                <li>
                                                    <i class="fa-solid fa-right-from-bracket"></i>
                                                    <a href="logout?action=logout">Log out</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="page-content">
                <div class="page-title">
                    <h3>Thông tin cá nhân</h3>
                </div>
                <div class="infor-container">
                    <form action="logout" method="POST">
                        <table>
                            <tbody>
                                <c:set value="${sessionScope.member}" var="mem"/>
                                <tr>
                                    <td><input type="hidden" name="id" value="${member.user_id}"/></td>
                                </tr>
                                <tr>
                                    <td>First Name:</td>
                                    <td><input type="text" name="firstname" value="${member.firstName}"/></td>
                                </tr>
                                <tr>
                                    <td>Last Name:</td>
                                    <td>
                                        <input type="text" name="lastname" value="${member.lastName}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td>
                                        <input type="text" name="username" value=" ${member.account.userName}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td>
                                        <input type="password" name="password" value=" ${member.account.password}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Phone number:</td>
                                    <td>
                                        <input type="text" name="phone" value=" ${member.phoneNumber}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Address:</td>
                                    <td>
                                        <input type="text" name="address" value="${member.address}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="submit" name="submit" value="SAVE"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            <div class="footer" style="position: absolute ;bottom: 0;">
                <div class="footer-content ">
                    <div class="footer-element footer-logo">
                        <a href="#" class="logo" style="margin: auto 0; color: black;">
                            <i class="fab fa-shopify">
                                <span>cellphone</span>
                                <span class="lastLetter">z</span>
                            </i>
                        </a>
                        <div class="footer-logo-content">
                            <p>This is PRJ301 project.</p>
                            <p>Design and code by Le Minh Dung HE160721</p>

                        </div>
                    </div>
                    <div class="footer-element footer-email">
                        <h4>To hear more information about new smartphones</h4>
                        <form>
                            <input type="email" name="email" placeholder="Enter your email:" />
                            <button type="submit" name="submit">Subcribe</button>
                        </form>
                    </div>
                    <div class="footer-element footer-social">
                        <strong>Follow us:</strong>
                        <div class="footer-icons">
                            <i class="fa-brands fa-instagram"></i>
                            <i class="fa-brands fa-facebook"></i>
                            <i class="fa-brands fa-twitter-square"></i>
                        </div>
                    </div>
                    <div class="footer-element footer-contact">
                        <strong>Call us:</strong>
                        <p>099.999.999</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        window.onscroll = function () {
            myFunction();
        };

        var navbar = document.getElementById("navlist");
        var sticky = navbar.offsetTop;
        function myFunction() {
            if (window.pageYOffset >= sticky) {
                navbar.classList.add("sticky");
            } else {
                navbar.classList.remove("sticky");
            }
        }

        var counter = 1;
        setInterval(function () {
            document.getElementById('radio' + counter).checked = true;
            counter++;
            if (counter > 4) {
                counter = 1;
            }
        }, 5000);

    </script>
</html>
