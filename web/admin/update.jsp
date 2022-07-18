<%-- 
    Document   : adminPage
    Created on : Feb 16, 2022, 4:03:14 PM
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
            .style-input{
                padding-top: 5px;
                padding-bottom: 5px;
                padding-right: 90px;
                padding-left: 5px;
                border-radius: 5px
            }
        </style>
    </head>

    <body>
        <div class="wrapper">
            <div class="vertical-menu">
                <div class="exit-btn">
                    <a href="">
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
                    <a href="check?action=addCharacteristics">Thêm sự kiện</a>
                    <a href="#">Kiếm tra hóa đơn</a>
                    <a href="#">Account</a>
                </div>
            </div>
            <div class="content">
                <div class="main-content">
                    <div class="content-header">
                        <h3>Product Management</h3>
                    </div>
                    <div class="hidden-add-form" id="adding-form">
                        <div class="content-table" style="margin-top: 10px;">
                            <form action="update" method="POST">
                                <label>Điền thông tin dưới để update thông tin sản phẩm!</label>
                                <c:set value="${requestScope.product}" var="pro"/>
                                <table class="styled-table" border="1" style="width: 100%">
                                    <tbody>
                                        <tr>
                                            <td><input name="id" value="${pro.pro_id}" type="hidden" class="style-input" placeholder="Nhập tên sản phẩm:..."/></td>
                                            <td><label>Nhập tên sản phẩm:</label></td>
                                            <td><input name="name" value="${pro.pro_name}" type="text" class="style-input" placeholder="Nhập tên sản phẩm:..."/></td>
                                            <td><label>Nhập phiên bản của điện thoại</label></td>
                                            <td><input name="edition" value="${pro.edition}" type="text" class="style-input" placeholder="Phiên bản của điện thoại..."/></td>
                                        </tr>
                                        <tr>
                                            <td><label>Nhập số lượng sản phẩm:</label></td>
                                            <td><input name="quantity" value="" type="number" class="style-input" placeholder="Nhập số lượng..."/></td>
                                            <td><label>Nhập giá của sản phẩm:</label></td>
                                            <td>
                                                <input type="number" value="${pro.price}" name="price" class="style-input"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label>Nhập khuyến mãi</label></td>
                                            <td><input name="discount" value="${pro.discount}" type="number" class="style-input" placeholder="Nhập discount..."/></td>
                                            <td><label>Kích thước màn hình</label></td>
                                            <td><input name="screen_size" value="${pro.screen_size}" type="text" class="style-input" placeholder="Kích thước màn hình..."/></td>
                                        </tr>
                                        <tr>
                                            <td><label>Công nghệ màn hình:</label></td>
                                            <td><input name="screen_tech" value="${pro.screen_tech}" type="text" class="style-input" placeholder="Công nghệ màn hình..."/></td>
                                            <td><label>Độ phân giải:</label></td>
                                            <td><input name="screen_resol" value="${pro.scr_resol}" type="text" class="style-input" placeholder="Độ phân giải màn hình..."/></td>
                                        </tr>
                                        <tr>
                                            <td><label>Camera sau:</label></td>
                                            <td><input name="back_camera" value="${pro.backCam}" type="text" class="style-input" placeholder="Camera sau..."/></td>
                                            <td><label>Camera trước:</label></td>
                                            <td><input name="front_camera" value="${pro.frontCam}" type="text" class="style-input" placeholder="Camera trước..."/></td>
                                        </tr>
                                        <tr>
                                            <td><label>Chip:</label></td>
                                            <td><input name="chip" value="${pro.chip}" type="text" class="style-input" placeholder="Chip..."/></td>
                                            <td><label>Ram:</label></td>
                                            <td><input name="ram" type="text" value="${pro.ram}" class="style-input" placeholder="Ram..."/></td>
                                        </tr>
                                        <tr>
                                            <td><label>Dung lượng bộ nhớ:</label></td>
                                            <td><input name="internal_mem" value="${pro.internal_mem}" type="text" class="style-input" placeholder="Dung lượng bộ nhớ..."/></td>
                                            <td><label>PIN:</label></td>
                                            <td><input name="pin" value="${pro.PIN}" type="text" class="style-input" placeholder="PIN..."/></td>
                                        </tr>
                                        <tr>
                                            <td><label>Thẻ sim:</label></td>
                                            <td><input name="sim" value="${pro.sim}" type="text" class="style-input" placeholder="Thẻ sim..."/></td>
                                            <td><label>Hệ điều hành:</label></td>
                                            <td><input name="OS" value="${pro.OS}" type="text" class="style-input" placeholder="Hệ điều hành..."/></td>
                                        </tr>
                                        <tr>
                                            <td><label>Kích thước(size):</label></td>
                                            <td><input name="size" type="text" value="${pro.size}" class="style-input" placeholder="Kích thước..."/></td>
                                            <td><label>Khối lượng:</label></td>
                                            <td><input name="weight" value="${pro.weight}" type="text" class="style-input" placeholder="Khối lượng..."/></td>
                                        </tr>
                                        <tr>
                                            <td><label>Thiết bị bluetooth:</label></td>
                                            <td><input name="bluetooth" value="${pro.bluetooth}" type="text" class="style-input" placeholder="Bluetooth..."/></td>
                                            <td><label>Nhập hãng sản xuất:</label></td>
                                            <td>
                                                <select name="cate_id">
                                                    <c:forEach items="${requestScope.listcate}" var="list">
                                                        <option  value="${list.cate_id}">${list.cate_name}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label>Sự kiện khuyến mãi:</label></td>
                                            <td>
                                                <select name="evList">
                                                    <c:forEach items="${requestScope.evList}" var="list">
                                                        <option value="${list.event_id}">${list.event_name}</option>
                                                    </c:forEach>

                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label>Chọn ảnh của sản phẩm:</label></td>
                                            <td>
                                                <div class="file-upload">
                                                    <input class="file-upload__input" name="inputfile" type="file" name="myFile[]" id="myFile" multiple/>
                                                    <button class="file-upload__button" type="button">Choose File(s)</button>
                                                    <span class="file-upload__label" >${pro.img_path}</span>
                                                </div>
                                            </td>
                                            <td><input type="submit" value="Submit"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
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
