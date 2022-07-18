<%-- 
    Document   : addCharacters
    Created on : Mar 12, 2022, 11:53:34 PM
    Author     : Windows 10 TIMT
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    </head>
    <body>
        <div class="wrapper">
            <div class="vertical-menu" style="height: 100vh;">
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
                    <a href="check?action=addCharacters">Thêm mô tả</a>
                    <a href="check?action=statistic">Thống kê</a>
                    <a href="#">Account</a>
                </div>
            </div>
            <div class="content">
                <div class="main-content">
                    <form action="addcharacters" method="POST">
                        <table>
                            <tr>
                                <td>Nhập id của sản phẩm muốn thêm:</td>
                                <td><input type="text" name="id" value="" placeholder="Nhập ở đây..."/></td>
                            </tr>
                            <tr>
                                <td>Mô tả</td>
                            </tr>
                            <c:forEach items="${requestScope.list}" var="char">
                                <tr>
                                    <td><input type="checkbox" name="character" value="${char.id}"/>${char.detail}</td>
                                </tr>
                            </c:forEach>
                                <tr>
                                    <td>
                                        <input type="submit" name="submit" value="SAVE"/>
                                    </td>
                                </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
