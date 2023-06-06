<%-- 
    Document   : home
    Created on : May 30, 2023, 10:24:56 PM
    Author     : duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- pushin - parallax -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css"
              integrity="sha512-oHDEc8Xed4hiW6CxD7qjbnI+B07vDdX7hEPTvn9pSZO1bcRqHp8mj9pyr+8RVC2GmtEfI2Bi9Ke9Ass0as+zpg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pushin@5/dist/pushin.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/pushin@5/dist/umd/pushin.min.js"></script>
        <!-- bootstrap v5.3 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
        <!-- wow.js -->
        <link rel="stylesheet" href="css/animate.css" />
        <!-- Fontawesome -->
        <script src="https://kit.fontawesome.com/03200e350d.js" crossorigin="anonymous"></script>
        <!-- css -->
        <link rel="stylesheet" href="./css/style.css" />
        <!-- animate.js -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <script src="https://kit.fontawesome.com/03200e350d.js" crossorigin="anonymous"></script>
        <!-- mdb -->
        <!-- Font Awesome -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <title>Healthier</title>
    </head>


    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;1,200;1,300;1,400;1,500&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;1,400;1,500&family=Poppins:wght@200&family=Spectral:wght@400;500&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Pangolin&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600&display=swap');

        body {
            box-sizing: border-box;
            color: #000000;
        }

        .image {
            background: rgba(0, 0, 0, 0.1) url("./asset/4920288.svg");
            background-size: cover;
            background-repeat: no-repeat;
            background-blend-mode: darken;
            width: 100%;
            height: auto;
        }




        .scroll-img {
            position: absolute;
            bottom: 3%;
            left: 50%;
        }

        .other {
            background: #fff;
            width: 100%;
            height: auto;
        }

        .back-to-top {
            position: fixed;
            bottom: 25px;
            right: 25px;
            display: none;
            z-index: 101;
        }


        .introduce-section {
            padding: 5em 0;
        }

        .introduce-section {
            font-family: 'Spectral', serif;
        }

        .introduce-section .introduce-title {

            font-size: 4em;
            color: #004d49;
            font-weight: 600;
            letter-spacing: 3px;
        }

        .welcome-text {
            font-size: 1.5em;
            color: #004d49;
            margin-top: 2em;
            font-weight: 200;
            color: #004d49;
            line-height: 1.4;
        }

        .introduce-section .rotate-title-list {
            border: 0 solid white;
            height: 70px;
            line-height: 70px;
            color: #068466;
            font-size: 50px;
            margin-top: 16px;
            overflow: hidden;
            margin-left: 0px;
        }

        .introduce-section .rotate-title-list span {
            position: relative;
            animation: rotate 7s ease infinite;
        }
        .introduce-section > p {
            font-family: 'inter';
            color: #4b5563;
            font-weight: 400;
            font-size: 1.3em;
        }
        @keyframes rotate {

            0%,
            22%,
            100% {
                top: 0;
            }

            28%,
            40% {
                top: -70px;
            }

            46%,
            68% {
                top: -140px;
            }

            74%,
            96% {
                top: -70px;
            }

        }

        video {
            width: 100%;
            margin-top: 30px;
            height: auto;
            object-fit: cover;
        }

        /*  */
        .footer {
            background-image: linear-gradient(to right top, #66d271, #5cd276, #52d37b, #46d381, #38d386);
            margin-top: 6em;
            padding: 2em 2em;
            /* min-width: 456px; */
            max-width: 60%;
            border-radius: 30px;
        }

        .footer>h2 {
            font-family: 'inter';
            font-size: 20px;
            line-height: 1.2em;
            font-weight: 700;
            font-size: 5vh;
            color: white;

        }

        @font-face {
            font-family: 'hero-light';
            src: url('/font/Hero_Light/Hero_Light.otf');
        }

        .footer>div>button {
            font-family: 'hero-light';
            font-size: 4vh;
            background-color: #abcc76;
            font-weight: 600;
            padding: 0.3em 1.5em;
        }

        .footer>div>button:hover {
            background-color: #abcc76;
        }

        .pushin-layer>h2 {
            color: white;
            font-size: 8vh;
            font-family: 'Inter', sans-serif;
            /* background-image: linear-gradient(to right,var(--tw-gradient-stops));
        --tw-gradient-from: #71d16c;
        --tw-gradient-to: rgba(113,209,108,0);
        --tw-gradient-stops: var(--tw-gradient-from),var(--tw-gradient-to);
        --tw-gradient-to: #0ea5e9;
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent; */
        }


        .row>h4 {
            font-family: 'Poppins';
            font-size: 5vh;
            margin-bottom: 1em;
            --tw-text-opacity: 1;
            color: rgb(113 209 108/var(--tw-text-opacity));
        }

        .other {
            background: url('./asset/background_blur.png');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
        }

        .signin-btn {
            background-image: linear-gradient(to right, var(--tw-gradient-stops));
            --tw-gradient-from: #71d16c;
            --tw-gradient-to: rgba(113, 209, 108, 0);
            --tw-gradient-stops: var(--tw-gradient-from), var(--tw-gradient-to);
            --tw-gradient-to: #27d38e;
            --tw-text-opacity: 1;
            height: 40px;
            padding: 0 24px;
            font-family: 'intern';
            color: #ffffff;
            font-weight: 500;
            font-size: 15px;
            line-height: 24px;
            margin: auto 0;
            position: relative;
            min-width: 135px;
            border-radius: 50px;
            font-family: 'inter';
        }

        .signin-btn:active {
            color: #27d38e;
        }

        .start-btn{
            height: 40px;
            padding: 0 24px;
            font-family: 'inter';
            color: #ffffff;
            font-weight: 500;
            font-size: 16px;
            line-height: 24px;
            margin: auto 0;
            position: relative;
            min-width: 117px;
            border-radius: 9999px;
            font-family: 'inter';
            margin: 0 auto;
        }
        .signin-btn > p {
            margin: auto 0;
        }
        .start-btn > p {
            margin: auto auto;
        }
        .nav-link{
            font-size: 2.7vh;
        }
        .text-gradient {
            background-image: linear-gradient(to right,var(--tw-gradient-stops));
            --tw-gradient-from: #71d16c;
            --tw-gradient-to: rgba(113,209,108,0);
            --tw-gradient-stops: var(--tw-gradient-from),var(--tw-gradient-to);
            --tw-gradient-to: #0ea5e9;
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent !important;
        }
        .navbar{
            font-family: 'inter';
            color: #4b5563 !important;
            font-weight: 500;

        }
        .navbar > button {
        }
        .details{
            font-family: 'inter';
            font-weight: 400;
            color: #4b5563;
            line-height: 28px;
        }

        #basicAccordion{
            margin: 4em auto;
            padding: 2em 1em;
            width: 70%;
            /* min-width: 500px; */
        }

        #basicAccordion > p{
            color: #71d16c;
            font-family: 'inter';
            font-weight: 600;
        }

        #basicAccordion > h1{
            color: #4b5563;
            font-family: 'inter';
            font-weight: 600;
            margin-bottom: 1em;
        }
        .accordion-item > h2{
            color: #2d3e4d;
            font-family: 'inter';
            font-weight: 500;
            padding: 0.5em;
        }
        .accordion-body{
            color: #4b5563;
            font-family: 'inter';
            font-weight: 400;
        }

    </style>

    <body>
        <%
            response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setDateHeader("Expires", 0);
//prevents caching at the proxy server
        %>
        <nav class="navbar navbar-expand-md mb-4 fixed-top" style="padding-left: 2em; padding-right: 2em; position: fixed;">
            <div class="container-fluid">
                <a href="home.jsp" class="nav-brand" style="width: 126px;"><img class="navbar-brand" src="./asset/healthier (1) (1).png" alt=""
                                                                                style="
                                                                                width: 100%; height: auto;"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                        aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarCollapse">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0" style="margin: 0 auto ">
                        <li class="nav-item">
                            <a class="nav-link" style="color: #4b5563" href="home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="color: #4b5563" aria-current="page"
                               href="overview">Overview</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="color: #4b5563" href="exercise.jsp">Exercises</a>
                        </li>
                        <li class="nav-item">
                            <a href="explore.html" class="nav-link" style="color: #4b5563;">Explore</a>
                        </li>
<!--                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false" style="color: #4b5563;">
                                Languages
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Vietnamese
                                    </a>
                                </li>
                                <li><a class="dropdown-item" href="#">English
                                    </a></li>
                            </ul>
                        </li>-->

                    </ul>
                    <% if (session != null && session.getAttribute("email") != null) {%>
                    <p>
                    <form action="logout">
                        <button class="btn-primary border-0 signin-btn">
                            <p href="">Log out</p>
                        </button></p>
                    </form>

                    <% } else { %>
                    <form action="login.jsp">
                        <button class="btn-primary border-0 signin-btn">
                            <p href="">Get started</p>
                        </button>
                    </form>
                    <% }%>


                </div>
        </nav>
        <!-- Navbar -->
        <div class="container">
            <div class="pushin" style="height: 2000px; position: relative;">
                <div class="pushin-layer text-center">
                    <img style="width: 40%; height: auto;" src="./asset/Untitled design.png" alt="">
                </div>
                <div class="pushin-layer text-center">
                    <img style="width: 50%; height: auto;" src="./asset/heading_2.png" alt="">
                </div>
                <div class="pushin-layer pushin-layer--visible image" data-pushin-from="2" data-pushin-transitions="false"
                     data-pushin-speed="20">
                </div>

                <img src="https://uploads-ssl.webflow.com/5cff83ac2044e22cb8cf2f11/5d00043816a6c695bcf1581a_scroll.gif"
                     width="50" data-w-id="dcf28854-c021-68b1-26d8-0a4a2d0891e9" alt="" class="scroll-img"
                     style="will-change: opacity; opacity: 1; z-index: 99999" />
            </div>
        </div>
        <!-- Parallax -->
        <div class="other" style="z-index: 100; position: absolute; ">
            <section>
            </section>
            <div class="introduce-section container text-center">
                <h2 class="introduce-title text-gradient"> Try to have a </h2>
                <h2>
                    <div class="rotate-title-list">
                        <span>
                            better health<br />
                            better life<br />
                            better you<br />
                        </span>
                    </div>
                </h2>
                <p class="welcome-text">Welcome to our Healthier website! We are dedicated to providing you with the best
                    resources and tools to help you achieve your health and wellness goals.</p>
                <!-- <video src="/asset/video.mp4" autoplay loop></video> -->
                <img style="margin-top: 2em;" src="./asset/quote-hero.webp" alt="">
            </div>
            <!-- Done intro -->
            <div>
                <div class="container service" style="margin-top:3em">
                    <div class="row" style="font-family: 'inter', serif;">
                        <h4 class="text-center">Our services</h4>
                        <!-- <div class="col-lg-4 col-md-4 col-sm-12 col-xl-4">
    
                            <div class="text-center">
                                <img src="/asset/function1img.png" alt="" style="width: 100%; height: auto;">
                                <h3 style="color: #004d49; font-size: 2em; font-weight: 300;">Workout exercies</h3>
                                <p style="color: #068466; font-size: 1.2em; ">Our website gives resources on a variety of
                                    fitness topics.</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xl-4">
                            <div class="text-center">
                                <img src="/asset/function2img.png" alt="" style="width: 100%; height: auto;">
                                <h3 style="color: #004d49; font-size: 2em; font-weight: 300;">Anatomic body</h3>
                                <p style="color: #068466; font-size: 1.2em; ">You can explore inside your body with 3D
                                    anatomiy.</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xl-4">
                            <div class="text-center">
                                <img src="/asset/function3img.png" alt="" style="width: 100%; height: auto;">
                                <h3 style="color: #004d49; font-size: 2em; font-weight: 300;">Suitable nutrition</h3>
                                <p style="color: #068466; font-size: 1.2em; ">Providing perfect nutrition related to your
                                    body part need.</p>
                            </div>
                        </div> -->
                        <div class="row" style="margin-bottom: 3em;">
                            <div class="col-lg-6 col-sm-12 col-md-6">
                                <div class="text-center"><img src="./asset/—Pngtree—sport crunches illustration_4678510.png"
                                                              alt="" style="width: 80%; height: auto; margin: 0 auto;">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12" style="margin-top: auto; margin-bottom: auto;">
                                <p style="color: #71d16c; font-weight: 600; font-size: 1.3em;">Workout exercies</p>
                                <p style="color: #4b5563; font-size: 1.2em; font-weight: 400; line-height: 1.9em; ">
                                    Welcome to our fitness website, where we offer resources on workout exercises to help
                                    you achieve your fitness goals. </br>
                                <p
                                    style="margin-top:2em; color: #4b5563; font-size: 1.2em; font-weight: 400; line-height: 1.9em;">
                                    🏆 We provide exercise demonstrations, workout plans and programs, challenges, and
                                    community support to keep you motivated and engaged.</p>
                                </p>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 3em;">
                            <div class="col-lg-6 col-md-6 col-sm-12" style="margin-top: auto; margin-bottom: auto;">
                                <p style="color: #71d16c; font-weight: 600; font-size: 1.3em;">Anatomic body</p>
                                <p style="color: #4b5563; font-size: 1.2em; font-weight: 400; line-height: 1.9em; ">
                                    Our 3D anatomic tool offers a unique way to explore the human body.</br>
                                <p
                                    style="margin-top:2em; color: #4b5563; font-size: 1.2em; font-weight: 400; line-height: 1.9em;">
                                    ✨ With the ability to navigate through layers, zoom, and rotate, you can gain a deeper
                                    understanding of the body's structures and functions. </p>
                                </p>
                            </div>
                            <div class="col-lg-6 col-sm-12 col-md-6">
                                <div class="text-center"><img src="./asset/tracking2(optional).png" alt=""
                                                              style="width: 80%; height: auto; margin: 0 auto;">
                                </div>
                            </div>
                        </div>
                        <div class="row" style="">
                            <div class="col-lg-6 col-sm-12 col-md-6">
                                <div class="text-center"><img src="./asset/tracking.png" alt=""
                                                              style="width: 80%; height: auto; margin: 0 auto;">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12" style="margin-top: auto; margin-bottom: auto;">
                                <p style="color: #71d16c; font-weight: 600; font-size: 1.3em;">Health tracking</p>
                                <p style="color: #4b5563; font-size: 1.2em; font-weight: 400; line-height: 1.9em; ">
                                    Track your health and wellness with our convenient tools and resources. </br>
                                <p
                                    style="margin-top:2em; color: #4b5563; font-size: 1.2em; font-weight: 400; line-height: 1.9em;">
                                    🪄 Log and monitor various aspects of your health, access expert advice, and connect
                                    with a community of like-minded individuals.</p>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




            <!--  -->
            <div>
                <div class="container service" style="font-family: 'Poppins'; margin-top: 8em;">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <h2 style="margin: 0 0; align-items: center; text-align: left;
                                max-width: 5em; font-size: 9vh;
                                color: #004d49;
                                " class="text-gradient">What's new?
                            </h2>
                            <div style="font-size: 1.1em; margin-top: 2em;">
                                <div style="text-align: justify ;display: flex; align-items: start; gap: 12px;">
                                    <i class="fa-solid fa-circle-check" style="color: #71d16c; font-size: 1.7em;"></i>
                                    <span class="details" style="margin: auto 0; display: inline-block; max-width: 50%;">Get
                                        all information
                                        you need about health.</span>
                                </div>
                                <br>
                                <div class="" style="max-width: 70%; margin-left: auto; text-align: justify;display: flex;
                                     align-items: start; gap: 12px;
                                     margin-top: 0.5em">
                                    <span class="details">Easily create a customized plan that works for you and fits your
                                        unique needs and preferences.</span>
                                    <i class="fa-solid fa-circle-check"
                                       style="color: #71d16c; font-size: 1.7em; position: relative; top:0"></i>
                                </div>
                                <div style="max-width: 70%; text-align: justify;display: flex; align-items: start; gap: 12px;
                                     margin-top: 2.5em;">
                                    <i class="fa-solid fa-circle-check"
                                       style="color: #71d16c; font-size: 1.7em; height: 100%;"></i>
                                    <span class="details">Website is packed with resources on a variety of topics, including
                                        nutrition, exercise, mental health, and more.</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 text-center">
                            <img src="./asset/cayhoa.jpg" alt="" style="width: 85%; height: auto;">
                        </div>
                    </div>


                </div>
            </div>
            <!-- Question -->
            <div class="container text-center">
                <div class="accordion" id="basicAccordion">
                    <p>GOT A QUESTION?</p>
                    <h1>Things you might wonder</h1>
                    <div class="q-items" style="border-radius: 20px;">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse"
                                        data-mdb-target="#basicAccordionCollapseOne" aria-expanded="false"
                                        aria-controls="collapseOne">
                                    What is Healthier?
                                </button>
                            </h2>
                            <div id="basicAccordionCollapseOne" class="accordion-collapse collapse"
                                 aria-labelledby="headingOne" data-mdb-parent="#basicAccordion" style="">
                                <div class="accordion-body">
                                    <strong>Healthier is a platform that helps you keep track of your body and helps you
                                        keep yourself healthy.</strong><br>
                                    We also provide you with information about the human body and personalized exercise
                                    recommendations based on your body
                                    mass index (BMI) or fitness goals.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse"
                                        data-mdb-target="#basicAccordionCollapseTwo" aria-expanded="false"
                                        aria-controls="collapseTwo">
                                    How I use Healthier?
                                </button>
                            </h2>
                            <div id="basicAccordionCollapseTwo" class="accordion-collapse collapse"
                                 aria-labelledby="headingTwo" data-mdb-parent="#basicAccordion" style="">
                                <div class="accordion-body">
                                    <strong>To use Healthier, enter your BMI and fitness goals, then browse educational
                                        content and view personalized exercise recommendations. </strong><br>
                                    Follow your exercise plan and track your progress within the app to stay motivated and
                                    achieve your health and fitness goals.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse"
                                        data-mdb-target="#basicAccordionCollapseThree" aria-expanded="false"
                                        aria-controls="collapseThree">
                                    Can I request a feature?
                                </button>
                            </h2>
                            <div id="basicAccordionCollapseThree" class="accordion-collapse collapse"
                                 aria-labelledby="headingThree" data-mdb-parent="#basicAccordion" style="">
                                <div class="accordion-body">
                                    <strong>Yes, you can request a feature for Healthier by contacting customer
                                        support.</strong><br>
                                    We will consider adding it in a future update if it aligns with the app's goals and
                                    vision.
                                    Customer feedback is always welcome, and the team is committed to making Healthier the
                                    best app it can be for its users.
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
            <!-- let start -->
            <section class="" style="">
                <div class="footer" style="margin-left: auto; margin-right: auto;">
                    <h2 style="max-width: 80%; margin: 0 auto; font-size:4.5vh;" class="text-center">What are you waiting for without experiencing Healthier</h2>
                    <% if (session != null && session.getAttribute("email") != null) {%>
                    <form action="overview.jsp" style="margin-top: 3em" class="text-center">
                        <button class="start-btn  border-0" style="background-color: #ffffff !important;">
                            <p href="" style="color: #43D68E">Get started</p>
                        </button>
                    </form>

                    <% } else { %>
                    <form action="login.jsp" style="margin-top: 3em" class="text-center">
                        <button class="start-btn  border-0" style="background-color: #ffffff !important;">
                            <p href="" style="color: #43D68E">Get started</p>
                        </button>
                    </form>
                    <% }%>

                </div>
            </section>

            <!-- footer -->
            <!-- Footer -->
            <style>
                .text-muted>h6 {
                }

                .text-muted>p {
                    color: #4b5563;
                }
            </style>
            <footer class="text-center text-lg-start  text-muted" style="margin-top: 6em; font-family: 'inter';">
                <!-- Section: Social media -->
                <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">



                </section>

                <section class="">
                    <div class="container text-center text-md-start mt-5">
                        <!-- Grid row -->
                        <div class="row mt-3">
                            <!-- Grid column -->
                            <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                                <!-- Content -->
                                <h6 class="text-uppercase fw-bold mb-4">
                                    <i class="fas fa-gem me-3"></i>Healthier
                                </h6>
                                <p>
                                    Vo Thi Hong Anh
                                </p>
                                <p>
                                    Le Quang Phat
                                </p>
                                <p>
                                    Nguyen Thuy Mai
                                </p>
                                <p>
                                    Dao Khanh Duy
                                </p>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                                <!-- Links -->
                                <h6 class="text-uppercase fw-bold mb-4">
                                    Products
                                </h6>
                                <p>
                                    <a class="text-reset" style="text-decoration: none;">Update</a>
                                </p>
                                <p>
                                    <a class="text-reset" style="text-decoration: none;">Blog</a>
                                </p>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                                <!-- Links -->
                                <h6 class="text-uppercase fw-bold mb-4">
                                    Useful links
                                </h6>
                                <p>
                                    <a class="text-reset" style="text-decoration: none;">Pricing</a>
                                </p>
                                <p>
                                    <a class="text-reset" style="text-decoration: none;">Settings</a>
                                </p>
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                                <!-- Links -->
                                <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                                <p><i class="fas fa-home me-3"></i>470 Tran Dai Nghia, Da Nang</p>
                                <p>
                                    <i class="fas fa-envelope me-3"></i>
                                    Healthier@vku.udn.vn
                                </p>
                                <p><i class="fas fa-phone me-3"></i> + 0 392 421 321</p>
                            </div>
                            <!-- Grid column -->
                        </div>
                        <!-- Grid row -->
                    </div>
                </section>
                <div class="text-center p-4">
                    © 2023 Copyright: Healthier
                </div>
            </footer>
            <!-- Footer -->


        </div>

        <a id="back-to-top" href="#" class=" btn-dark btn-lg back-to-top" role="button" style="font-size: 1.5em;"><i
                class="fas fa-chevron-up"></i></a>
        <!-- script -->
        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="js/app.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
                integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
                integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
        <script>
            tailwind.config = {
                prefix: "tw-"
            }
        </script>
    </body>

</html>
