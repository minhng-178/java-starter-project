<%-- 
    Document   : Menu
    Created on : Feb 22, 2023, 8:15:34 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style>
    .carousel-inner {
        position: relative;
        animation: slide 1s ease-in-out;
    }

    @keyframes slide {
        from {
            opacity: 0;
            transform: translateY(-50%);
        }
        to {
            opacity: 1;
            transform: translate(0%);
        }
    }

    .carousel-caption {
        position: absolute;
        top: 60%;
        transform: translateY(-50%);
        text-align: center;
    }

    .carousel-caption h1 {
        font-size: 3rem;
        font-weight: 600;
        line-height: 1.2;
    }

    .carousel-caption p {
        font-size: 1.5rem;
        line-height: 1.5;
        margin: 1rem 0;
        color: #ccc;
    }

    .carousel-control-prev,
    .carousel-control-next {
        width: 5%;
        color: #fff;
        text-align: center;
        opacity: 0.5;
    }

    .carousel-control-prev:hover,
    .carousel-control-next:hover {
        color: #fff;
        opacity: 0.9;
        text-decoration: none;
    }

    .carousel-control-prev:focus,
    .carousel-control-next:focus {
        color: #fff;
        opacity: 0.9;
        text-decoration: none;
        outline: none;
    }

    .carousel-control-prev i,
    .carousel-control-next i {
        font-size: 2rem;
    }

    .carousel-control-prev {
        left: 0;
    }

    .carousel-control-next {
        right: 0;
    }

    .carousel-indicators {
        position: absolute;
        bottom: 1rem;
        left: 0;
        right: 0;
        margin-left: auto;
        margin-right: auto;
        width: 100px;
        display: flex;
        justify-content: space-between;
    }

    .carousel-indicators li {
        width: 10px;
        height: 10px;
        border-radius: 50%;
        border: 1px solid #fff;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .carousel-indicators .active {
        background-color: #fff;
    }

    .carousel-item img {
        height: 750px;
        object-fit: cover;
        filter: brightness(65%);
    }
    
    .carousel.slide .carousel-inner {
        transition: transform 0.6s ease;
    }

    .carousel.slide .carousel-item {
        display: block;
        position: relative;
    }

    .carousel.slide .carousel-item.active {
        opacity: 1;
    }

    .carousel.slide .carousel-item-next.carousel-item-left,
    .carousel.slide .carousel-item-prev.carousel-item-right,
    .carousel.slide .carousel-item-next.carousel-item-right,
    .carousel.slide .carousel-item-prev.carousel-item-left {
        position: absolute;
        top: 0;
    }

    .carousel.slide .carousel-item-next.carousel-item-left,
    .carousel.slide .carousel-item-prev.carousel-item-right {
        transform: translateX(0);
    }

    .carousel.slide .carousel-item-next,
    .carousel.slide .carousel-item-prev {
        transform: translateX(100%);
    }

    .carousel.slide .carousel-item-next.carousel-item-right,
    .carousel.slide .carousel-item-prev.carousel-item-left {
        transform: translateX(-100%);
    }

    .carousel.slide .carousel-control-prev,
    .carousel.slide .carousel-control-next {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        z-index: 5;
    }
    .mask {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        z-index: -1;
    }
    .logo {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .logo-img img {
        width: 75px;
        height: 75px;
    }

    .user-logo {
        border: 1px solid #ccc;
        padding: 5px;
        border-radius: 50%;
    }
    .log-out {
        margin: 0 5px;
    }
    select {
        border: none;
    }   
</style>
<!-- Navbar -->
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white">
    <!-- Container wrapper -->
    <div class="container">    
        <!-- Toggle button -->
        <button
            class="navbar-toggler"
            type="button"
            data-mdb-toggle="collapse"
            data-mdb-target="#navbarSupportedContent1"
            aria-controls="navbarSupportedContent1"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
            <i class="fas fa-bars"></i>
        </button>

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent1">      
            <!-- Navbar brand -->
            <a class="navbar-brand mt-2 mt-sm-0 logo-img" href="home">
                <img src="https://user-images.githubusercontent.com/111722739/218240117-cbf16755-69b5-4b1c-810e-c4cae5a06f2f.png" alt="MICKET Logo" loading="lazy" />
            </a>
            <!-- Left links -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="managerA">MANAGER ACCOUNT</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.isSell == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="managerP">MANAGER PRODUCT</a>
                    </li>
                </c:if>
            </ul>
            <!-- Left links -->      
        </div>
        <!-- Collapsible wrapper -->

        <!-- Right elements -->
        <div class="d-flex align-items-center justify-content-between">
            <!-- Icon -->
            <c:if test="${sessionScope.acc != null}">
                <c:set var="greeting" value="${sessionScope.acc.user.toUpperCase()}" />
                <c:if test="${sessionScope.acc.isSell == 0}">
                <a class="nav-link me-3" href="viewCart">
                    <i class="fas fa-shopping-cart"></i>
                    <span id="cart-count" class="badge rounded-pill badge-notification bg-danger">${sessionScope.total}</span>
                </a>
                </c:if>
                <div class="nav-link me-3 d-flex align-items-center justify-content-between">
                    <i class="log-out fa fa-user user-logo"></i> 
                    <select class="log-out nav-link" onchange="location = this.value;">
                        <option value="javascript:void(0)"> ${greeting} </option>
                        <option value="#">Profile</option>
                        <option value="#">Settings</option>
                        <option value="logout">Log Out</option>
                    </select>
                </div>    
            </c:if>
            <c:if test="${sessionScope.acc == null}">                
                <div class="nav-link me-3">
                    <a class="nav-link" href="login">LOG IN</a>
                </div>
            </c:if>
            <a href="https://github.com/dunghuynh-teaching/prj301-se1735-10" class="border rounded px-2 nav-link"
               target="_blank">
                <i class="fab fa-github me-2"></i>MICKET GitHub
            </a>
        </div>
        <!-- Right elements -->
    </div>
    <!-- Container wrapper -->
</nav>
<!-- Navbar -->

<!-- carousel -->
<div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-mdb-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/i8m595rhllwbvxg4astc/michael-jordan-air-jordan-1-banned-ad-1985?fimg-ssr-default" class="d-block w-100" alt="Wild Landscape"/>
            <div class="mask"></div>
            <div class="carousel-caption d-none d-sm-block mb-5">
                <h1 class="mb-5">
                    <strong>LIFE IS SHORT, BUY THE SNEAKERS</strong>
                </h1>

                <p>
                    <strong>Shop now and elevate your sneaker game today!</strong>
                </p>

                <a target="_blank" href="home" class="btn btn-outline-white btn-lg">Start buy now
                    <i class="fas fa-shopping-cart ms-2"></i>
                </a>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://images.unsplash.com/photo-1585459733425-6d1b90e0064e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="d-block w-100" alt="Second Slide"/>
            <div class="mask"></div>
            <div class="carousel-caption d-none d-sm-block mb-5">
                <h1 class="mb-5">
                    <strong>FREE SHIPPING</strong>
                </h1>

                <p>
                    <strong>Applies for orders from 100$ above</strong>
                </p>
                <a target="_blank" href="home" class="btn btn-outline-white btn-lg">Start buy now
                    <i class="fas fa-shopping-cart ms-2"></i>
                </a>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://images.unsplash.com/photo-1656164061663-3dc536192fcb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80" class="d-block w-100" alt="Third Slide"/>
            <div class="mask"></div>
            <div class="carousel-caption d-none d-sm-block mb-5">
                <h1 class="mb-5">
                    <strong>DISCOUNT 10%</strong>
                </h1>

                <p>
                    <strong>Applies for new members</strong>
                </p>

                <a target="_blank" href="home" class="btn btn-outline-white btn-lg">Start buy now
                    <i class="fas fa-shopping-cart ms-2"></i>
                </a>
            </div>
        </div>
    </div>
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <i class="fas fa-chevron-left"></i>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <i class="fas fa-chevron-right"></i>
        <span class="sr-only">Next</span>
    </a>
</div>