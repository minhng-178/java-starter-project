<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
        <link rel="stylesheet" href="./css/mdb.min.css" />
        <!-- Custom styles -->
        <link rel="stylesheet" href="./css/style.css" />
    </head>
    <style>
        .card {
            width: 100%;
            height: 570px;
        }

        .my-btn {
            margin-bottom: 20px;
        }

        .my-btn button:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .my-btn button.btn-outline-primary {
            background-color: #007bff;
            color: #fff;
        }

        .my-btn button.btn-outline-info {
            background-color: #17a2b8;
            color: #fff;
        }

        .my-btn button {
            transition: all 0.3s ease-in-out;
        }

        .my-btn button:hover {
            transform: scale(1.05);
        }

    </style>
    <body>
        <jsp:include page="./include/Menu.jsp"></jsp:include>
            <!--Main layout-->
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
                            <h1>
                                ${message}
                            </h1>
                <!-- Navbar -->
                <c:if test="${sessionScope.acc.isSell == 1}">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end my-btn">
                        <button class="btn btn-outline-primary btn-lg" type="button">Total products: ${sessionScope.totalProduct}</button>
                        <button class="btn btn-outline-info btn-lg" type="button">Total quantity: ${sessionScope.totalQuantity}</button>
                    </div>
                </c:if>
                <c:if test="${not empty notFoundMessage}">
                    <div class="alert alert-warning">${notFoundMessage}</div>
                </c:if>

                <!-- Products -->
                <section>
                    <div class="text-center">
                        <div class="row">
                            <c:forEach items="${listP}" var="o">
                                <div class="col-lg-3 col-md-6 mb-4">
                                    <div class="card">
                                        <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
                                             data-mdb-ripple-color="light">
                                            <img src="${o.image}"
                                                 class="w-100" style="height: 380px;" />
                                            <a href="#!">
                                                <div class="mask">
                                                    <div class="d-flex justify-content-start align-items-end h-100">
                                                        <h5><span class="badge bg-dark ms-2">NEW</span></h5>
                                                    </div>
                                                </div>
                                                <div class="hover-overlay">
                                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="card-body">
                                            <a href="detail?pid=${o.id}" class="text-reset">
                                                <h5 class="card-title mb-2">${o.name}</h5>
                                            </a>
                                            <a href="" class="text-reset ">
                                                <p>${o.title}</p>
                                            </a>
                                            <h6 class="mb-3 price">${o.price}$</h6>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>

                <!-- Pagination -->
                <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
                    <ul class="pagination">
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach var="i" begin="1" end="${endPage}">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="?page=${i}">${i}</a>
                            </li>
                        </c:forEach>

                        <li class="page-item ${currentPage == endPage ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>  
                <!-- Pagination -->  
            </div>
        </main>
        <!--Main layout-->

        <jsp:include page="./include/Footer.jsp"></jsp:include>
        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript" src="js/script.js"></script>
        <script>
            let slideIndex = 0;
            setInterval(function () {
                slideIndex++;
                if (slideIndex >= $('.carousel-item').length) {
                    slideIndex = 0;
                }

                $('.carousel-item').removeClass('active');
                $('.carousel-item').eq(slideIndex).addClass('active');
            }, 5000);
            let intervalID;
            intervalID = setInterval(function () {
            }, 5000);
            $('.carousel-indicators li, .carousel-control-prev, .carousel-control-next').on('click', function () {
                clearInterval(intervalID);
            });

            $('.carousel-control-prev').click(function () {
                $('.carousel-item.active').prev('.carousel-item').addClass('active');
                $('.carousel-item.active:last').removeClass('active');
            });

            $('.carousel-control-next').click(function () {
                $('.carousel-item.active').next('.carousel-item').addClass('active');
                $('.carousel-item.active:first').removeClass('active');
            });

            $('.carousel-control-next').click(function () {
                $('.carousel-item:first').appendTo('.carousel-inner');
            });

            $('.carousel-control-prev').click(function () {
                $('.carousel-item:last').prependTo('.carousel-inner');
            });


        </script>
    </body>
</html>

