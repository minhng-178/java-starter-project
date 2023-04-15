<%-- 
    Document   : Detail
    Created on : Feb 22, 2023, 7:16:30 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>MKT Shoe Stores</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />
        <!-- Custom styles -->
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
                margin-top: 10px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }	
            .modal form label {
                font-weight: normal;
            }	
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }
            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
            .detail {
                margin: 20px 0;
            }
            .size-body {
                display: block;
                flex-wrap: wrap;
                justify-content: space-between;
            }
            .text-size {
                margin-bottom: 10px;
                font-size: 20px;
                color: graytext;    
            }
            .text-size a {
                color: graytext;
                font-size: 12px;
            }
            .text-size a:hover {
                color: black
            }
            .size {
                width: auto;
                height: 35px;
                margin-right: 10px;
                margin-bottom: 10px;
            }
            .size:hover {
                background-color: skyblue;
                color: white
            }

            .error-message {
                color: #dc3545;
            }
        </style>
    </head>
    <body>
        <jsp:include page="./include/Menu.jsp"></jsp:include>
            <main>
                <div class="container">
                    <!-- Navbar -->
                    <nav class="navbar navbar-expand-lg navbar-dark mt-3 mb-5 shadow p-2" style="background-color: #607D8B">
                        <!-- Container wrapper -->
                        <div class="container-fluid">

                            <!-- Navbar brand -->
                            <a class="navbar-brand" href="#">Categories:</a>

                            <!-- Toggle button -->
                            <button 
                                class="navbar-toggler" 
                                type="button" 
                                data-mdb-toggle="collapse" 
                                data-mdb-target="#navbarSupportedContent2" 
                                aria-controls="navbarSupportedContent2" 
                                aria-expanded="false" 
                                aria-label="Toggle navigation">
                                <i class="fas fa-bars"></i>
                            </button>

                            <!-- Collapsible wrapper -->
                            <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                    <!-- Link -->
                                <c:forEach items="${listCC}" var="o">
                                    <li class="nav-item active hover-overlay"><a class="nav-link text-white" href="category?cid=${o.id}">${o.name}</a></li>    
                                    </c:forEach>
                            </ul>

                            <!-- Search -->
                            <form action="search" method="POST" class="w-auto py-1" style="max-width: 12rem">
                                <input value="${txtS}" name="txt" type="search" class="form-control rounded-0" placeholder="Search" aria-label="Search">
                            </form>

                        </div>
                    </div>
                    <!-- Container wrapper -->
                </nav>
                <!-- Navbar -->
                <section>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="container">
                                <div class="card">
                                    <div class="row detail">
                                        <aside class="col-sm-5 border-right">
                                            <article class="gallery-wrap"> 
                                                <div class="img-big-wrap">
                                                    <div> <a href="" data-product-id="${detail.id}"><img src="${detail.image}"></a></div>
                                                </div> <!-- slider-product.// -->
                                                <div class="img-small-wrap">
                                                </div> <!-- slider-nav.// -->
                                            </article> <!-- gallery-wrap .end// -->
                                        </aside>
                                        <aside class="col-sm-7">
                                            <article class="card-body p-5">
                                                <h3 class="title mb-3">${detail.name}</h3>
                                                <p class="title">${detail.title}</p>

                                                <p class="price-detail-wrap"> 
                                                    <span class="price h3 text-warning"> 
                                                        <span class="currency">$</span>
                                                        <span class="num"> ${detail.price} </span>
                                                    </span> 
                                                </p> <!-- price-detail-wrap .// -->
                                                <dl class="item-property">
                                                    <dd><p>
                                                            ${detail.description}
                                                        </p></dd>
                                                </dl>
                                                <br>
                                                <div class="row">
                                                    <div class="col-md-12 table-size">
                                                        <div class="d-flex justify-content-between align-items-end text-size">
                                                            <span>Select size</span>
                                                            <a href="SizeGuide.jsp">Size guide</a>
                                                        </div>
                                                        <div class="btn-group shadow-0 size-body" role="group" aria-label="Basic example">
                                                            <c:forEach items="${size}" var="o">
                                                                <a class="btn btn-outline-info size" data-size-id="${o.id}">${o.size}</a>
                                                            </c:forEach>
                                                        </div>

                                                        <div>
                                                            <h4 class="error-message">${mess}</h4>
                                                            <h4 class="error-message">${mess2}</h4>
                                                            <h4 class="error-message">${error}</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:choose>
                                                    <c:when test="${sessionScope.acc.isSell == 0}">
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-sm-5">
                                                                <dl class="param param-inline">
                                                                    <dt>Quantity: </dt>
                                                                    <dd>
                                                                        <input class="form-control form-control-sm" style="width:85px;" name="quantity" id="quantity" onkeyup="checkInput(this)" placeholder="Input here" required>
                                                                    </dd>
                                                                </dl>  <!-- item-property .// -->
                                                            </div> <!-- col.// -->

                                                        </div> <!-- row.// -->
                                                        <hr>
                                                        <a href="#" class="btn btn-lg btn-outline-primary text-uppercase" onclick="addToCart()"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                                                    </c:when>
                                                    <c:when test="${sessionScope.acc.isSell == 1}">
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-sm-5">
                                                                <dl class="param param-inline">
                                                                    <dt>Quantity: </dt>
                                                                    <dd>
                                                                        <select class="form-control form-control-sm" style="width:70px;" name="quantity" id="quantity" disabled>
                                                                            <option> ${totalByPid} </option>
                                                                        </select>
                                                                    </dd>
                                                                </dl>  <!-- item-property .// -->
                                                            </div> <!-- col.// -->

                                                        </div> <!-- row.// -->
                                                        <hr>
                                                        <a href="#editSizeModal" class="btn btn-outline-primary" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Edit Size</span></a>
                                                        <a href="#addSizeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Size</span></a>
                                                        <a href="#deleteSizeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete Size</span></a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <hr>
                                                        <div class="row">
                                                            <div class="col-sm-5">
                                                                <dl class="param param-inline">
                                                                    <dt>Quantity: </dt>
                                                                    <dd>
                                                                        <input class="form-control form-control-sm" style="width:85px;" name="quantity" id="quantity" onkeyup="checkInput(this)" placeholder="Input here" required> 
                                                                    </dd>
                                                                </dl>  <!-- item-property .// -->
                                                            </div> <!-- col.// -->
                                                        </div> <!-- row.// -->
                                                        <hr>
                                                        <a href="login" class="btn btn-lg btn-outline-primary text-uppercase" onclick="addToCart()"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </article> <!-- card-body.// -->
                                        </aside> <!-- col.// -->
                                    </div> <!-- row.// -->          
                                </div> <!-- card.// --> 
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main>
        <jsp:include page="./include/Footer.jsp"></jsp:include>
            <!-- Add Modal HTML -->
            <div id="addSizeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="detail" method="POST">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Size</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Size</label>
                                    <input name="size" type="text" class="form-control" required>
                                </div>
                                <input name="pid" value="${detail.id}" type="hidden">
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="text" class="form-control" required>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="action" value="add">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Add">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editSizeModal" class="modal fade">
            <div class="modal-dialog">
                <form action="detail" method="POST">
                    <div class="modal-content">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Size</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <input name="sid" id="sizeIdInput" type="hidden" class="form-control" required>
                            <div class="form-group">
                                <label>Size</label>
                                <input name="size" type="text" class="form-control" required>
                            </div>
                            <input name="pid" value="${detail.id}" type="hidden">
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="text" class="form-control" required>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="action" value="update">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteSizeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Size</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <input id="pidInput" name="pid" type="hidden" value="${detail.id}">
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" id="deleteBtn" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript" src="js/script.js"></script>
        <script>

                                                            const buttons = document.querySelectorAll('.btn-outline-info');
                                                            buttons.forEach(button => {
                                                                button.addEventListener('click', function () {
                                                                    this.classList.toggle('selected');
                                                                    if (this.classList.contains('selected')) {
                                                                        this.style.backgroundColor = 'skyblue';
                                                                        this.style.color = 'white';
                                                                    } else {
                                                                        this.style.backgroundColor = '';
                                                                        this.style.color = '';
                                                                    }
                                                                });
                                                            });

                                                            $('.size').click(function () {
                                                                $('.size.active').removeClass('active');
                                                                $(this).addClass('active');
                                                            });
                                                            $(document).ready(function () {
                                                                $(".size").click(function () {
                                                                    var sizeId = $(this).data('size-id');
                                                                    $("#sizeIdInput").val(sizeId);
                                                                });
                                                            });

                                                            $(document).ready(function () {
                                                                $('#deleteBtn').click(function () {
                                                                    var sizeId = $('.size.active').data('size-id');
                                                                    var productId = $('.product-info').data('product-id');
                                                                    $.ajax({
                                                                        type: 'POST',
                                                                        url: 'deleteS',
                                                                        data: {sid: sizeId},
                                                                        success: function (response) {
                                                                            window.location.href = 'home';
                                                                            $('#deleteEmployeeModal').modal('hide');
                                                                        },
                                                                        error: function (xhr) {
                                                                            alert('Error: ' + xhr.responseText);
                                                                        }
                                                                    });
                                                                });
                                                            });
                                                            function checkInput(inputField) {
                                                                if (inputField.value === "" || inputField.value === "0") {
                                                                    inputField.value = "";
                                                                }
                                                            }
                                                            function addToCart() {
                                                                const quantity = document.getElementById("quantity").value;
                                                                const productId = "${detail.id}";
                                                                const sizeId = document.querySelector(".btn-group .active").dataset.sizeId;
                                                                const form = document.createElement("form");
                                                                form.method = "POST";
                                                                form.action = "addCart";
                                                                const inputProductId = document.createElement("input");
                                                                inputProductId.type = "hidden";
                                                                inputProductId.name = "productId";
                                                                inputProductId.value = productId;
                                                                const inputQuantity = document.createElement("input");
                                                                inputQuantity.type = "hidden";
                                                                inputQuantity.name = "quantity";
                                                                inputQuantity.value = quantity;
                                                                const inputSizeId = document.createElement("input");
                                                                inputSizeId.type = "hidden";
                                                                inputSizeId.name = "sizeId";
                                                                inputSizeId.value = sizeId;
                                                                form.appendChild(inputProductId);
                                                                form.appendChild(inputQuantity);
                                                                form.appendChild(inputSizeId);
                                                                document.body.appendChild(form);
                                                                form.submit();
                                                            }
        </script>
    </body>
</html>
