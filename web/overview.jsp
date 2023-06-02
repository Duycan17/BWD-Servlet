<%-- 
    Document   : overview
    Created on : Jun 1, 2023, 2:08:21 PM
    Author     : duy
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css"
              integrity="sha512-oHDEc8Xed4hiW6CxD7qjbnI+B07vDdX7hEPTvn9pSZO1bcRqHp8mj9pyr+8RVC2GmtEfI2Bi9Ke9Ass0as+zpg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pushin@5/dist/pushin.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/pushin@5/dist/umd/pushin.min.js"></script>

        <script src="https://kit.fontawesome.com/03200e350d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <script src="https://kit.fontawesome.com/03200e350d.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/overview.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
        <title>Overview</title>
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;1,200;1,300;1,400;1,500&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;1,400;1,500&family=Poppins:wght@200&family=Spectral:wght@400;500&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Pangolin&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600&display=swap');
        body{
            font-family:'poppins';
        }
        .body-mass-index{
            background: url("./asset/background_sleep.jpg");
            -webkit-backdrop-filter: sepia(100%);
            backdrop-filter: sepia(100%);
        }
        .nav-link{
            font-size: 2.7vh;
        }
    </style>

    <body>
        <% if (session != null && session.getAttribute("email") != null) {%>  
        <% } else { %>   
        <% response.sendRedirect("login.jsp"); %>  
        <%
            }%>
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
        <!-- dashboard -->
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

        %>
        <div class="container" style="margin-top:6em">
            <div class="dashboard-section">
                <div class="left-block">
                    <div class="welcome-title">
                        Hi, <span style="color: #65D171;"><%= userName%></span><br>
                        Check your <br>
                        Health!
                    </div>

                    <div class="step-section glass">
                        <div class="step-left flex-center">
                            <h2 class="step-index">
                                0
                            </h2>
                            <p>Steps</p>
                            <p style="font-weight: bold;margin: 0;">Foot step</p>
                        </div>
                        <div class="step-right flex-center">
                            <i class="fa-solid fa-shoe-prints fa-rotate-270" style="font-size: 4rem; color: green;padding-bottom: 12px;"></i>
                            <div class="step-percent">
                            </div>
                        </div>
                    </div>

                    <div class="water-section glass">
                        <div class="water-left flex-center">
                            <h2 class="water-index">
                                <%=bmiStr%>
                            </h2>
                            <p style="font-weight: bold;margin: 0;">BMI</p>
                        </div>
                        <div class="water-right flex-center">
                            <i class="fa-solid fa-address-book" style="color: #dd8dcc; font-size: 4rem;padding-bottom: 12px;"></i>
                        </div>
                    </div>

                    <div class="sleep-section glass">
                        <div class="sleep-left flex-center">
                            <h2 class="sleep-index">
                                0
                            </h2>
                            <p  style="font-weight: bold;margin: 0;">Sleep</p>
                        </div>
                        <div class="sleep-right flex-center">
                            <i class="fa-light fa-bed-front"  style="font-size: 4rem;padding-bottom: 12px;"></i>
                        </div>
                    </div>


                    <div class="slider">
                        <div id="carouselExampleFade" class="carousel slide carousel-fade">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="./asset/exercise_img.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="./asset/backgroundimg.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="./asset/4920290.jpg" class="d-block w-100" alt="...">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="right-block">
                    <div class="body-mass-index glass">
                        <div class="body-header">
                            <h2>Body Mass Index</h2>
                        </div>
                        <div class="body-index">
                            <div class="height-index">
                                <i class="fa-sharp fa-solid fa-caret-up fa-rotate-180" style="color: #3c6fc8;"></i>
                                <div class="index">
                                    <%= weight%>
                                </div>
                                <div class="unnit" style="font-weight: bold;margin-bottom: 8px;">
                                    Kg
                                </div>
                            </div>
                            <div class="weight-index">
                                <i class="fa-sharp fa-solid fa-caret-up fa-rotate-180" style="color: #3c6fc8;"></i>
                                <div class="index">
                                    <%= height%>
                                </div>
                                <div class="unnit" style="font-weight: bold;margin-bottom: 8px;">
                                    Cm
                                </div>
                            </div>

                        </div>
                        <div class="body-detail">
                            <h2 style="color: #EF4444;"><%=statusBMI%></h2>
                        </div>
                    </div>

                    <div class="right-video glass" style="width: 474; height:150">
                        <div class="video-detail" style="width:100%; height:100%;">
                            <iframe width="100%" height="100%" src="https://www.youtube.com/embed/hmFQqjMF_f0" title="How playing sports benefits your body ... and your brain - Leah Lagos and Jaspal Ricky Singh" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!-- script -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../js/overview.js" />
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