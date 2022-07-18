<%@page import="java.util.Random"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="static/css/productpage.css">
        <link rel="stylesheet" href="static/css/homeStyle.css">
        <link rel="stylesheet" href="static/css/productCart.css">
        <script src="https://kit.fontawesome.com/923f3593e0.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
                <div class="header__bottom  d-flex justify-content-around" id="navlist">
                    <a href="#" class="logo" style="margin: auto 0;  margin-left: 70px; color: #fff;">
                        <i class="fab fa-shopify">
                            <span>cellphone</span>
                            <span class="lastLetter">z</span>
                        </i>
                    </a>
                    <div class="search_engine">
                        <div class="search_engine-icon">
                            <i class="fas fa-search"></i>
                        </div>
                        <input type="text" name="" value="" placeholder="Bạn cần tìm gì?" style="color: #000;" />
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
                                        <a href="#" class="text-white">
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
                                    <div class="nav_item-content">
                                        <a href="#" class="text-white">
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
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>

                <div class="breadcrumb-part">
                    <div class="address-container">
                        <ul class="delUL">
                            <li>
                                <a href="homelist">Trang chủ</a>
                                <i class="fa-solid fa-angle-right"></i>
                            </li>
                            <li>
                                <p>Giỏ hàng</p>
                            </li>
                        </ul>
                    </div>
                </div>


            </div>

            <div class="body-page">
                <div class="std1">
                    <form action="buy" method="POST">
                        <div class="product-cart">
                            <div class="cart-header mt-3 mb-3">
                                <p class="cart-title">Giỏ hàng</p>
                            </div>
                            <c:forEach items="${sessionScope.cart}" var="pro">
                                <c:set var="totalPrice" value="${totalPrice + pro.price-pro.discount*pro.price/100}"/>
                                <fmt:formatNumber var="priceSession" value="${pro.price}" type="currency" pattern="###,###,###"/>
                                <fmt:formatNumber var="priceDiscount" value="${pro.price-pro.discount*pro.price/100}" type="currency" pattern="###,###,###"/>
                                <div class="cart-container">
                                    <div class="data-container">
                                        <div class="data-img">
                                            <img class="img-responsive" src="${pro.img_path}" alt="">
                                        </div>
                                        <div class="product-info">
                                            <p class="product-name mt-2">${pro.pro_name}</p>
                                            <div class="product-info_price d-flex align-items-end mt-2">
                                                <p class="new-price">${priceDiscount}&nbsp;₫</p>
                                                <input type="hidden" name="priceAfterDiscount" value="${pro.price-pro.discount*pro.price/100}"/>
                                                <div class="old-price">
                                                    <p class="">${priceSession}&nbsp;₫</p>
                                                </div>
                                                <span class="discount">Giảm ${pro.discount}%</span>
                                            </div>
                                            <div class="product-info_action d-flex align-items-end mt-2">
                                                <div class="change-quantity ">
                                                    <p style="font-size: 16px;">Chọn số lượng:</p>
                                                    <div class="number d-flex" style="margin-left: 5px;">
                                                        <input type="number" name="number" min="1" max="${pro.quantity}"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="promotion-pack">
                                                <div class="promotion-pack_detail">
                                                    <div class="pack-detail">
                                                        <p>- Chương trình khuyến mại:</p>
                                                        <ul class="promotion-lists">
                                                            <li class="promotion-item">${pro.event.event_name}</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="delete-item">
                                            <a href="buy?pro_id=${pro.pro_id}">
                                                <i class="fa-solid fa-xmark"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>

                            <div class="cart-btn">
                                <div class="total-price d-flex justify-content-between align-items-start">
                                    <p style="font-weight: 600;">Tổng tiền tạm tính:</p>
                                    <div class="price d-flex flex-column align-items-end">
                                        <span style="font-weight: 700;
                                              <fmt:formatNumber var="totalPriceFMT" value="${totalPrice}" type="currency" pattern="###,###,###"/>
                                              color: #d70018;">${totalPriceFMT}&nbsp;₫
                                        </span>
                                        <input type="hidden" name="totalPrice" value="${totalPrice}"/>
                                    </div>
                                </div>
                                <div class="submit-btn">
                                    <button type="submit" class="d-flex flex-column justify-content-center align-items-center w-100 mb-2">Tiến hành đặt hàng</button>
                                    <a class="d-flex flex-column justify-content-center align-items-center w-100" href="homelist">Chọn thêm sản phẩm khác</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="footer" style="margin-top: 195px;">
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
//        alert("${requestScope.announcement}")

        window.onscroll = function () {
            myFunction()
        };

        var navbar = document.getElementById("navlist");
        var sticky = navbar.offsetTop;

        function myFunction() {
            if (window.pageYOffset >= sticky) {
                navbar.classList.add("sticky")
            } else {
                navbar.classList.remove("sticky");
            }
        }
    </script>

</html>