<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pushin@5/dist/pushin.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/pushin@5/dist/umd/pushin.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
        <link rel="stylesheet" href="css/animate.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link href="./css/register.css" rel="stylesheet">

    </head>

    <style>
        /*theme*/
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;1,200;1,300;1,400;1,500&display=swap');
        :root {
            --btn-color :#277e6f;
            --second-color:#2d6996;
        }
        body {

            font-family: 'poppins';
        }

        /*theme*/


        /*form*/
        .register-form {
            border-radius: 20px;
        }

        .register-form-inactive {
            display: none;
        }
        .register-form-active{
            display: block ;
        }
        /*form*/

        /*password and confirm password*/
        .pass {
            width: 48%;
            display: inline-block;
        }
        /*password and confirm password*/

        /*process*/
        .steps {
            margin-block: 10px;
            display: flex;
            justify-content: space-between;
            position: relative;
            counter-reset: step; /*create a count value variable named step*/

        }

        .steps::before, .step-transform {
            z-index: 1;
            content: "";
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            height: 4px;
            width: 100%;
            background-color: lightgray;
        }

        #step-transform {
            background-color: var(--btn-color);
            width: 0%;
        }

        .step {
            z-index: 2;
            width: 2.5em;
            height: 2.5em;
            border-radius: 50%;
            background-color: lightgray;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .step::before {
            counter-increment: step; /*increasing the value of step variable*/ /*the first value is 0*/
            content: counter(step); /*passing the value of variable step into content of the .step*/
        }

        .step-active {
            background-image: linear-gradient(to right, var(--tw-gradient-stops));
            --tw-gradient-from: #71d16c;
            --tw-gradient-to: rgba(113, 209, 108, 0);
            --tw-gradient-stops: var(--tw-gradient-from), var(--tw-gradient-to);
            --tw-gradient-to: #27d38e;
            --tw-text-opacity: 1;
            color: white;
        }
        /*process*/


        /*button*/
        .button-groups {
            display: flex;
            justify-content: space-between;
        }
        .button-groups button{
            border: none;
            font-weight: 600;
            width: 48%;
            background-image: linear-gradient(to right, var(--tw-gradient-stops));
            --tw-gradient-from: #71d16c;
            --tw-gradient-to: rgba(113, 209, 108, 0);
            --tw-gradient-stops: var(--tw-gradient-from), var(--tw-gradient-to);
            --tw-gradient-to: #27d38e;
            --tw-text-opacity: 1;
            color: #ffffff;

        }

        .button-groups button:hover {
            color: var(--btn-color);
        }




        /*button*/

        .logo-img {
            display: none;
        }

        .required-alert {
            color: rgb(188, 4, 4);
            font-size: 0.9em;
            visibility: hidden;
            margin-bottom: 0;
        }

        @media only screen and (max-width: 450px) {
            * {
                box-sizing: border-box;
            }

            html, body{
                padding: 0em !important;

            }

            .register-form {
                margin-left: 0;
                width: 70vw;
                padding: 13px;
                font-size: 1em;
            }

            input {
                font-size: 0.9em;
            }
            .logo-img {
                display: block;
            }

            .button-groups {
                display: block;
            }

            .button-groups button{
                margin-block: 3px;
                font-size: 0.9em;
                width: 100%;
            }

            .step {
                width: 2em;
                height: 2em;
            }
        }


    </style>
    <body>

        <!-- another one -->
        <section class="vh-120 " style=" background: url(./asset/background_blur.png);
                 background-repeat: no-repeat;
                 background-attachment: fixed;
                 background-size: cover;">

            <div class="grainy-gradient-intro container py-5 h-100 " >
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10" style="">
                        <div class="card" style="border-radius: 1rem 1rem 1rem 1rem;">
                            <div class="row g-0 " style="border-radius: 1rem 0 0 1rem;">
                                <div class="col-md-6 col-lg-7">
                                    <div class="grainy-gradient-intro  card-body p-4  p-lg-3 text-black" style=" background: url(./asset/background_blur.png);
                                         background-repeat: no-repeat;
                                         background-attachment: fixed;
                                         background-size: 100% 100%">
                                        <svg height="0" width="0">
                                        <filter id='f'>
                                            <feTurbulence type='fractalNoise' baseFrequency='.5' />
                                        </filter>
                                        </svg>
                                        <div class="d-flex align-items-center mb-1 pb-1" >
                                            <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;" ></i>
                                     <a href="home.jsp" style="margin:0 auto;"> <img style="margin: 0 auto;" src="./asset/healthier (1) (1).png" alt=""></a>
                                        </div>

                                        <div class="register-form"
                                             style=" margin: 0 auto; width:100%; background-color: transparent;">
                                            <h1 class="text-center">REGISTER</h1>
                                            <div class="text-center">Welcome back!</div>
                                            <p class="mb-3 pb-lg-2 text-center" style="color: #393f81; margin: 0 auto;">Already have an account? <a href="login.jsp"
                                                                                                                                                    style="color: #393f81;">Login here</a></p>
                                            <div class="steps">
                                                <div class="step-transform" id="step-transform"></div>
                                                <div class="step step-active"></div>
                                                <div class="step"></div>
                                                <div class="step"></div>
                                            </div>
                                            <div class="register-form-container">
                                                <form action="register" method="Post">
                                                    <div
                                                        class="register-form-inactive register-form-active register-form-piece">
                                                        <p>Digital Information</p>
                                                        <div class="mb-0">
                                                            <label for="input-value-1" class="form-label">Email
                                                                address</label>
                                                            <input type="email" name="email" class="form-control"
                                                                   id="input-value-1" aria-describedby="emailHelp" value=""
                                                                   required>
                                                            <p class="required-alert">You have to fill this field!</p>
                                                        </div>
                                                        <div style="display: flex;justify-content: space-between;">
                                                            <div class="mb-0 pass">
                                                                <label for="input-value-2" class="form-label">Password</label>
                                                                <input type="password" class="form-control" id="input-value-2" name="password">
                                                            </div>    
                                                            <div class="mb-0 pass">   
                                                                <label for="input-value-2.5" class="form-label"> Confirm Password</label>
                                                                <input type="password" class="form-control" id="input-value-2.5" name="password">
                                                            </div>
                                                        </div>
                                                        <div class="button-groups">
                                                            <div style="width: 50%; background-color: transparent;"></div>
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
                                                            <input type="date" class="form-control " id="input-value-4"
                                                                   required name="dob">
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
                                                        <p>Account Information</p>
                                                        <div class="mb-3">
                                                            <label for="input-value-7" class="form-label">Weight</label>
                                                            <input type="number" class="form-control" id="input-value-7"
                                                                   aria-describedby="emailHelp" required placeholder="kg" name="weight">
                                                            <p class="required-alert">You have to fill this field!</p>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="input-value-8" class="form-label">Height</label>
                                                            <input type="number" class="form-control" id="input-value-8"
                                                                   required placeholder="cm" name="height">
                                                            <p class="required-alert">You have to fill this field!</p>

                                                        </div>


                                                        <div class="button-groups">
                                                            <button type="button"
                                                                    class="btn btn-primary previous-btn">Previous</button>
                                                            <button type="submit" class="btn btn-primary">Submit</button>
                                                        </div>
                                                    </div>

                                                    <%
                                                        String successMessage = request.getParameter("successMessage");
                                                        if (successMessage != null && !successMessage.isEmpty()) {
                                                    %>
                                                    <div style="margin-top:2em;" class="alert alert-success"><%= successMessage%></div>
                                                    <%
                                                        }
                                                    %>
                                                    <%
                                                        String errorMessage = request.getParameter("errorMessage");
                                                        if (errorMessage != null && !errorMessage.isEmpty()) {
                                                    %>
                                                    <div style="margin-top:2em;" class="alert alert-danger"><%= errorMessage%></div>
                                                    <%
                                                        }
                                                    %>
                                                </form>
                                            </div>

                                        </div>

                                    </div>
                                    <%-- Check if there is a success message --%>

                                </div>
                                <div class="col-md-6 col-lg-5 d-none d-md-block" style="margin: 0; padding: 0;">
                                     <img src="./asset/pexels-pixabay-255469.jpg "
                                         alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; object-fit: cover; height: 100%;" />
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

</html