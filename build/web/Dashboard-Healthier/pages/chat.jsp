<!--
=========================================================
* Argon Dashboard 2 - v2.0.4
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2022 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<%-- 
    Document   : home
    Created on : May 30, 2023, 10:24:56 PM
    Author     : duy
--%>

<%@page import="Controller.MiBand4Automation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
  <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
  <title>Healthier</title>
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
  <link rel="stylesheet" href="../assets/css/chat.css">
</head>
<style>
  body{
    background: url("../assets/background_blur.png");
  	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
  }
</style>
<body class="g-sidenav-show bg-gray-100">
  <div class="min-height-300 bg-primary position-absolute w-100"></div>
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4"
  id="sidenav-main">
  <div class="sidenav-header">
    <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
      aria-hidden="true" id="iconSidenav"></i>
    <a class="navbar-brand m-0" href="#" target="_blank">
      <img src="../assets/healthier (1) (1).png" alt="" style="border-radius: 0 !important" />
    </a>
  </div>
  <hr class="horizontal dark mt-0" />
  <div class="collapse navbar-collapse w-auto" id="sidenav-collapse-main">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="../pages/dashboard.jsp">
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
        <a class="nav-link active" href="../pages/chat.jsp" style="
        --tw-text-opacity: 1;
        color: rgb(113 209 108 / var(--tw-text-opacity));
      " href="../pages/exercise.jsp">
          <div style=""
            class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            <i class="ni ni-chat-round text-success text-sm opacity-10"></i>
          </div>
          <span class="nav-link-text ms-1">Support</span>
        </a>
      </li>
      <!-- -->
      <li class="nav-item">
        <a class="nav-link" href="../pages/exercise.jsp" >
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

    <a class="btn btn-primary btn-sm mb-0 w-100" style="display: none;"
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
  <!-- navbar -->

  <main class="main-content position-relative border-radius-lg" style="height: 96vh;">
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur" data-scroll="false">
      <div class="container-fluid py-1 px-3">
     
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center" style="width: 100%;">
            <div style="display: flex; align-items: center; margin: 0 auto">
              <img style="margin-right: 10px;" alt="MrBiology" loading="lazy" width="40" height="40" decoding="async" data-nimg="1" class="BotImage_botImage__Awqvh" srcset="https://qph.fs.quoracdn.net/main-thumb-pb-1020602-200-exvynohckhvkvraqumizdwxnphsyujsd.jpeg 1x, https://qph.fs.quoracdn.net/main-thumb-pb-1020602-200-exvynohckhvkvraqumizdwxnphsyujsd.jpeg 2x" src="https://qph.fs.quoracdn.net/main-thumb-pb-1020602-200-exvynohckhvkvraqumizdwxnphsyujsd.jpeg" style="color: transparent;">
              <h5 style="margin: 0;">TPAMD</h5>
            </div>
          </div>
          <ul class="navbar-nav  justify-content-end" >
            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line bg-white" style="color: #000000;"></i>
                  <i class="sidenav-toggler-line bg-white" style="color: #000000;"></i>
                  <i class="sidenav-toggler-line bg-white" style="color: #000000;"></i>
                </div>
              </a>
            </li>
            <style>
              @media (max-width: 767.98px) {
  .navbar-collapse { position: relative; }
  .navbar-collapse .navbar-nav { width: auto !important; }
              }
            </style>
       
          </ul>
        </div>
      </div>
    </nav>
    <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.0/css/all.css">
      <div class="msg-panel">
      
      </div>
      <div class="dock">
        <button id="clear"><i class="fa-light fa-broom-wide"></i></button>
        <input type="text" placeholder="Send a message..." id="inputC"></input>
        <button id="submit" disabled><i class="fa-light fa-paper-plane-top"></i></button>
      </div>
  </main>

  <!--   Core JS Files   -->
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
  <!-- Load the axios library from a CDN -->
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script src="../assets/js/chat.js"></script>

  <!-- <script>
    const form = document.getElementById("chat-form");
    const input = document.getElementById("chat-input");
    const messagesHtml = document.getElementById("chat-messages");

   
  </script> -->
  <script>
    var win = navigator.platform.indexOf("Win") > -1;
    if (win && document.querySelector("#sidenav-scrollbar")) {
      var options = {
        damping: "0.5",
      };
      Scrollbar.init(document.querySelector("#sidenav-scrollbar"), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>

</html>