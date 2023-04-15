<%-- 
    Document   : Footer
    Created on : Feb 22, 2023, 8:22:00 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/footer.css" />
<style>
    .footer-logo {
        margin-right: 3em;
    }
    .footer-logo img {
        width: 150px;
        height: 150px;
        padding-bottom: 1em;
    }
    .footer-widget p {
        margin-bottom: 27px;
    }
    p {
        font-family: 'Nunito', sans-serif;
        font-size: 16px;
        color: #7777;
        line-height: 28px;
    }
    .animate-border {
        position: relative;
        display: block;
        width: 115px;
        height: 3px;
        background: #007bff; }

    .animate-border:after {
        position: absolute;
        content: "";
        width: 35px;
        height: 3px;
        left: 0;
        bottom: 0;
        border-left: 10px solid #fff;
        border-right: 10px solid #fff;
        -webkit-animation: animborder 2s linear infinite;
        animation: animborder 2s linear infinite; }

    @-webkit-keyframes animborder {
        0% {
            -webkit-transform: translateX(0px);
            transform: translateX(0px); }
        100% {
            -webkit-transform: translateX(113px);
            transform: translateX(113px); } }

    @keyframes animborder {
        0% {
            -webkit-transform: translateX(0px);
            transform: translateX(0px); }
        100% {
            -webkit-transform: translateX(113px);
            transform: translateX(113px); } }

    .animate-border.border-white:after {
        border-color: #fff; }

    .animate-border.border-yellow:after {
        border-color: #F5B02E; }

    .animate-border.border-orange:after {
        border-right-color: #007bff;
        border-left-color: #007bff; }

    .animate-border.border-ash:after {
        border-right-color: #EEF0EF;
        border-left-color: #EEF0EF; }

    .animate-border.border-offwhite:after {
        border-right-color: #F7F9F8;
        border-left-color: #F7F9F8; }

    /* Animated heading border */
    @keyframes primary-short {
        0% {
            width: 15%; }
        50% {
            width: 90%; }
        100% {
            width: 10%; } }

    @keyframes primary-long {
        0% {
            width: 80%; }
        50% {
            width: 0%; }
        100% {
            width: 80%; } } 

    .dk-footer {
        padding: 75px 0 0;
        background-color: #151414;
        position: relative;
        z-index: 2; }
    .dk-footer .contact-us {
        margin-top: 0;
        margin-bottom: 30px;
        padding-left: 80px; }
    .dk-footer .contact-us .contact-info {
        margin-left: 50px; }
    .dk-footer .contact-us.contact-us-last {
        margin-left: -80px; }
    .dk-footer .contact-icon i {
        font-size: 24px;
        top: -15px;
        position: relative;
        color:#007bff; }

    .footer-awarad {
        margin-top: 285px;
        display: -webkit-box;
        display: -webkit-flex;
        display: -moz-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-flex: 0;
        -webkit-flex: 0 0 100%;
        -moz-box-flex: 0;
        -ms-flex: 0 0 100%;
        flex: 0 0 100%;
        -webkit-box-align: center;
        -webkit-align-items: center;
        -moz-box-align: center;
        -ms-flex-align: center;
        align-items: center; }
    .footer-awarad p {
        color: #fff;
        font-size: 24px;
        font-weight: 700;
        margin-left: 20px;
        padding-top: 15px; }

    .footer-info-text {
        margin: 26px 0 32px; }

    .footer-left-widget {
        padding-left: 80px; }

    .footer-widget .section-heading {
        margin-bottom: 35px; }

    .footer-widget h3 {
        font-size: 24px;
        color: #fff;
        position: relative;
        margin-bottom: 15px;
        max-width: -webkit-fit-content;
        max-width: -moz-fit-content;
        max-width: fit-content; }

    .footer-widget ul {
        width: 50%;
        float: left;
        list-style: none;
        margin: 0;
        padding: 0; }

    .footer-widget li {
        margin-bottom: 18px; }

    .footer-widget p {
        margin-bottom: 27px; }

    .footer-widget a {
        color: #ccc;
        -webkit-transition: all 0.3s;
        -o-transition: all 0.3s;
        transition: all 0.3s; }
    .footer-widget a:hover {
        color: #007bff; }

    .footer-widget:after {
        content: "";
        display: block;
        clear: both; }

    .dk-footer-form {
        position: relative; }
    .dk-footer-form input[type=email] {
        padding: 14px 28px;
        border-radius: 50px;
        background: #2E2E2E;
        border: 1px solid #2E2E2E; }
    .dk-footer-form input::-webkit-input-placeholder, .dk-footer-form input::-moz-placeholder, .dk-footer-form input:-ms-input-placeholder, .dk-footer-form input::-ms-input-placeholder, .dk-footer-form input::-webkit-input-placeholder {
        color: #878787;
        font-size: 14px; }
    .dk-footer-form input::-webkit-input-placeholder, .dk-footer-form input::-moz-placeholder, .dk-footer-form input:-ms-input-placeholder, .dk-footer-form input::-ms-input-placeholder, .dk-footer-form input::placeholder {
        color: #878787;
        font-size: 14px; }
    .dk-footer-form button[type=submit] {
        position: absolute;
        top: 0;
        right: 0;
        padding: 16px 24px 12px 17px;
        border-top-right-radius: 25px;
        border-bottom-right-radius: 25px;
        border: 1px solid #6c757d;
        background: #6c757d;
        color: #fff; }
    .dk-footer-form button:hover {
        cursor: pointer; }

    /* ==========================
    
        Contact
    
    =============================*/
    .contact-us {
        position: relative;
        z-index: 2;
        margin-top: 65px;
        display: -webkit-box;
        display: -webkit-flex;
        display: -moz-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -webkit-align-items: center;
        -moz-box-align: center;
        -ms-flex-align: center;
        align-items: center; }

    .contact-icon {
        position: absolute; }
    .contact-icon i {
        font-size: 36px;
        top: -5px;
        position: relative;
        color: #007bff; }

    .contact-info {
        margin-left: 75px;
        color: #fff; }
    .contact-info h3 {
        font-size: 20px;
        color: #fff;
        margin-bottom: 0; }

    .copyright {
        padding: 28px 0;
        margin-top: 55px;
        background-color: #202020; }
    .copyright span,
    .copyright a {
        color: #878787;
        -webkit-transition: all 0.3s linear;
        -o-transition: all 0.3s linear;
        transition: all 0.3s linear; }
    .copyright a:hover {
        color:#007bff; }

    .copyright-menu ul {
        text-align: right;
        margin: 0; }

    .copyright-menu li {
        display: inline-block;
        padding-left: 20px; }

    .back-to-top {
        position: relative;
        z-index: 2; }
    .back-to-top .btn-dark {
        width: 35px;
        height: 35px;
        border-radius: 50%;
        padding: 0;
        position: fixed;
        bottom: 20px;
        right: 20px;
        background: #2e2e2e;
        border-color: #2e2e2e;
        display: none;
        z-index: 999;
        -webkit-transition: all 0.3s linear;
        -o-transition: all 0.3s linear;
        transition: all 0.3s linear; }
    .back-to-top .btn-dark:hover {
        cursor: pointer;
        background: #FA6742;
        border-color: #FA6742; }
    .fa fa-send {
        height: 53.6px;
        margin-top: 10px;
    }
</style>
<footer class="text-center text-white mt-4" style="background-color: #607D8B">  

    <hr class="text-dark">

    <div class="container">
        <!-- Section: Social media -->
        <div class="row">
            <div class="col-md-6 col-lg-4">
                <div class="dk-footer-box-info">
                    <a href="index.html" class="footer-logo">
                        <img src="https://user-images.githubusercontent.com/111722739/218240117-cbf16755-69b5-4b1c-810e-c4cae5a06f2f.png" alt="footer_logo" class="img-fluid">
                    </a>
                    <p class="footer-info-text">
                        Reference site about Sneaker, giving information on its origins and you can buy it easy in MICKET SHOP.
                    </p>

                    <section class="mb-3">

                        <!-- Facebook -->
                        <a
                            class="btn-link btn-floating btn-lg text-white"
                            href="#!"
                            role="button"
                            data-mdb-ripple-color="dark"
                            ><i class="fab fa-facebook-f"></i
                            ></a>

                        <!-- Twitter -->
                        <a
                            class="btn-link btn-floating btn-lg text-white"
                            href="#!"
                            role="button"
                            data-mdb-ripple-color="dark"
                            ><i class="fab fa-twitter"></i
                            ></a>

                        <!-- Google -->
                        <a
                            class="btn-link btn-floating btn-lg text-white"
                            href="#!"
                            role="button"
                            data-mdb-ripple-color="dark"
                            ><i class="fab fa-google"></i
                            ></a>

                        <!-- Instagram -->
                        <a
                            class="btn-link btn-floating btn-lg text-white"
                            href="#!"
                            role="button"
                            data-mdb-ripple-color="dark"
                            ><i class="fab fa-instagram"></i
                            ></a>

                        <!-- YouTube -->
                        <a
                            class="btn-link btn-floating btn-lg text-white"
                            href="#!"
                            role="button"
                            data-mdb-ripple-color="dark"
                            ><i class="fab fa-youtube"></i
                            ></a>
                        <!-- Github -->
                        <a
                            class="btn-link btn-floating btn-lg text-white"
                            href="#!"
                            role="button"
                            data-mdb-ripple-color="dark"
                            ><i class="fab fa-github"></i
                            ></a>
                    </section>  
                </div>  
            </div>
            <div class="col-md-6 col-lg-8">
                <div class="row">
                    <div class="col-md-6">
                        <div class="contact-us">
                            <div class="contact-icon" style="padding-left: 5em">
                                <i class="fa fa-map-o" aria-hidden="true"></i>
                            </div>
                            <!-- End contact Icon -->
                            <div class="contact-info" style="padding-left: 4.5em">
                                <h3>MICKET SHOP</h3>
                                <p>Ho Chi Ming City</p>
                            </div>
                            <!-- End Contact Info -->
                        </div>
                        <!-- End Contact Us -->
                    </div>
                    <!-- End Col -->
                    <div class="col-md-6">
                        <div class="contact-us contact-us-last">
                            <div class="contact-icon" style="padding-left: 2.8em">
                                <i class="fa fa-volume-control-phone" aria-hidden="true"></i>
                            </div>
                            <!-- End contact Icon -->
                            <div class="contact-info" style="padding-left: 1em">
                                <h3>0974 261 510</h3>
                                <p>Contact us</p>
                            </div>
                            <!-- End Contact Info -->
                        </div>
                        <!-- End Contact Us -->
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Contact Row -->
                <div class="row">
                    <div class="col-md-12 col-lg-6">
                        <div class="footer-widget footer-left-widget">
                            <div class="section-heading">
                                <h5>About MICKET</h5>
                            </div>
                            <ul>
                                <li>
                                    <a href="#">About us</a>
                                </li>
                                <li>
                                    <a href="#">Services</a>
                                </li>
                                <li>
                                    <a href="#">Projects</a>
                                </li>
                                <li>
                                    <a href="#">Our Team</a>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <a href="#">Contact us</a>
                                </li>
                                <li>
                                    <a href="#">Blog</a>
                                </li>
                                <li>
                                    <a href="#">Testimonials</a>
                                </li>
                                <li>
                                    <a href="#">Faq</a>
                                </li>
                            </ul>
                        </div>
                        <!-- End Footer Widget -->
                    </div>
                    <!-- End col -->
                    <div class="col-md-12 col-lg-6">
                        <div class="footer-widget">
                            <div class="section-heading">
                                <h3 style="padding-left: 4.5em">Subscribe</h3>
                            </div>
                            <p><!-- Don’t miss to subscribe to our new feeds, kindly fill the form below. -->
                                Reference site about MICKET SHOP, giving information on its origins, as well.</p>
                            <form action="#">
                                <div class="form-row">
                                    <div class="col dk-footer-form">
                                        <input type="email" class="form-control" placeholder="Email Address">
                                        <button type="Submit">
                                            <i class="fa fa-send">Submit</i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <!-- End form -->
                        </div>
                        <!-- End footer widget -->
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Row -->
            </div>
            <!-- Section: Social media -->
        </div>
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2); text-color: #E0E0E0">
        © 2023 Copyright:
        <a class="text-white">MICKETSHOP.com</a>
    </div>
    <!-- Copyright -->
</footer>
