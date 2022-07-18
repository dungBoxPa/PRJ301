<%@page import="java.util.Random"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="static/css/productpage.css">
        <link rel="stylesheet" href="static/css/homeStyle.css">
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

            .active{
                content: "";
                width: 15px;
                height: 10px;
                border-radius: 0 0 0.5rem 0;
                background: #D70018;
                background-image: url(static/img/checkmark.svg);
                background-size: 50%;
                background-repeat: no-repeat;
                background-position: center;
                color: #ffffff;
                position: absolute;
                top: 0;
                left: 0;
            }
        </style>
    </head>

    <body>
        <c:set var="pro" value="${product}"/>
        <fmt:formatNumber var="price" value="${pro.price}" type="currency" pattern="###,###,###"/>
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
                                    <div class="nav_item-content nav_item-logout" style="z-index: 10;">
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

                <div class="breadcrumb-part">
                    <div class="address-container">
                        <ul class="delUL">
                            <li>
                                <a href="homelist">Trang chủ</a>
                                <i class="fa-solid fa-angle-right"></i>
                            </li>
                            <li>
                                <a href="searchlv2">Điện thoại</a>
                                <i class="fa-solid fa-angle-right"></i>
                            </li>
                            <li>
                                <p>${pro.edition}</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="product-name d-flex">
                    <h4>${pro.pro_name}</h4>
                    <div class="start-rating d-flex">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <p style="font-size: 12px;">3 lượt đánh giá</p>
                    </div>
                </div>
                <hr>

            </div>


            <div class="body-page">
                <div class="std">
                    <div class="product-intro">
                        <div class="title">
                            <p>Tính năng nổi bật</p>
                        </div>
                        <div class="img">
                            <img class="img-responsive" src="${pro.img_path}" alt="">
                        </div>
                        <div class="content">
                            <ul>
                                <c:forEach items="${requestScope.charList}" var="charList">
                                    <li>${charList.detail}</li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <div class="product-opts">
                        <div class="otps-content">
                            <div class="product-price d-flex">
                                <div class="new-price">
                                    <p style="color: red; font-size: 18px;"> ${price}&nbsp;₫</p>
                                </div>
                                <div class="old-price" style="padding-left: 10px;">
                                    <p style="font-size: 16px; color: rgb(139, 138, 138); font-weight: lighter;">37.990.000&nbsp;₫</p>
                                </div>
                            </div>
                            <div class="opts-select">
                                <c:forEach items="${requestScope.listPro}" var="products">
                                    <fmt:formatNumber var="priceSession" value="${products.price}" type="currency" pattern="###,###,###"/>
                                    <c:if test="${products.edition.equalsIgnoreCase(pro.edition)}">
                                        <a href="loadproductinfo?pro_id=${products.pro_id}&edition=${products.edition}" class="select-items">
                                            <strong>${products.internal_mem}</strong>
                                            <span>${priceSession}&nbsp;₫</span>
                                        </a>
                                    </c:if>
                                </c:forEach>

                            </div>

                            <div class="otps-event">
                                <div class="event-title d-flex">
                                    <p>
                                        <i class="fa-solid fa-gift"></i> Khuyến Mại
                                    </p>
                                </div>
                                <div class="event-content">
                                    <ul class="delUL">
                                        <li>
                                            <p>${pro.event.event_name}</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="otps-btn">
                                <a href="cart?pro_id=${pro.pro_id}" class="button-red action-btn">
                                    <strong>Mua ngay</strong>
                                    <span>(Giao hàng tận nơi - Giá tốt - An toàn)</span>
                                </a>
                                <div class="group-btn">
                                    <a href="#" class="aciton-btn button-blue">
                                        <Strong>TRẢ GÓP 0%</Strong>
                                        <span>(Xét duyệt qua điện thoại)</span>
                                    </a>
                                    <a href="#" class="aciton-btn button-blue">
                                        <Strong>TRẢ GÓP QUA THẺ</Strong>
                                        <span>(Visa, Master Card, JCB)</span>
                                    </a>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="product-information">
                        <div class="product-info-title">
                            <h3>Thông số kỹ thuật</h3>
                        </div>
                        <div class="product-info-content">
                            <table>
                                <tbody>
                                    <tr>
                                        <th>Kích thước màn hình</th>
                                        <td>${pro.screen_size} inches</td>
                                    </tr>
                                    <tr>
                                        <th>Công nghệ màn hình</th>
                                        <td>${pro.screen_tech}</td>
                                    </tr>
                                    <tr>
                                        <th>Camera sau</th>
                                        <td>
                                            ${pro.backCam}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Camera trước</th>
                                        <td>${pro.frontCam}</td>
                                    </tr>
                                    <tr>
                                        <th>Chipset</th>
                                        <td>${pro.chip}</td>
                                    </tr>
                                    <tr>
                                        <th>Dung lượng RAM</th>
                                        <td>${pro.ram}</td>
                                    </tr>
                                    <tr>
                                        <th>Bộ nhớ trong</th>
                                        <td>${pro.internal_mem}</td>
                                    </tr>
                                    <tr>
                                        <th>Pin</th>
                                        <td>${pro.PIN}</td>
                                    </tr>
                                    <tr>
                                        <th>Thẻ SIM</th>
                                        <td>${pro.sim}</td>
                                    </tr>
                                    <tr>
                                        <th>Hệ điều hành</th>
                                        <td>${pro.OS}</td>
                                    </tr>
                                    <tr>
                                        <th>Độ phân giải màn hình</th>
                                        <td>${pro.scr_resol}</td>
                                    </tr>
                                    <tr>
                                        <th>Kích thước</th>
                                        <td>${pro.size}</td>
                                    </tr>
                                    <tr>
                                        <th>Trọng lượng</th>
                                        <td>${pro.weight}g</td>
                                    </tr>
                                    <tr>
                                        <th>Bluetooth</th>
                                        <td>${pro.bluetooth}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="relevant-product">
                    <div class="product-info-title">
                        <p>Sản phẩm tương tự</p>
                    </div>
                    <div class="MVP">
                        <div class="phone">
                            <div class="product_carts">
                                <c:forEach items="${requestScope.similarProducts}" var="pro">
                                    <div class="product_cart">
                                        <a href="loadproductinfo?pro_id=${pro.pro_id}&edition=${pro.edition}" class="product-img-link">
                                            <img class="img-responsive" src="${pro.img_path}" alt="">
                                        </a>

                                        <div class="product-description">
                                            <p>${pro.pro_name}</p>
                                            <div class="product-price d-flex">
                                                <div class="new-price">
                                                    <p style="color: red;">${pro.price}&nbsp;₫</p>
                                                </div>
                                                <div class="old-price">
                                                    <p style="font-size: 11px;">37.990.000&nbsp;₫</p>
                                                </div>
                                            </div>
                                            <div class="product-note">
                                                <p>${pro.event.event_name}</p>
                                            </div>
                                            <div class="start-rating d-flex">
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
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

            <div class="footer">
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
        if(${requestScope.alert!=null}){
            alert("${requestScope.alert}");
        }
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