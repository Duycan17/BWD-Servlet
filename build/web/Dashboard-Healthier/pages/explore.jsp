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
<%-- Document : home Created on : May 30, 2023, 10:24:56 PM Author : duy --%>
<%@page import="Controller.MiBand4Automation"%> <%@page contentType="text/html"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link
      rel="apple-touch-icon"
      sizes="76x76"
      href="../assets/img/apple-icon.png"
    />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <title>Healthier</title>
    <!--     Fonts and icons     -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
      rel="stylesheet"
    />
    <!-- Nucleo Icons -->
    <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
    <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <script
      src="https://kit.fontawesome.com/42d5adcbca.js"
      crossorigin="anonymous"
    ></script>
    <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
    <!-- OWL CSS  -->
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="../assets/css/owl.theme.default.min.css" />

    <!-- CSS Files -->
    <link
      id="pagestyle"
      href="../assets/css/argon-dashboard.css?v=2.0.4"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="../assets/css/explore.css" />
  </head>
  <style>
    body {
      background: url("../assets/background_blur.png");
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: 100% 100%;
    }
  </style>

  <body class="g-sidenav-show bg-gray-100">
    <div class="min-height-300 bg-primary position-absolute w-100"></div>
    <aside
      class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4"
      id="sidenav-main"
    >
      <div class="sidenav-header">
        <i
          class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
          aria-hidden="true"
          id="iconSidenav"
        ></i>
        <a class="navbar-brand m-0" href="#" target="_blank">
          <img
            src="../assets/healthier (1) (1).png"
            alt=""
            style="border-radius: 0 !important"
          />
        </a>
      </div>
      <hr class="horizontal dark mt-0" />
      <div class="collapse navbar-collapse w-auto" id="sidenav-collapse-main">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="../pages/dashboard.jsp">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a
              class="nav-link active"
              style="
                --tw-text-opacity: 1;
                color: rgb(113 209 108 / var(--tw-text-opacity));
              "
              href="../pages/exercise.jsp"
              href="../pages/explore.jsp"
            >
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i class="ni ni-world text-warning text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Explore</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../pages/chat.jsp">
              <div
                style=""
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i class="ni ni-chat-round text-success text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Support</span>
            </a>
          </li>
          <!-- -->
          <li class="nav-item">
            <a class="nav-link" href="../pages/exercise.jsp">
              <div
                style=""
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i class="ni ni-user-run text-success text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Exericse</span>
            </a>
          </li>
          <li class="nav-item mt-3">
            <h6
              class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6"
            >
              Account pages
            </h6>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../pages/profile.jsp">
              <div
                class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
              >
                <i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
              </div>
              <span class="nav-link-text ms-1">Profile</span>
            </a>
          </li>
        </ul>
      </div>
      <div class="sidenav-footer mx-3">
        <div
          class="card card-plain shadow-none"
          id="sidenavCard"
          style="opacity: 0"
        >
          <img
            class="w-50 mx-auto"
            src="../assets/img/illustrations/icon-documentation.svg"
            alt="sidebar_illustration"
          />
          <div class="card-body text-center p-3 w-100 pt-0">
            <div class="docs-info">
              <h6 class="mb-0">Need help?</h6>
              <p class="text-xs font-weight-bold mb-0">Please check our docs</p>
            </div>
          </div>
        </div>

        <a
          class="btn btn-primary btn-sm mb-0 w-100"
          style="display: none"
          href="https://www.creative-tim.com/product/argon-dashboard-pro?ref=sidebarfree"
          type="button"
          style="
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
          "
          >Upgrade to pro</a
        >
      </div>
    </aside>
    <main class="main-content position-relative border-radius-lg">
      <!-- Navbar -->
      <!-- <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur"
      data-scroll="false">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="javascript:;">Pages</a></li>
            <li class="breadcrumb-item text-sm text-white active" aria-current="page">Tables</li>
          </ol>
          <h6 class="font-weight-bolder text-white mb-0">Tables</h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            <div class="input-group">
              <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
              <input type="text" class="form-control" placeholder="Type here...">
            </div>
          </div>
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">Sign In</span>
              </a>
            </li>
            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line bg-white"></i>
                  <i class="sidenav-toggler-line bg-white"></i>
                  <i class="sidenav-toggler-line bg-white"></i>
                </div>
              </a>
            </li>
            <li class="nav-item px-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0">
                <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
              </a>
            </li>
            <li class="nav-item dropdown pe-2 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0" id="dropdownMenuButton" data-bs-toggle="dropdown"
                aria-expanded="false">
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
                        <img src="../assets/img/small-logos/logo-spotify.svg"
                          class="avatar avatar-sm bg-gradient-dark  me-3 ">
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
                        <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1"
                          xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                          <title>credit-card</title>
                          <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                            <g transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF" fill-rule="nonzero">
                              <g transform="translate(1716.000000, 291.000000)">
                                <g transform="translate(453.000000, 454.000000)">
                                  <path class="color-background"
                                    d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z"
                                    opacity="0.593633743"></path>
                                  <path class="color-background"
                                    d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z">
                                  </path>
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
    </nav> -->
      <!-- End Navbar -->

      <div class="container-fluid py-4">
        <!-- carousel -->
        <section class="carousell" style="height: 50vh">
          <div class="heart_content" style="">
            <div class="owl-carousel owl-theme" style="height: 100%">
              <div class="itemm" style="height: auto">
                <div class="carousel_content_left">
                  <h3>Heart</h3>
                  <p class="slogan">
                    <i class="fa fa-quote-left"></i> Healthy heart, healthy
                    life. <i class="fa fa-quote-right"></i>
                  </p>
                  <p class="detail">
                    A healthy heart can help you live a longer, happier life.
                    Prioritize regular exercise, a balanced diet, and stress
                    management to keep your heart in top shape.
                  </p>
                  <button
                    type="button"
                    class="btn btn-outline-success"
                    data-toggle="modal"
                    data-target="#exampleModal"
                    style="margin-top: 7px"
                  >
                    Learn more
                  </button>
                </div>
                <div class="carousel_img_right">
                  <img src="../assets/img/heart.png" alt="" class="heart_img" />
                </div>
              </div>
              <div class="itemm">
                <div class="carousel_content_left">
                  <h3>Liver</h3>
                  <p class="slogan">
                    <i class="fa fa-quote-left"></i> Healthy liver, healthy
                    life. <i class="fa fa-quote-right"></i>
                  </p>
                  <p class="detail">
                    Your liver plays a critical role in keeping your body
                    healthy. To maintain a healthy liver, limit alcohol
                    consumption, maintain a healthy weight.
                  </p>
                  <button
                    type="button"
                    class="btn btn-outline-success"
                    data-toggle="modal"
                    data-target="#exampleModal"
                    style="margin-top: 7px"
                  >
                    Learn more
                  </button>
                </div>
                <div class="carousel_img_right">
                  <img src="../assets/img/liver.png" alt="" class="liver_img" />
                </div>
              </div>
              <div class="itemm">
                <div class="carousel_content_left">
                  <h3>Lungs</h3>
                  <p class="slogan">
                    <i class="fa fa-quote-left"></i> Keep your lungs healthy for
                    a better life. <i class="fa fa-quote-right"></i>
                  </p>
                  <p class="detail">
                    Your lungs play a critical role in your health. To maintain
                    healthy lungs, avoid exposure to air pollution and
                    respiratory irritants, and practice good respiratory
                    hygiene.
                  </p>
                  <button
                    type="button"
                    class="btn btn-outline-success"
                    data-toggle="modal"
                    data-target="#exampleModal"
                    style="margin-top: 7px"
                  >
                    Learn more
                  </button>
                </div>
                <div class="carousel_img_right">
                  <img src="../assets/img/lung.png" alt="" class="lung" />
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- CATEGORIES -->
        <h3 style="margin-top: 1em">Facts</h3>
        <section class="categories" style="padding: 0">
          <div class="categories__content">
            <div class="row">
              <div class="col-sm-4">
                <div class="categories__items">
                  <i class="fa fa-lungs"></i>
                  <div class="content">
                    <p>Lungs</p>
                    <p class="num">300 million Air sacs</p>
                  </div>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="categories__items">
                  <i class="fa fa-heart"></i>
                  <div class="content">
                    <p>Heart</p>
                    <p class="num">100,000 Muscle fibers</p>
                  </div>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="categories__items">
                  <i class="fa-solid fa-table"></i>
                  <div class="content">
                    <p>Liver</p>
                    <p class="num">2,000 g Weight</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <div class="tit" style="display: flex">
          <div class="chu" style="width: 75%">
            <h3>Something new</h3>
          </div>
          <div class="find" style="width: 20%">
            <div class="input-group">
              <span class="input-group-text text-body"
                ><i class="fas fa-search" aria-hidden="true"></i
              ></span>
              <input type="text" class="form-control" placeholder="Search" />
            </div>
          </div>
        </div>

        <section class="news">
          <div class="row">
            <a class="card1 col-sm-12 col-md-12 col-lg-6" href="#">
              <div class="card_left">
                <img src="../assets/img/coffee.png" alt="" />
              </div>
              <div class="card_right">
                <p>How to Stay Healthy During the Winter..</p>
                <p class="small">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Dolorem deserunt dignissimos repellat.
                </p>
                https://www.healthline.com/health/winter-health-tips
              </div>
            </a>
            <a class="card1 col-sm-12 col-md-12 col-lg-6" href="#">
              <div class="card_left">
                <img src="../assets/img/coffee.png" alt="" />
              </div>
              <div class="card_right">
                <p>The Health Benefits of Yoga and How to...</p>
                <p class="small">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Dolorem deserunt dignissimos repellat.
                </p>
                https://www.healthline.com/health/winter-health-tips
              </div>
            </a>
            <a class="card1 col-sm-12 col-md-12 col-lg-6" href="#">
              <div class="card_left">
                <img src="../assets/img/coffee.png" alt="" />
              </div>
              <div class="card_right">
                <p>Why Mindfulness Is Good for Your Brain</p>
                <p class="small">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Dolorem deserunt dignissimos repellat.
                </p>
                https://www.healthline.com/health/winter-health-tips
              </div>
            </a>
            <a class="card1 col-sm-12 col-md-12 col-lg-6" href="#">
              <div class="card_left">
                <img src="../assets/img/coffee.png" alt="" />
              </div>
              <div class="card_right">
                <p>The Benefits of a Mediterranean Diet</p>
                <p class="small">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Dolorem deserunt dignissimos repellat.
                </p>
                https://www.healthline.com/health/winter-health-tips
              </div>
            </a>
          </div>

          <a href="#" id="loadMore" class="loadmore">Load More</a>
        </section>
      </div>
    </main>
    <style>
      .modal-dialog {
        max-width: 90%;
        margin: 1.75rem auto;
        z-index: 2000;
        height: 90vh;
      }
      .modal {
        z-index: 99999999; /* Increase the z-index value for the modal */
        height: 100%;
      }

      .modal-backdrop {
        z-index: 1900; /* Increase the z-index value for the modal backdrop */
      }
      iframe {
        overflow: hidden;
      }
    </style>
    <!-- Modal -->
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Anatomic 3D</h5>
          </div>
          <div class="modal-body">
            <!-- Content of the popup goes here -->
            <iframe
              style="width: 100%; height: 60vh"
              src="../Body-Browser--A-3D-model-of-Human-Body/index.html"
              frameborder="0"
            ></iframe>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-dismiss="modal"
            >
              Close
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- Add the Bootstrap JavaScript file -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!--   Core JS Files   -->
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>
    <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
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

    <!-- Thư viện hỗ trợ Jquery giúp chạy hiệu ứng của các thư viện animation -->
    <script
      src="https://code.jquery.com/jquery-3.5.1.min.js"
      integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
      crossorigin="anonymous"
    ></script>

    <!-- owl js  -->
    <script src="../assets/js/owl.carousel.min.js"></script>
    <script>
      $(".owl-carousel").owlCarousel({
        loop: true,
        autoplay: true,
        autoplayTimeout: 4500,
        nav: false,

        responsive: {
          0: {
            items: 1,
          },
        },
      });
    </script>
    <!-- loadmore js  -->
    <script>
      $(document).ready(function () {
        $(".content_loadmore").slice(0, 4).show();
        $("#loadMore").on("click", function (e) {
          e.preventDefault();
          $(".content_loadmore:hidden").slice(0, 4).slideDown();
        });
      });
    </script>
  </body>
</html>
