<%-- 
    Document   : EditAcc
    Created on : Mar 5, 2023, 12:30:31 PM
    Author     : ACER
--%>
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
                        <form action="managerA" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Account</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${detailA.id}" name="uid" type="text" class="form-control" readonly required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input value="${detailA.user}" name="user" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input value="${detailA.pass}" name="pass" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Seller</label>
                                <input value="${detailA.isSell}" name="sell" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Available</label>
                                <input value="${detailA.isAvailable}" name="avail" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="action" value="update">   
                            <input type="submit" class="btn btn-info" value="Save">
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
    </body>
</html>