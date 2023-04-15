<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Roboto', sans-serif;
            }
            .edit {
                margin: 20px 0;
                padding: 20p;
            }
            /* Modal styles */
            .edit .modal-dialog {
                background-color: white;
                max-width: 500px;
            }
            .edit .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .edit .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .edit .modal-footer {
                background: white;
                border-radius: 0 0 3px 3px;
                padding-right: 20px;
            }
            .edit .modal-title {
                display: inline-block;
            }
            .edit .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .edit .form-group {
                padding: 0 20px;
            }
            .edit textarea.form-control {
                resize: vertical;
            }
            .edit .btn {
                border-radius: 2px;
                min-width: 100px;
            }	
            .edit form label {
                font-weight: normal;
            }	

            .headform {
                background-color: #2bb6e8;
                color: white;  
            }           
        </style>
    </head>
    <body>
        <jsp:include page="./include/Menu.jsp"></jsp:include>
            <div id="" class="col-md-12 edit">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="managerP" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product </h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${detail.id}" name="id" type="text" class="form-control" readonly required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input value="${detail.name}" name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input value="${detail.image}" name="image" id="image-input" type="text" class="form-control" required>
                                <img id="image-preview" src="${detail.image}" alt="Preview Image" style="max-width: 100%; max-height: 200px;">
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input value="${detail.price}" name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <input value="${detail.title}" name="title" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required>${detail.description}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select class="combobox" name="category">
                                    <c:forEach items="${listCC}" var="o">
                                        <option value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="action" value="update">                                   
                            <input type="submit" class="btn btn-info" value="Update">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="./include/Footer.jsp"></jsp:include>
        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript" src="js/script.js"></script>
        <script>
            // Lấy input và img element trong DOM
            const imageInput = document.querySelector('#image-input');
            const imagePreview = document.querySelector('#image-preview');

            // Thêm event listener cho input element
            imageInput.addEventListener('input', () => {
                // Lấy giá trị của input
                const imageUrl = imageInput.value;

                // Cập nhật src attribute của img element để hiển thị ảnh mới
                imagePreview.src = imageUrl;
            });
        </script>
    </body>
</html>