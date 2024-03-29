
<%-- 
    Document   : home
    Created on : May 30, 2023, 10:24:56 PM
    Author     : duy
--%>

<%@page import="Controller.MiBand4Automation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.HashMap" %>
<%@page import="DAO.UserDAO"%>
<%@page import="Controller.Tuple"%>
<%@page import="Controller.MiBand4Automation"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="../assets/img/favicon.png">
        <title>
            Healthier
        </title>
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
        <!-- Nucleo Icons -->
        <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link id="pagestyle" href="../assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;1,200;1,300;1,400;1,500&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;1,400;1,500&family=Poppins:wght@200&family=Spectral:wght@400;500&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Pangolin&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600&display=swap');
        body{
            background: url("../assets/background_blur.png");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
            font-family: 'poppins';
        }
    </style>
    <% if (session != null && session.getAttribute("email") != null) { %>
    <!-- code to be executed if the session and email attribute exist -->
    <% } else { %>
    <% response.sendRedirect(request.getContextPath() + "/login.jsp"); %>
    <% } %>
    <body class="g-sidenav-show   bg-gray-100">
        <%!
          String userName;
          String email;
          String age;
          String weight;
          String height;
          String bmi;
          String bmiStr;
          String statusBMI;
  
        %>
        <%
            ArrayList<HashMap<String, String>> users = UserDAO.readUsersFromXML("/media/duy/33e9c786-2adc-46bf-8c3b-56bb1843c2e7/Download/apache-tomcat-9.0.74/bin/users.xml");
            for (HashMap<String, String> user : users) {
                userName = user.get("userName");
                email = user.get("email");
                age = user.get("age");
                weight = user.get("weight");
                height = user.get("height");
            }
            double weightInKg = Double.parseDouble(weight);
            double heightInM = Double.parseDouble(height) / 100;
            double bmi = weightInKg / (heightInM * heightInM);
            if (bmi < 18.5) {
                statusBMI = "Underweight";
            } else if (bmi < 25) {
                statusBMI = "Normal weight";
            } else if (bmi < 30) {
                statusBMI = "Overweight";
            } else {
                statusBMI = "Obese";
            }
            bmiStr = String.format("%.2f", bmi);
     int steps = 0;
    int fatBurned = 0;
    int calories = 0;
    int distance = 0;
    try {
        Tuple<Integer, Integer, Integer, Integer> data = MiBand4Automation.getDataFromMiBand4();
        steps = data.getFirst();
        fatBurned = data.getSecond();
        calories = data.getThird();
        distance = data.getFourth();
    } catch (Exception e) {
        e.printStackTrace();
    }
        %>
        <div class="min-height-300 bg-primary position-absolute w-100"></div>
        <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4"
               id="sidenav-main">
            <div class="sidenav-header">
                <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
                   aria-hidden="true" id="iconSidenav"></i>
                <a class="navbar-brand m-0" href="<%=request.getContextPath()%>/home.jsp" target="_blank">
                    <img src="../assets/healthier (1) (1).png" alt="" style="border-radius: 0 !important" />
                </a>
            </div>
            <hr class="horizontal dark mt-0" />
            <div class="collapse navbar-collapse w-auto" id="sidenav-collapse-main">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" href="../pages/dashboard.jsp"  style="
                           --tw-text-opacity: 1;
                           color: rgb(113 209 108 / var(--tw-text-opacity));
                           " href="../pages/exercise.jsp">
                            <div
                                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../pages/explore.jsp">
                            <div
                                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-world text-warning text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Explore</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../pages/chat.jsp">
                            <div style=""
                                 class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-chat-round text-success text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Support</span>
                        </a>
                    </li>
                    <!-- -->
                    <li class="nav-item">
                        <a class="nav-link" href="../pages/exercise.jsp">
                            <div style=""
                                 class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-user-run text-success text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Exericse</span>
                        </a>
                    </li>
                    <li class="nav-item mt-3">
                        <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">
                            Account pages
                        </h6>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../pages/profile.jsp">
                            <div
                                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Profile</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="sidenav-footer mx-3">
                <div class="card card-plain shadow-none" id="sidenavCard" style="opacity: 0">
                    <img class="w-50 mx-auto" src="../assets/img/illustrations/icon-documentation.svg" alt="sidebar_illustration" />
                    <div class="card-body text-center p-3 w-100 pt-0">
                        <div class="docs-info">
                            <h6 class="mb-0">Need help?</h6>
                            <p class="text-xs font-weight-bold mb-0">Please check our docs</p>
                        </div>
                    </div>
                </div>

                <a class="btn btn-primary btn-sm mb-0 w-100"
                   href="https://www.creative-tim.com/product/argon-dashboard-pro?ref=sidebarfree" type="button" style="
                   background-image: linear-gradient(
                   to left,
                   var(--tw-gradient-stops)
                   );
                   --tw-gradient-from: #ffcd55;
                   --tw-gradient-to: rgba(255, 205, 85, 0);
                   --tw-gradient-stops: var(--tw-gradient-from), var(--tw-gradient-to);
                   --tw-gradient-to: #f56772;
                   padding: 1rem;
                   font-size: 1rem;
                   ">Upgrade to pro</a>
            </div>
        </aside>
        <main class="main-content position-relative border-radius-lg ">
            <!-- Navbar -->
            <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur" data-scroll="false">
                <div class="container-fluid py-1 px-3">
                    <nav aria-label="breadcrumb">

                    </nav>
                    <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                        <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                            <div class="input-group">
                                <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" placeholder="Type here..">
                            </div>
                        </div>
                        <ul class="navbar-nav  justify-content-end">

                            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                                <a href="javascript:;" class=" text-dark p-0" id="iconNavbarSidenav">
                                    <div class="sidenav-toggler-inner">
                                        <i class="sidenav-toggler-line bg-white"></i>
                                        <i class="sidenav-toggler-line bg-white"></i>
                                        <i class="sidenav-toggler-line bg-white"></i>
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item px-3 d-flex align-items-center">
                                <a href="javascript:;" class=" text-dark p-0">
                                    <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
                                </a>
                            </li>
                            <li class="nav-item dropdown pe-2 d-flex align-items-center">
                                <a href="javascript:;" class=" text-dark p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-bell cursor-pointer"></i>
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end  px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton">
                                    <li class="mb-2">
                                        <a class="dropdown-item border-radius-md" href="javascript:;">
                                            <div class="d-flex py-1">
                                                <div class="my-auto">
                                                    <img src="../assets/img/team-2.jpg" class="avatar avatar-sm  me-3 ">
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="text-sm font-weight-normal mb-1">
                                                        <span class="font-weight-bold">New message</span> from Laur
                                                    </h6>
                                                    <p class="text-xs text-secondary mb-0">
                                                        <i class="fa fa-clock me-1"></i>
                                                        13 minutes ago
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="mb-2">
                                        <a class="dropdown-item border-radius-md" href="javascript:;">
                                            <div class="d-flex py-1">
                                                <div class="my-auto">
                                                    <img src="../assets/img/small-logos/logo-spotify.svg" class="avatar avatar-sm bg-gradient-dark  me-3 ">
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="text-sm font-weight-normal mb-1">
                                                        <span class="font-weight-bold">New album</span> by Travis Scott
                                                    </h6>
                                                    <p class="text-xs text-secondary mb-0">
                                                        <i class="fa fa-clock me-1"></i>
                                                        1 day
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item border-radius-md" href="javascript:;">
                                            <div class="d-flex py-1">
                                                <div class="avatar avatar-sm bg-gradient-secondary  me-3  my-auto">
                                                    <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                    <title>credit-card</title>
                                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                    <g transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF" fill-rule="nonzero">
                                                    <g transform="translate(1716.000000, 291.000000)">
                                                    <g transform="translate(453.000000, 454.000000)">
                                                    <path class="color-background" d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z" opacity="0.593633743"></path>
                                                    <path class="color-background" d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z"></path>
                                                    </g>
                                                    </g>
                                                    </g>
                                                    </g>
                                                    </svg>
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="text-sm font-weight-normal mb-1">
                                                        Payment successfully completed
                                                    </h6>
                                                    <p class="text-xs text-secondary mb-0">
                                                        <i class="fa fa-clock me-1"></i>
                                                        2 days
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="container-fluid py-4">
                <div class="row">
                    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                        <div class="glass">
                            <div class="card-body p-3" style="height: 23vh;"  >
                                <div class="row">
                                    <div class="col-8">
                                        <div class="numbers">
                                            <p class="text-sm mb-0 text-uppercase font-weight-bold"> YOUR BMI</p>
                                            <h5 class="font-weight-bolder">
                                                <%= bmiStr %>
                                            </h5>
                                            <p class="mb-0
                                               <% 
                                                   if (bmiStr.equals("Underweight")) { 
                                                       out.print("text-primary"); 
                                                   } else if (bmiStr.equals("Normal weight")) { 
                                                       out.print("text-success"); 
                                                   } else if (bmiStr.equals("Overweight")) { 
                                                       out.print("text-warning"); 
                                                   } else { 
                                                       out.print("text-danger"); 
                                                   } 
                                               %>">
                                                <%= statusBMI %>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-4 text-end">
                                        <div class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
                                            <i class="ni ni-satisfied text-lg opacity-10" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                        <div class="glass">
                            <div class="card-body p-3" style="height: 23vh;">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="numbers">
                                            <p class="text-sm mb-0 text-uppercase font-weight-bold">WALKING STEPS</p>
                                            <h5 class="font-weight-bolder">
                                                <%=steps%>
                                            </h5>
                                            <p class="mb-0">
                                                <span class="text-success text-sm font-weight-bolder">+3%</span>
                                                since last week
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-4 text-end">
                                        <div class="icon icon-shape bg-gradient-danger shadow-danger text-center rounded-circle">
                                            <i class="ni ni-user-run text-lg opacity-10" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                        <div class="glass">
                            <div class="card-body p-3" style="height: 23vh;">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="numbers">
                                            <p class="text-sm mb-0 text-uppercase font-weight-bold">CALORIES</p>
                                            <h5 class="font-weight-bolder">
                                                <%=calories%>
                                            </h5>
                                            <p class="mb-0">
                                                <span class="text-danger text-sm font-weight-bolder">-2%</span>
                                                since yesterday
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-4 text-end">
                                        <div class="icon icon-shape bg-gradient-success shadow-success text-center rounded-circle">
                                            <i class="ni ni-paper-diploma text-lg opacity-10" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6">
                        <div class="glass">
                            <div class="card-body p-3" style="height: 23vh;">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="numbers">
                                            <p class="text-sm mb-0 text-uppercase font-weight-bold">CONCLUSION</p>
                                            <h5 class="font-weight-bolder">
                                                NICE!
                                            </h5>
                                            <p class="mb-0">
                                                <span class="text-success text-sm font-weight-bolder">+5%</span> Keep going!
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-4 text-end">
                                        <div class="icon icon-shape bg-gradient-warning shadow-warning text-center rounded-circle">
                                            <i class="ni ni-trophy text-lg opacity-10" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-lg-7 mb-lg-0 mb-4">
                        <div class="glass z-index-2 h-100 glass">

                            <div class="card-body p-3" style="width: 100%; height: 100%;">
                                <div class="chart"  >
                                    <img src="../assets/heart-rate-2.jpg" alt="" style="width: 100%; height: 100%;
                                         border-radius: 20px;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <style>
                        @media only screen and (max-width: 768px) {
                            .car{
                                display: none;
                            }
                            @media only screen and (max-width: 1024px) {
                                /* CSS styles for medium-sized devices */
                                .car{
                                    display: none;
                                }
                            }
                        }
                    </style>
                    <div class="col-lg-5 car" style="">
                        <div class="glass card-carousel overflow-hidden h-100 p-0">
                            <div id="carouselExampleCaptions" class="carousel slide h-100" data-bs-ride="carousel">
                                <div class="carousel-inner border-radius-lg h-100">
                                    <div class="carousel-item h-100 active" style="background-image: url('../assets/distance1.jpg');
                                         background-size: cover; object-fit: contain;">
                                        <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                                            <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                                                <i class="ni ni-camera-compact text-dark opacity-10"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- <div class="carousel-item h-100" style="background-image: url('../assets/sleep.jpg'); -->
                                    background-size: cover; object-fit: cover; width: 100%; height: auto;">
                                    <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                                        <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                                            <i class="ni ni-bulb-61 text-dark opacity-10"></i>
                                        </div>
                                    </div>
                                </div>
                                <!-- <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                                  <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                                    <i class="ni ni-trophy text-dark opacity-10"></i>
                                  </div>
                                  <h5 class="text-dark mb-1">Share with us your design tips!</h5>
                                  <p>Don’t be afraid to be wrong because you can’t learn anything from a compliment.</p>
                                </div> -->
                                <!-- </div> -->
                            </div>
                            <button class="carousel-control-prev w-5 me-3" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next w-5 me-3" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-lg-7 mb-lg-0 mb-4">
                    <div class="glass ">
                        <div class="card-header pb-0 p-3">
                            <div class="d-flex justify-content-between">
                                <h6 class="mb-2">Exercise Process</h6>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table align-items-center ">
                                <tbody>
                                    <tr>
                                        <td class="w-30">
                                            <div class="d-flex px-2 py-1 align-items-center">
                                                <div>
                                                    <div class="ms-4">
                                                        <p class="text-xs font-weight-bold mb-0">Exercise:</p>
                                                        <h6 class="text-sm mb-0">Plank</h6>
                                                    </div>
                                                </div>
                                        </td>
                                        <td>
                                            <div class="text-center">
                                                <p class="text-xs font-weight-bold mb-0">Count:</p>
                                                <h6 class="text-sm mb-0">2500</h6>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="text-center">
                                                <p class="text-xs font-weight-bold mb-0">Steps:</p>
                                                <h6 class="text-sm mb-0">3</h6>
                                            </div>
                                        </td>
                                        <td class="align-middle text-sm">
                                            <div class="col text-center">
                                                <p class="text-xs font-weight-bold mb-0">Rate:</p>
                                                <h6 class="text-sm mb-0">29.9%</h6>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="w-30">
                                            <div class="d-flex px-2 py-1 align-items-center">
                                                <div>
                                                </div>
                                                <div class="ms-4">
                                                    <p class="text-xs font-weight-bold mb-0">Exercise:</p>
                                                    <h6 class="text-sm mb-0">Squats</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="text-center">
                                                <p class="text-xs font-weight-bold mb-0">Count:</p>
                                                <h6 class="text-sm mb-0">3.900</h6>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="text-center">
                                                <p class="text-xs font-weight-bold mb-0">Steps:</p>
                                                <h6 class="text-sm mb-0">5</h6>
                                            </div>
                                        </td>
                                        <td class="align-middle text-sm">
                                            <div class="col text-center">
                                                <p class="text-xs font-weight-bold mb-0">Rate:</p>
                                                <h6 class="text-sm mb-0">40.22%</h6>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="w-30">
                                            <div class="d-flex px-2 py-1 align-items-center">
                                                <div>
                                                </div>
                                                <div class="ms-4">
                                                    <p class="text-xs font-weight-bold mb-0">Exercise:</p>
                                                    <h6 class="text-sm mb-0">Lunges</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="text-center">
                                                <p class="text-xs font-weight-bold mb-0">Count:</p>
                                                <h6 class="text-sm mb-0">1.400</h6>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="text-center">
                                                <p class="text-xs font-weight-bold mb-0">Steps:</p>
                                                <h6 class="text-sm mb-0">2</h6>
                                            </div>
                                        </td>
                                        <td class="align-middle text-sm">
                                            <div class="col text-center">
                                                <p class="text-xs font-weight-bold mb-0">Rate:</p>
                                                <h6 class="text-sm mb-0">23.44%</h6>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="w-30">
                                            <div class="d-flex px-2 py-1 align-items-center">
                                                <div>
                                                </div>
                                                <div class="ms-4">
                                                    <p class="text-xs font-weight-bold mb-0">Exercise:</p>
                                                    <h6 class="text-sm mb-0">Burpees</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="text-center">
                                                <p class="text-xs font-weight-bold mb-0">Count:</p>
                                                <h6 class="text-sm mb-0">562</h6>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="text-center">
                                                <p class="text-xs font-weight-bold mb-0">Steps:</p>
                                                <h6 class="text-sm mb-0">1</h6>
                                            </div>
                                        </td>
                                        <td class="align-middle text-sm">
                                            <div class="col text-center">
                                                <p class="text-xs font-weight-bold mb-0">Rate:</p>
                                                <h6 class="text-sm mb-0">32.14%</h6>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="glass">
                        <div class="card-header pb-0 p-3">
                            <h6 class="mb-0">Advices</h6>
                        </div>
                        <div class="card-body p-3" style="">
                            <ul class="list-group">
                                <li class="glass p-2 border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                                    <div class="d-flex align-items-center">
                                        <div class="icon icon-shape icon-sm me-3 shadow text-center mx-2">
                                            <i class="ni ni-mobile-button text-dark opacity-10"></i>
                                        </div>
                                        <div class="d-flex flex-column">
                                            <h6 class="mb-1 text-dark text-sm">Nutrition</h6>
                                            <span class="text-xs"><span class="font-weight-bold"></span></span>
                                        </div>
                                    </div>
                                    <div class="d-flex">
                                        <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i class="ni ni-bold-right" aria-hidden="true"></i></button>
                                    </div>
                                </li>
                                <li class="glass p-2 border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                                    <div class="d-flex align-items-center">
                                        <div class="icon icon-shape icon-sm me-3 shadow text-center mx-2">
                                            <i class="ni ni-tag text-dark opacity-10"></i>
                                        </div>
                                        <div class="d-flex flex-column">
                                            <h6 class="mb-1 text-dark text-sm">Exercise</h6>
                                            <span class="text-xs"><span class="font-weight-bold"></span></span>
                                        </div>
                                    </div>
                                    <div class="d-flex">
                                        <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i class="ni ni-bold-right" aria-hidden="true"></i></button>
                                    </div>
                                </li>
                                <li class="glass p-2 border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                                    <div class="d-flex align-items-center">
                                        <div class="icon icon-shape icon-sm me-3 shadow text-center mx-2">
                                            <i class="ni ni-box-2 text-dark opacity-10"></i>
                                        </div>
                                        <div class="d-flex flex-column">
                                            <h6 class="mb-1 text-dark text-sm">Sleep</h6>
                                            <span class="text-xs"><span class="font-weight-bold"></span></span>
                                        </div>
                                    </div>
                                    <div class="d-flex">
                                        <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i class="ni ni-bold-right" aria-hidden="true"></i></button>
                                    </div>
                                </li>
                                <li class="glass p-2 border-0 d-flex justify-content-between ps-0 border-radius-lg">
                                    <div class="d-flex align-items-center">
                                        <div class="icon icon-shape icon-sm me-3 shadow text-center mx-2">
                                            <i class="ni ni-satisfied text-dark opacity-10"></i>
                                        </div>
                                        <div class="d-flex flex-column">
                                            <h6 class="mb-1 text-dark text-sm">Happiness</h6>
                                            <span class="text-xs font-weight-bold"></span>
                                        </div>
                                    </div>
                                    <div class="d-flex">
                                        <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i class="ni ni-bold-right" aria-hidden="true"></i></button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer pt-3  ">
                <div class="container-fluid">
                    <div class="row align-items-center justify-content-lg-between">
                        <div class="col-lg-6 mb-lg-0 mb-4">
                            <div class="copyright text-center text-sm text-muted text-lg-start">

                            </div>
                        </div>
                        <div class="col-lg-6">

                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </main>

    <!--   Core JS Files   -->
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>
    <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="../assets/js/plugins/chartjs.min.js"></script>
    <!-- <script>
      var ctx1 = document.getElementById("chart-line").getContext("2d");
  
      var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);
  
      gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
      gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
      gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
      function generateHeartRateData(length) {
    const heartRateData = [];
    
    for (let i = 0; i < length; i++) {
      const heartRate = Math.floor(Math.random() * (100 - 60 + 1)) + 60; // Simulated heart rate values between 60 and 100
      heartRateData.push(heartRate);
    }
    
    return heartRateData;
  }
  
  const data = [];
  const heartRateData = generateHeartRateData(500);
  data.push(..heartRateData);
  
  console.log(data);
  
      // new Chart(ctx1, {
        type: "line",
        data: {
          labels: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
           13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
           26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 
           38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 
           50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 
           62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 
          74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85,
           86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 
           98, 99, 100, 101, 102, 103, 104, 105, 106, 107,
          108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 
          118, 119, 120, 121, 122, 123, 124, 125, 126, 127,
           128, 129, 130, 131, 132, 133, 134, 135, 136, 137,
            138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 
          148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 
          158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 
          168, 169, 170,  171, 172, 173, 174, 175, 176, 177, 
          178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188,
          189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 
          199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 
          209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 
          219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610,
          611, 612, 613, 614, 615, 616, 617, 618, 619, 620,
          621, 622, 623, 624, 625, 626, 627, 628, 629, 630,
          631, 632, 633, 634, 635, 636, 637, 638, 639, 640,
          641, 642, 643, 644, 645, 646, 647, 648, 649, 650,
          651, 652, 653, 654, 655, 656, 657, 658, 659, 660,
          661, 662, 663, 664, 665, 666, 667, 668, 669, 670,
          671, 672, 673, 674, 675, 676, 677, 678, 679, 680,
          681, 682, 683, 707, 708, 709, 710, 711, 712, 713, 714, 715, 716, 717, 718, 719, 720, 721, 722, 723, 724, 725, 726, 727, 728, 729, 730, 731, 732, 733, 734, 735, 736, 737, 738, 739, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749, 750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, 765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784, 785, 786, 787, 788, 789, 790, 791, 792, 793, 794, 795, 796, 797, 798, 799, 800, 801, 802, 803, 804, 805, 806, 807, 808, 809, 810, 811, 812, 813, 814, 
          901, 902, 903, 904, 905, 906, 907, 908, 909, 910, 911, 912, 913, 914, 915, 916, 917, 918, 919, 920, 921, 922, 923, 924, 925, 926, 927, 928, 929, 930, 931, 932, 933, 934, 935, 936, 937, 938, 939, 940, 941, 942, 943, 944, 945, 946, 947, 948, 949, 950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 962, 963, 964, 965, 966, 967, 968, 969, 970, 971, 972, 973, 974, 975, 976, 977, 978, 979, 980, 981, 982, 983, 984, 985, 986, 987, 988, 989, 990, 991, 992, 993, 994, 995, 996, 997, 998, 999, 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020, 1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 1049, 1050, 1051, 1052, 1053, 1054, 1055, 1056, 1057, 1058, 1059, 1060, 1061, 1062, 1063, 1064, 1065, 1066, 1067, 1068, 1069, 1070, 1071, 1072, 1073, 1074, 1075, 1076, 1077, 1078, 1079, 1080, 1081, 1082, 1083, 1084, 1085, 1086, 1087, 1088, 1089, 1090,
          1091, 1092, 1093, 1094, 1095, 1096, 1097, 1098, 1099, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120, 1121, 1122, 1123, 1124, 1125, 1126, 1127, 1128, 1129, 1130, 1131, 1132, 1133, 1134, 1135, 1136, 1137, 1138, 1139, 1140, 1141, 1142, 1143, 1144, 1145, 1146, 1147, 1148, 1149, 1150, 1151, 1152, 1153, 1154, 1155, 1156, 1157, 1158, 1159, 1160, 1161, 1162, 1163, 1164, 1165, 1166, 1167, 1168, 1169, 1170, 1171, 1172, 1173, 1174, 1175, 1176, 1177, 1178, 1179, 1180, 1181, 1182, 1183, 1184, 1185, 1186, 1187, 1188, 1189, 1190, 1191, 1192, 1193, 1194, 1195, 1196, 1197, 1198, 1199, 1200, 1201, 1202, 1203, 1204, 1205, 1206, 1207, 1208, 1209, 1210, 1211, 1212, 1213, 1214, 1215, 1216, 1217, 1218, 1219, 1220, 1221, 1222, 1223, 1224, 1225, 1226, 1227, 1228, 1229, 1230, 1231, 1232, 1233, 1234, 1235, 1236, 1237, 1238, 1239, 1240, 1241, 1242, 1243, 1244, 1245, 1246, 1247, 1248, 1249, 1250, 1251, 1252, 1253, 1254, 1255, 1256, 1257, 1258, 1259, 1260, 1261, 1262, 1263, 
          1264, 1265, 1266, 1267, 1268, 1269, 1270, 1271, 1272, 1273, 1274, 1275, 1276, 1277, 1278, 1279, 1280, 1281, 1282, 1283, 1284, 1285, 1286, 1287, 1288, 1289, 1290, 1291, 1292, 1293, 1294, 1295, 1296, 1297, 1298, 1299, 1300, 1301, 1302, 1303, 1304, 1305, 1306, 1307, 1308, 1309, 1310, 1311, 1312, 1313, 1314, 1315, 1316, 1317, 1318, 1319, 1320, 1321, 1322, 1323, 1324, 1325, 1326, 1327, 1328, 1329, 1330, 1331, 1332, 1333, 1334, 1335, 1336, 1337, 1338, 1339, 1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348, 1349, 1350, 1351, 1352, 1353, 1354, 1355, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363, 1364, 1365, 1366, 1367, 1368, 1369],
          datasets: [{
            label: "BPM",
            tension: 0.1,
            borderWidth: 0,
            pointRadius: 0,
            borderColor: "#5e72e4",
            backgroundColor: gradientStroke1,
            borderWidth: 3,
            fill: true,
            data: [81, 83, 88, 98, 92, 85, 73, 71, 70, 83, 73, 79, 84, 78, 67, 71, 76, 77, 64, 53, 0, 41, 51, 3, 31, 37, 35, 48, 40, 42, 42, 32, 21, 41, 48, 47, 45, 42, 28, 15, 1, -12, -4, 15, 23, 22, 40, 46, 49, 48, 43, 52, 49, 44, 41, 41, 45, 57, 67, 65, 58, 47, 34, 35, 23, 11, 7, 14, 23, 18, 31, 35, 44, 49, 34, 7, -3, -8, -11, -20, -28, -4, 15, 20, 26, 26, 24, 34, 35, 30, 22, 12, 15, 18, 24, 18, 26, 25, 13, 2, 1, -10, -10, -4, 8, 15, 15, 15, 15, 18, 19, 3, -12, -14, -10, -22, -24, -29, -21, -19, -26, -9, -10, -6, -8, -31, -52, -57, -40, -20, 7, 14, 10, 6, 12, -5, -2, 9, 23, 36, 52, 61, 56, 48, 48, 38, 29, 33, 20, 1, -7, -9, -4, -12, -3, 5, -3, 12, 6, -10, -2, 15, 17, 21, 22, 15, 16, 1, -2, -9, -16, -18, -15, -4, 0, -1, -1, -3, -12, -15, -13, -16, -29, -34, -28, -29, -27, -25, -25, -33, -38, -36, -12, -7, -20, -21, -14, -7, 7, 14, 18, 28, 27, 38, 33, 24, 20, 15, 6, 0, -2, 2, 0, -2, -12, -10, 20, 41, 35, 27, 12, -1, -15, -20, -23, 0, 24, 36, 52, 61, 67, 73, 88, 85, 71, 74, 67, 41, 26, 13, 10, 1, -10, -26, -33, -23, -25, -24, -24, -28, -24, -25, -21, -8, -5, -4, -13, -29, -42, -52, -52, -40, -40, -34, -28, -30, -37, -40, -38, -41, -39, -46, -48, -48, -40, -40, -45, -57, -61, -63, -78, -81, -87, -82, -88, -100, -100, -97, -104, -102, -79, -72, -72, -63, -35,-22, -10, 2, 5, 9, -10, -16, -16, -10, -4, -1, 2, 14, 21, 23, 17, 13, 10, 0, -6, -5, 11, 22, 28, 31, 33, 29, 26, 27, 28, 26, 35, 44, 52, 80, 100, 101, 111, 120, 128, 150, 174, 201, 232, 278, 350, 422, 510, 580, 662, 738, 806, 869, 907, 939, 954, 971, 961, 912, 826, 713, 553, 382, 166, -56, -275, -518, -824, -1122, -1325, -1453, -1507, -1547, -1568, -1559, -1553, -1537, -1499, -1447, -1424, -1398, -1352, -1291, -1189, -1085, -977, -852, -736, -649, -603, -576, -454, -443, -332, -264, -209, -153, -105, -61, -16, 37, 96, 150, 198, 238, 265, 294, 324, 351, 367, 376, 378, 391, 406, 427, 433, 448, 440, 429, 429, 420, 413, 420, 411, 408, 404, 398, 401, 412, 389, 367, 357, 359, 351, 345, 341, 345, 346, 340, 334, 323, 319, 314, 284, 263, 261, 248, 234, 236, 236, 248, 252, 251, 237, 230, 238, 227, 207, 188, 163, 155, 152, 153, 156, 171, 162, 155, 148, 139, 154, 158, 155, 159, 147, 143, 133, 118, 118, 121, 130, 133, 133, 128, 120, 97, 91, 88, 85, 84, 74, 44, 32, 10, -2, -9, -4, -5, 1, 5, 21, 41, 44, 39, 24, 22, 37, 44, 35, 31, 35, 20, 15, 7, 4, 9, 0, -15, -21, -31, -32, -48, -53, -29, -14, -6, 1, 4, -4, -3, 2, 1, -12, -37, -29, -25, -18, -31, -42, -26, -22, -18, -25, -16, -13, -23, -15, 0, 8, 14, 34, 39, 33, 22, 18, 20, 23, 16, 11, 1, 6, 11, 7, 14, 22, 14, 14, 5, -6, -14, -27, -28, -21, -16, -8, -5, -8, 3, 22, 29, 27, 23, 22, 25, 34, 36, 39, 44, 55, 54, 44, 39, 41, 49, 44, 33, 27, 23, 20, 18, 20, 19, 8, 7, 2,4, -3, -16, -16, -19, -28, -37, -26, -14, -31,
    -45, -45, -43, -50, -59, -73, -79, -88, -92, -95,
    -101, -104, -124, -150, -152, -153, -174, -205, -215, -211,
    -214, -211, -222, -218, -211, -200, -200, -196, -184, -189,
    -202, -203, -202, -200, -205, -211, -226, -241, -242, -252,
    -273, -279, -288, -291, -289, -286, -269, -266, -280, -287,
    -277, -260, -271, -269, -271, -287, -299, -297, -288, -287,
    -287, -289, -287, -286, -276, -271, -266, -260, -252, -236,
    -223, -215, -213, -224, -230, -220, -209, -207, -194, -182,
    -181, -186, -189, -186, -174, -167, -161, -158, -155, -153,
    -139, -135, -130, -129, -116, -107, -98, -84, -85, -92, -100, -105, -97, -81, -72, -58, -49, -35, -33, -28, -13, -7, -9, -6, 10, 22, 16, 5, -12, -12, 1, 6, 17, 41, 52, 54, 57, 63, 81, 96, 107, 118, 133, 123, 121, 129, 128, 127, 112, 89, 0, 123, 42, 98, 109, 109, 108, 113, 121, 119, 119, 114, 112, 109, 107, 105, 114, 122, 130, 134, 121, 113, 100, 94, 114, 112, 108, 116, 114, 112, 118, 119, 116, 109, 110, 108, 113, 116, 118, 107, 103, 109, 110, 103, 106, 104, 93, 86, 77, 83, 87, 80, 95, 100, 88, 102, 87, 77, 88, 81, 71, 59, 61, 67,
    28, 26, 24, 23, 28, 26, 27, 23, 32, 30, 19, 16, 25, 32, 20, 12, 8, 7, 14, 14, 11, 15, 4, -5, -3, -3, -11, -2, 18, 11, -2, 1, -9, -21, -13, -16, -4, 15, 31, 55, 52, 35, 23, 24, 20, 19, 18, 13, 6, 7, 12, 12, 3, 2, -4, -11, -12, -9, -17, -6, 1, -2, -6, -18, -17, -14, -13, -11, 9, 9, 2, -2, -14, -27, -24, -16, -10, -3, 2, 7, 16, 29, 40, 47, 46, 30, 19, 20, 21, 22, 12, 0, -6, -6, -11, -9, -5, -9, -15, -18, -21, -19, -27, -31, -32, -35, -31, -26, -26, -19, -6, 0, -3, -16, -16, -3, 5, 13, 6, 9, 18, 40, 54, 64, 68, 57, 47, 41, 41, 50, 54, 35, 33, 33, 27, 26, 19, 16, 28, 44, 38, 42, 57, 61, 65, 55, 45, 33, 21, 11, 5, -14, -30, -35, -31, -32, -33, -25, -19, -18, -30, -42, -38, -44, -49, -43, -41, -30, -26, -29, -33, -53, -58, -58, -45, -37, -39, -51, -50, -52, -53, -36, -27, -29, -24, -27, -34, -46, -49, -42,
    -50, -49, -50, -42, -35, -24, -33, -40, -36, -37, -38, -51, -61, -67, -75, -81, -70, -66, -71, -72, -57, -48, -40, -31, 0, 31, -63, -16, -22, -30, -36, -37, -42, -40, -47, -38, -5, 2, -9, -2, 7, 11, 12, 22, 26, 29, 21, 25, 32, 35, 36, 48, 74, 79, 78, 92, 108, 120, 143, 172, 201, 232, 285, 363, 447, 514, 573, 663, 754, 815, 859, 895, 940, 977, 972, 945, 898, 808, 686, 532, 360, 167, -33, -232, -472, -766, -1082, -1295, -1438, -1509, -1567, -1594, -1583, -1569, -1547, -1504, -1457, -1432, -1403, -1335, -1249, -1157, -1058, -957, -835, -733, -650, -567, -508, -446, -378, -304, -240, -180, -123, -63, -11, 46, 112, 181, 221, 256, 283, 318, 348, 371, 397, 410, 409, 424, 440, 443, 429, 420, 424, 429, 415, 394, 391, 402, 410, 410, 408, 408, 405, 399, 392, 383, 376, 375, 368, 366, 363, 353, 345, 334, 326, 317, 313, 320, 318, 300, 275, 262, 252, 239, 236, 231, 236, 240, 235, 222, 220,
    223, 228, 222, 205, 197, 191, 180, 185, 174, 170, 166, 161, 151, 148, 142, 136, 131, 127, 118, 111, 114, 110, 97, 85, 72, 65, 61, 62, 64, 61, 59, 56, 64, 55, 56, 73, 63, 56, 54, 35, 12, -3, -2, -9, -15, -13, 1, 27, 48, 53, 55, 54, 27, 20, 14, 10, 3, 9, 21, 15, 9, 5, 0, 0, -1, 3, 4, 2, -4, -5, -12, -14, -20, -23, -21, -20, -28, -25, -25, -30, -34, -43, -39, -36, -44, -28, -22, -11, -12, -7, -14, -11, -13, -19, -19, -13, 4, 19, 16, 19, 21, 22, 5, -12, -27, -24
  ],
             maxBarThickness:2000, 
  
          }],
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          plugins: {
            legend: {
              display: false,
            }
          },
          interaction: {
            intersect: false,
            mode: 'index',
          },
          scales: {
            y: {
              grid: {
                drawBorder: false,
                display: true,
                drawOnChartArea: true,
                drawTicks: false,
                borderDash: [5, 5]
              },
              ticks: {
                display: true,
                padding: 10,
                color: '#fbfbfb',
                font: {
                  size: 11,
                  family: "Open Sans",
                  style: 'normal',
                  lineHeight: 1
                },
              }
            },
            x: {
              grid: {
                drawBorder: false,
                display: false,
                drawOnChartArea: false,
                drawTicks: false,
                borderDash: [5, 5]
              },
              ticks: {
                display: true,
                color: '#ccc',
                padding: 20,
                font: {
                  size: 11,
                  family: "Open Sans",
                  style: 'normal',
                  lineHeight: 2
                },
              }
            },
          },
        },
      });
    </script>
    <script>
      var win = navigator.platform.indexOf('Win') > -1;
      if (win && document.querySelector('#sidenav-scrollbar')) {
        var options = {
          damping: '0.5'
        }
        Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
      }
    </script> -->
    <!-- Github buttons -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="../assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>

</html>
