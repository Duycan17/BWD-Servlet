<%-- 
    Document   : login
    Created on : May 30, 2023, 10:36:33 PM
    Author     : duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
        <title>Login</title>
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;1,200;1,300;1,400;1,500&display=swap');
        *{
            font-family: 'poppins' ;

        }


        #errorpass, #erroremail{
            color: red;
        }
        .grainy-gradient-intro:before {
            /* background: #c3ccea;
            filter: url(#f); */

        }
        .grainy-gradient-intro:after
        {
            position: fixed;
            inset: 0;
            z-index: -1;
            /* --grad: radial-gradient(at 50%, red, rgba(255, 0, 0, 0.3) 55%, transparent 70%); */
            --mask: var(--grad), var(--grad);
            -webkit-mask: var(--mask);
            -webkit-mask-composite: source-in;
            -webkit-mask: var(--mask);
            mask: var(--mask);
            -webkit-mask-composite: source-in, xor;
            mask-composite: intersect;
            mix-blend-mode: unset;
            content: "";
        }
        .grainy-gradient-intro:before {
            position: fixed;
            inset: 0;
            z-index: -1;
            /* --grad: radial-gradient(at 50%, red, rgba(255, 0, 0, 0.3) 55%, transparent 70%); */
            --mask: var(--grad), var(--grad);
            -webkit-mask: var(--mask);
            -webkit-mask-composite: source-in;
            -webkit-mask: var(--mask);
            mask: var(--mask);
            -webkit-mask-composite: source-in, xor;
            mask-composite: intersect;
            mix-blend-mode: unset;
            content: "";
        }

        .grainy-gradient-intro:after {
            /* background: linear-gradient(
         90deg, #469de0 40%, #25a08c, #37a996,#56aeec ); */ background: url(./asset/background_blur.png);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
        }

        .btn-gradient{
            border: none;
            background-image: linear-gradient(to right, var(--tw-gradient-stops));
            --tw-gradient-from: #71d16c;
            --tw-gradient-to: rgba(113, 209, 108, 0);
            --tw-gradient-stops: var(--tw-gradient-from), var(--tw-gradient-to);
            --tw-gradient-to: #27d38e;
            --tw-text-opacity: 1;
            color: #ffffff;
        }

        .signup-error {
            font-size: 14px;
        }
    </style>
    <body>
        <%
            if (session != null && session.getAttribute("email") != null) {
                response.sendRedirect("home.jsp");
            } else {
        %>
        <%
            }
        %>

        <section class="grainy-gradient-intro vh-120">
            <div class="container h-100" style="padding: auto; padding-top: 10vh;">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="grainy-gradient-intro card" style="border-radius: 1rem;">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block">
                                    <img src="./asset/pexels-pixabay-255469.jpg " alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; object-fit: cover; height: 100%;" />
                                </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center" style=" background: url(./asset/background_blur.png);
                                     background-repeat: no-repeat;
                                     background-attachment: fixed;
                                     background-size: 100% 100%">
                                    <div class="card-body p-4 p-lg-5 text-black">
                                        <form id="reg_form" method="post" action="login">
                                            <div class="d-flex align-items-center mb-3 pb-1">
                                                <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                                <a href="home.jsp" style="margin:0 auto;"> <img style="margin: 0 auto;" src="./asset/healthier (1) (1).png" alt=""></a>
                                            </div>
                                            <h5 class="fw-normal mb-2 pb- text-center" style="letter-spacing: 1px;">Sign into your account</h5>
                                            <p class="mb-3 pb-lg-2 text-center" style="color: #393f81;">Don't have an account? <a href="register.jsp" style="color: #393f81;">Register here</a></p>
                                            <div class="form-outline mb-3">
                                                <label class="form-label email-label" for="form2Example17">Email address</label>
                                                <input type="email" name="email" id="form_email" class="form-control" value="<%= request.getParameter("email") != null ? request.getParameter("email") : ""%>" />
                                                <span class="signup-error" id="erroremail">Invalid email format</span>
                                            </div>
                                            <div class="form-outline mb-3">
                                                <label class="form-label password-label" for="form2Example27">Password</label>
                                                <input type="password" id="form_pwd" class="form-control" name="password" value="<%= request.getParameter("password") != null ? request.getParameter("password") : ""%>" />
                                                <span class="signup-error" id="errorpass">Password must contain at least 6 chars</span>
                                                <a class="small text-muted " id="forgot-pw-link" href="forgot.jsp">Forgot password?</a>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" type="checkbox" name="remember_me" id="remember_me" <%= request.getParameter("remember_me") != null && request.getParameter("remember_me").equals("on") ? "checked" : ""%>>
                                                <label class="form-check-label" for="remember_me">
                                                    Remember me
                                                </label>
                                            </div>
                                            <div class="pt-1 mb-3">
                                                <button class=" btn btn-gradient btn-lg btn-block" type="submit">Login</button>
                                            </div>
                                            <a href="#!" class="small text-muted">Terms of use.</a>
                                            <a href="#!" class="small text-muted">Privacy policy</a>
                                            <% String error = request.getParameter("error"); %>
                                            <!-- form inputs omitted for brevity -->
                                            <% if (error != null && error.equals("1")) { %>
                                            <div class="alert alert-danger" style="margin-top:2em;" role="alert">
                                                Invalid email or password. Please try again.
                                            </div>
                                            <% }%>
                                            <!-- submit button omitted for brevity -->
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/login.js"></script>
    </body>
</html>