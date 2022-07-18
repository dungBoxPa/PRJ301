<%-- 
    Document   : adminPage
    Created on : Feb 16, 2022, 4:03:14 PM
    Author     : Windows 10 TIMT
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
            <div class="vertical-menu" style="height: 1006px;">
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
                    <div>
                        <h3 style="color: red;">${requestScope.error}</h3>
                    </div>
                    <div class="content-header">
                        <h3>Product Management</h3>
                    </div>
                    <div class="add-search">
                        <div class="add">
                            <a href="check?action=add" style="color: #fff;  display: flex; justify-content: center; align-items: center; line-height: 40px;">
                                <i class="fa-solid fa-plus" style="font-weight: bold; padding-right: 5px;"></i>
                                <span>ADD</span>
                            </a>
                        </div>
                        <div class="search">
                            <input type="text" name="searchbar" value="" placeholder="Enter here to search..." />
                        </div>
                    </div>

                    <c:set value="${requestScope.page}" var="page"/>
                    <div class="pagination">
                        <c:forEach begin="${1}" end="${requestScope.pagenum}" var="i">
                            <a class="${i==page?"active":""}" href="prolist?page=${i}">${i}</a> 
                        </c:forEach>
                    </div>

                    <div class="content-table" style="margin-top: 10px;">
                        <table class="styled-table" border="1" style="width: 100%">
                            <thead>
                                <tr style="text-align: center;">
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Discount</th>
                                    <th>Image</th>
                                    <th>Category</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.listProperPage}" var="list">
                                    <tr class="active-row">
                                        <td>${list.pro_id}</td>
                                        <td>${list.pro_name}</td>
                                        <td>${list.quantity}</td>
                                        <td>
                                            <fmt:formatNumber var="price" value="${list.price}" type="currency" pattern="###,###,###"/>
                                            ${price}
                                        </td>
                                        <td>${list.discount}</td>
                                        <td>
                                            <img src="${list.img_path}" style="width: 100px; height: auto"/>
                                        </td>
                                        <td>${list.category.cate_name}</td>
                                        <td>
                                            <a href="check?action=update&pro_id=${list.pro_id}">Update</a>
                                            <a href="#" onclick="doDelete(${list.pro_id})">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        function doDelete(id) {
            if (confirm("are you sure to delete category with id ='" + id + "'?")) {
                window.location = "check?action=delete&id=" + id;
            }
        }
        Array.prototype.forEach.call(
                document.querySelectorAll(".file-upload__button"),
                function (button) {
                    const hiddenInput = button.parentElement.querySelector(
                            ".file-upload__input"
                            );
                    const label = button.parentElement.querySelector(".file-upload__label");
                    const defaultLabelText = "No file(s) selected";
                    // Set default text for label
                    label.textContent = defaultLabelText;
                    label.title = defaultLabelText;
                    button.addEventListener("click", function () {
                        hiddenInput.click();
                    });
                    hiddenInput.addEventListener("change", function () {
                        const filenameList = Array.prototype.map.call(hiddenInput.files, function (
                                file
                                ) {
                            return file.name;
                        });
                        label.textContent = filenameList.join(", ") || defaultLabelText;
                        label.title = label.textContent;
                    });
                }
        );
    </script>
</html>
