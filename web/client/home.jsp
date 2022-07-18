<%-- 
    Document   : home
    Created on : Jan 18, 2022, 4:00:49 PM
    Author     : Windows 10 TIMT
--%>

<%@page import="java.util.Random"%>
<%@page import="model.Product"%>
<%@page import="DAO.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DAO.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

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

            .brand-item{
                height: 34px;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                justify-content: center;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                float: left;
                margin: 0 1rem 0 0;
                padding: 0.5rem 1rem;
                border: 1px solid #E5E7EB;
                border-radius: 1rem;
                background: #F3F4F6;
                color: #444444;
                text-decoration: none;
                overflow: hidden;
                position: relative;
                cursor: pointer;
            }

            .brand-catergory{
                height: 100%;
                display: flex;
                align-items: center;
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
            <div class="home-body">
                <div class="sticky-sidebar">
                    <a href="" class="left-sidebar">
                        <img src="static/img/usedImg/Trai-79x271-11.jpg" alt="">
                    </a>

                    <a href="" class="right-sidebar">
                        <img src="static/img/usedImg/Trai-79x271-11.jpg" alt="">
                    </a>
                </div>
                <div class="std">
                    <div class="intro">
                        <div class="list-menu" style="width: 20%;">
                            <div class="category-items">
                                <ul>
                                    <c:forEach items="${listCat}" var="cate">
                                        <li class="category-item">
                                            <a class="category-main" href="homelist?cate_id=${cate.cate_id}">
                                                <embed src="${cate.icon_path}" style="width: 25px; height: 25px;" alt="">
                                                <span>${cate.cate_name}</span>
                                                <i class="fas fa-chevron-right"></i>
                                            </a>
                                        </li>
                                    </c:forEach>
                                    <li class="category-item">
                                        <a class="category-main" href="homelist?cate_id=0">
                                            <i class="fa-solid fa-equals" style="width: 25px; height: 25px;"></i>
                                            <span>Xem tất cả</span>
                                            <i class="fas fa-chevron-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="slider" style="width: 58%;">
                            <div class="slides">
                                <!--radio buttons start-->
                                <input type="radio" name="radio-btn" id="radio1">
                                <input type="radio" name="radio-btn" id="radio2">
                                <input type="radio" name="radio-btn" id="radio3">
                                <input type="radio" name="radio-btn" id="radio4">
                                <!--radio buttons end-->
                                <!--slide images start-->
                                <div class="slide first">
                                    <img class="img-responsive" src="static/img/usedImg/690x300_OnePlus-8T-5G.jpg" alt="">
                                </div>
                                <div class="slide">
                                    <img class="img-responsive" src="static/img/usedImg/690x300_OnePlus-8T-5G.jpg" alt="">
                                </div>
                                <div class="slide">
                                    <img class="img-responsive" src="static/img/usedImg/690x300_OnePlus-8T-5G.jpg" alt="">
                                </div>
                                <div class="slide">
                                    <img class="img-responsive" src="static/img/usedImg/690x300_OnePlus-8T-5G.jpg" alt="">
                                </div>
                                <!--slide images end-->
                                <!--automatic navigation start-->
                                <div class="navigation-auto">
                                    <div class="auto-btn1"></div>
                                    <div class="auto-btn2"></div>
                                    <div class="auto-btn3"></div>
                                    <div class="auto-btn4"></div>
                                </div>
                                <!--automatic navigation end-->
                            </div>
                            <!--manual navigation start-->
                            <div class="navigation-manual">
                                <label for="radio1" class="manual-btn"></label>
                                <label for="radio2" class="manual-btn"></label>
                                <label for="radio3" class="manual-btn"></label>
                                <label for="radio4" class="manual-btn"></label>
                            </div>
                            <!--manual navigation end-->
                            <!--image slider end-->
                        </div>
                        <div class="advertisement" style="width: 18%;">
                            <div class="adver1">
                                <a href="home.html">
                                    <img src="static/img/usedImg/desk_690x300_right-banner_DienThoai.jpg" alt="">
                                </a>
                            </div>
                            <div class="adver2">
                                <a href="">
                                    <img src="static/img/usedImg/desk_690x300_right-banner_DienThoai.jpg" alt="">
                                </a>
                            </div>
                            <div class="adver3">
                                <a href="">
                                    <img src="static/img/usedImg/desk_690x300_right-banner_DienThoai.jpg" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="banner">
                        <a href="">
                            <img src="static/img/usedImg/tet-special-banner_1200x75.gif" alt="">
                        </a>
                    </div>

                    <div class="MVP">
                        <div class="phone">
                            <div class="list d-flex justify-content-between" style="width: 100%; position: relative;">
                                <h3 style="text-transform: uppercase; font-weight: bold; margin-left: 10px;">Điện thoại nổi bật nhất</h3>
                                <div class="brand-catergory" style="position: absolute; right: 0; padding-right: 10px;">
                                    <c:forEach items="${requestScope.listCat}" var="list">
                                        <a href="searchlv2?pro_id=${list.cate_id}" class="brand-item">
                                            ${list.cate_name}
                                        </a>
                                    </c:forEach>
                                    <a href="searchlv2" class="brand-item">
                                        Xem tất cả
                                    </a>
                                </div>
                            </div>
                            <c:set var="page" value="${requestScope.page}"/>         
                            <c:if test="${requestScope.cate_id!=null}">
                                <div class="pagination" style="margin-left: 15px;">
                                    <c:forEach begin="${1}" end="${requestScope.pagenumber}" var="i">
                                        <a class="${i==page?"active":""}" href="homelist?page=${i}&cate_id=${requestScope.cate_id}">${i}</a> 
                                    </c:forEach>
                                </div> 
                            </c:if>
                            <c:if test="${requestScope.cate_id==null}">
                                <div class="pagination" style="margin-left: 15px;">
                                    <c:forEach begin="${1}" end="${requestScope.pagenumber}" var="i">
                                        <a class="${i==page?"active":""}" href="homelist?page=${i}">${i}</a> 
                                    </c:forEach>
                                </div> 
                            </c:if>
                            <!--<h1>${requestScope.announce}</h1>-->
                            <div class="product_carts">
                                <div class="product_carts-container">
                                    <c:forEach items="${requestScope.list_data}" var="list">
                                        <div class="product_cart">
                                            <a href="loadproductinfo?pro_id=${list.pro_id}&edition=${list.edition}" class="product-img-link">
                                                <img class="img-responsive" src="${list.img_path}" alt="">
                                            </a>
                                            <div class="product-discount">
                                                <p>Giảm ${list.discount}%</p>
                                            </div>
                                            <div class="product-description">
                                                <p>${list.pro_name}</p>
                                                <div class="product-desciption-tect">
                                                    <p>${list.screen_size} inches</p>
                                                    <p>${list.ram} GB</p>
                                                    <p>${list.internal_mem} GB</p>
                                                </div>
                                                <div class="product-price d-flex">
                                                    <div class="new-price">
                                                        <fmt:formatNumber var="price" value="${list.price}" type="currency" pattern="###,###,###"/>
                                                        <p style="color: red;">${price} ₫</p>
                                                    </div>
                                                    <div class="old-price">
                                                        <p style="font-size: 11px;">37,990,000 ₫</p>
                                                    </div>
                                                </div>
                                                <div class="product-note">
                                                    <p>${list.event.event_name}</p>
                                                </div>
                                                <div class="start-rating d-flex">
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <span class="fa fa-star checked"></span>
                                                    <%
                                                        Random rand = new Random();
                                                        int n = rand.nextInt(100);
                                                    %>
                                                    <p style="font-size: 12px;"><%=n%> lượt đánh giá</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>


                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="footer ">
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
        if (${requestScope.announcement!=null}) {
            alert("${requestScope.announcement}");
        }

        if (${requestScope.alert!=null}) {
            alert("${alert}");
        }
        function submitData() {
            document.filters.price.value.submit();
        }

        document.addEventListener('DOMContentLoaded', function () {
            var input = document.getElementById('job');
            if (localStorage['job']) { // if job is set
                input.value = localStorage['job']; // set the value
            }
            input.onchange = function () {
                localStorage['job'] = this.value; // change localStorage on change
            }
        });


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

        $(document).on("click touchstart", function (e) {
            var t = $(e.target).closest('#SearchBoxContainer');
            var exceptDiv = $('#SearchBoxContainer');
            if (exceptDiv.is(t) == false) {
                //clicked oustide of div
                document.getElementById('search-input').style.borderRadius = "1rem";

                $('#searchResultDisplayDiv').hide();
            }
        });

        function DisplaySearchResultBox() {
            $('#searchResultDisplayDiv').show();
            document.getElementById('search-input').style.borderRadius = "1rem 1rem 0 0";
        }


        function getInputValue() {
            document.getElementById("search-input").value.submit();
        }
    </script>

</html>