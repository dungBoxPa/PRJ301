<%-- 
    Document   : Statistic
    Created on : Mar 12, 2022, 9:58:11 PM
    Author     : Windows 10 TIMT
--%>

<%@page import="java.util.Random"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page import="DAO.OrderDao"%>
<%@page import="DAO.CategoryDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="static/css/adminPage.css">
        <script src="https://kit.fontawesome.com/923f3593e0.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <style>
            .pagination a{
                padding: 4px 6px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);

            }

            .pagination .acitve{
                background-color: #f5c807a3;
                color: #fff;
            }

            .file-upload {
                display: inline-flex;
                align-items: center;
                font-size: 15px;
            }

            .hidden-add-form form .file-upload__input {
                display: none;
            }

            .file-upload__button {
                -webkit-appearance: none;
                background: #009879;
                border: 2px solid #00745d;
                border-radius: 4px;
                outline: none;
                padding: 0.5em 0.8em;
                margin-right: 15px;
                color: #ffffff;
                font-size: 1em;
                font-family: "Quicksand", sans-serif;
                font-weight: bold;
                cursor: pointer;
            }

            .file-upload__button:active {
                background: #00745d;
            }

            .file-upload__label {
                max-width: 250px;
                font-size: 0.95em;
                text-overflow: ellipsis;
                overflow: hidden;
                white-space: nowrap;
                font-family: "Quicksand", sans-serif;
            }

        </style>

        <script type="text/javascript">
// Load google charts
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            <%
                CategoryDao dao = new CategoryDao();
            %>
// Draw the chart and set the chart values
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Task', 'Phone distribution'],
                    ['iPhone', <%=dao.countProductByCateId(1)%>],
                    ['Samsung', <%=dao.countProductByCateId(2)%>],
                    ['Oppo', <%=dao.countProductByCateId(3)%>],
                    ['Vivo', <%=dao.countProductByCateId(4)%>],
                    ['Huawei', <%=dao.countProductByCateId(5)%>],
                    ['Xiaomi', <%=dao.countProductByCateId(6)%>]
                ]);

                // Optional; add a title and set the width and height of the chart
                var options = {'title': 'Số lượng sản phẩm của từng hãng', 'width': 450, 'height': 300};

                // Display the chart inside the <div> element with id="piechart"
                var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                chart.draw(data, options);
            }
            <%
                OrderDao dao1 = new OrderDao();
                List<Order> list = dao1.getAll();
                Random rd = new Random();
                int sumOf1900 = 0;
                int sumOf2022 = 0;
                for (Order order : list) {
                    if(order.getDate().contains("1900")){
                        sumOf1900+=order.getOrderDetail().getTotalPricePerProduct();
                    }else if(order.getDate().contains("2022")){
                        sumOf2022+=order.getOrderDetail().getTotalPricePerProduct();
                    }
                }
                int expenses = rd.nextInt(2147483647);
            %>
            google.charts.load('current', {'packages': ['bar']});
            google.charts.setOnLoadCallback(drawChart1);
            function drawChart1() {
                var data = google.visualization.arrayToDataTable([
                    ['Year', 'Sales', 'Expenses', 'Profit'],
                    ['1900', <%=sumOf1900%>, 100000000, 121000000],
                    ['2022', <%=sumOf2022%>, 1500000000, 650000000]
                ]);

                var options = {
                    chart: {
                        title: 'Company Performance',
                        subtitle: 'Sales, Expenses, and Profit: 1900 and 2022',
                    }
                };

                var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

                chart.draw(data, google.charts.Bar.convertOptions(options));
            }
        </script>
    </head>
    <body>
        <div class="wrapper">
            <div class="vertical-menu" style="height: 750px;">
                <div class="exit-btn">
                    <a href="logout?action=logout">
                        <i class="fa-solid fa-xmark"></i>
                    </a>
                </div>
                <div class="logo-header">
                    <a href="#" class="logo" style="margin: auto 0; color: #fff;">
                        <i class="fab fa-shopify">
                            <span>cellphone</span>
                            <span class="lastLetter">z</span>
                        </i>
                    </a>
                </div>
                <div class="user-token">
                    <i class="fa-solid fa-user"></i>
                    <span><br/> ${sessionScope.member.firstName} ${sessionScope.member.lastName}</span>
                </div>
                <div class="menu-links" style="margin-top: 50px;">
                    <a href="prolist" class="active">Home</a>
                    <a href="check?action=add">Thêm sản phẩm mới</a>
                    <a href="check?action=statistic">Thống kê</a>
                    <a href="#">Kiếm tra hóa đơn</a>
                    <a href="#">Account</a>
                </div>
            </div>
            <div class="statistic-container" style="width: 79%; height: 650px;">
                <div class="content">
                    <div class="page-title">
                        <h3>Thông kê sản phẩm</h3>
                    </div>
                    <div class="part1" style="display: flex;">
                        <div id="piechart"></div>
                        <div class="pie-content">
                            <p>- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec aliquet orci, feugiat auctor orci. Quisque tempor eros ut lectus aliquam, non ultrices erat vestibulum. Proin non ante ut velit pellentesque feugiat. Duis consectetur mi ac efficitur scelerisque. In dignissim gravida enim, malesuada pretium nunc. Etiam tincidunt volutpat tellus. Vivamus in consequat purus. Nulla vitae leo nec dolor accumsan cursus a ac lacus. Donec quis dapibus arcu. Duis fermentum suscipit lectus ac consectetur. Aenean urna ipsum, maximus ut aliquet ut, cursus sit amet nibh. Nulla facilisi. Fusce sodales malesuada ex, sagittis porta tortor tristique aliquet. Praesent pellentesque fringilla nisi.</p>
                        </div>
                    </div>
                    <div class="page-title">
                        <h3>Thông kê doanh thu</h3>
                    </div>
                    <div class="part2" style="display: flex;">
                        <div class="pie-content" style="width: 50%;">
                            <p>- Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec aliquet orci, feugiat auctor orci. Quisque tempor eros ut lectus aliquam, non ultrices erat vestibulum. Proin non ante ut velit pellentesque feugiat. Duis consectetur mi ac efficitur scelerisque. In dignissim gravida enim, malesuada pretium nunc. Etiam tincidunt volutpat tellus. Vivamus in consequat purus. Nulla vitae leo nec dolor accumsan cursus a ac lacus. Donec quis dapibus arcu. Duis fermentum suscipit lectus ac consectetur. Aenean urna ipsum, maximus ut aliquet ut, cursus sit amet nibh. Nulla facilisi. Fusce sodales malesuada ex, sagittis porta tortor tristique aliquet. Praesent pellentesque fringilla nisi.</p>
                        </div>
                        <div id="columnchart_material" style="width: 500px; height: 300px; margin-left: 90px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
