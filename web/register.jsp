<%-- 
    Document   : register
    Created on : May 30, 2023, 10:45:24 PM
    Author     : duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pushin@5/dist/pushin.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/pushin@5/dist/umd/pushin.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
        <link rel="stylesheet" href="css/animate.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link href="./css/register.css" rel="stylesheet">
    </head>

    <body>

        <!-- another one -->
        <section class="vh-120 " style=" background: url(./asset/background_blur.png);
                 background-repeat: no-repeat;
                 background-attachment: fixed;
                 background-size: cover;">

            <div class="grainy-gradient-intro container py-5 h-100 ">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem 1rem 1rem 1rem;">
                            <div class="row g-0 " style="border-radius: 1rem 0 0 1rem;">
                                <div class="col-md-6 col-lg-7 d-flex">
                                    <div class="grainy-gradient-intro  card-body p-4 p-lg-5 text-black" style=" background: url(./asset/background_blur.png);
                                         background-repeat: no-repeat;
                                         background-attachment: fixed;
                                         background-size: 100% 100%">
                                        <svg height="0" width="0">
                                        <filter id='f'>
                                            <feTurbulence type='fractalNoise' baseFrequency='.5' />
                                        </filter>
                                        </svg>
                                        <div class="d-flex align-items-center mb-3 pb-1" >
                                            <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;" ></i>
                                            <span class="h1 fw-bold mb-0"><img class="logo-img" src="./asset/logo.png" alt=""></span>
                                        </div>

                                        <div class="register-form"
                                             style=" max-width: 385px; margin: 0 auto;">
                                            <h1 class="text-center">REGISTER</h1>
                                            <div class="text-center">Welcome back!</div>
                                            <p class="mb-3 pb-lg-2" style="color: #393f81;">Already have an account? <a href="login.jsp"
                                                                                                                        style="color: #393f81;">Login here</a></p>
                                            <div class="steps">
                                                <div class="step-transform" id="step-transform"></div>
                                                <div class="step step-active"></div>
                                                <div class="step"></div>
                                                <div class="step"></div>
                                                <div class="step"></div>
                                            </div>
                                            <form class="register-form-container" action="register" method="POST">
                                                <div
                                                    class="register-form-inactive register-form-active register-form-piece">
                                                    <p>Digital Information</p>
                                                    <div class="mb-3">
                                                        <label for="input-value-1" class="form-label">Email
                                                            address</label>
                                                        <input type="email" name="email" class="form-control"
                                                               id="input-value-1" aria-describedby="emailHelp" value=""
                                                               required>
                                                        <p class="required-alert">You have to fill this field!</p>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="input-value-2" class="form-label">Password</label>
                                                        <input type="password" class="form-control" id="input-value-2" name="password">
                                                        <p class="required-alert">You have to fill this field!</p>

                                                    </div>
                                                    <div class="button-groups">
                                                        <div style="width: 50%; background-color: white;"></div>
                                                        <button type="button"
                                                                class="btn btn-primary next-btn">Next</button>
                                                    </div>
                                                </div>

                                                <div class="register-form-inactive">
                                                    <p>Personal Information</p>
                                                    <div class="mb-3">
                                                        <label for="input-value-3" class="form-label">Name</label>
                                                        <input type="text" name="name" class="form-control"
                                                               id="input-value-3" aria-describedby="emailHelp" required>
                                                        <p class="required-alert">You have to fill this field!</p>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="input-value-4" class="form-label">D.O.B</label>
                                                        <input type="date" class="form-control" id="input-value-4" name="dob" required>
                                                        <p class="required-alert">You have to fill this field!</p>
                                                    </div>
                                                    <div class="button-groups">
                                                        <button type="button"
                                                                class="btn btn-primary previous-btn">Previous</button>
                                                        <button type="button"
                                                                class="btn btn-primary next-btn">Next</button>
                                                    </div>
                                                </div>

                                                <div class="register-form-inactive">
                                                    <p>Health Information</p>

                                                    <div class="mb-3">
                                                        <label for="input-value-5" class="form-label">Weight</label>
                                                        <input type="number" class="form-control " id="input-value-5"
                                                               aria-describedby="emailHelp" required name="weight">
                                                        <p class="required-alert">You have to fill this field!</p>

                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="input-value-6" class="form-label">Height</label>
                                                        <input type="number" class="form-control" id="input-value-6"
                                                               required name="height">
                                                        <p class="required-alert">You have to fill this field!</p>

                                                    </div>
                                                    <div class="button-groups">
                                                        <button type="button"
                                                                class="btn btn-primary previous-btn">Previous</button>
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </div>
                                                </div>
                                            </form>

                                        </div>

                                    </div>

                                </div>
                                <div class="col-md-6 col-lg-5 d-none d-md-block" style="margin: 0; padding: 0;">
                                    <video src="./asset/video_register.mp4" alt="register form" class="img-fluid"
                                           style="border-radius: 0 1rem 1rem 0; width: 100%; height: 100%; margin: 0;" autoplay loop>
                                    </video>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="./js/register.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </body>

</html>