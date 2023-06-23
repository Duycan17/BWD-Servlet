<%-- 
    Document   : forgot
    Created on : Jun 23, 2023, 11:04:36 AM
    Author     : duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <style>
        .form-gap {
            padding-top: 70px;
        }
        body{
            background: url(./asset/background_blur.png);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            height: 100vh;
        }
    </style>
    <body>
        <div class="form-gap"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">
                                <h3><i class="fa fa-lock fa-4x"></i></h3>
                                <h2 class="text-center">Forgot Password?</h2>
                                <p>You can reset your password here.</p>
                                <div class="panel-body">
                                    <%  // Get the error parameter from the request and display a message accordingly
                                        String error = request.getParameter("error");
                                        if (error != null) {
                                            if (error.equals("0")) {
                                    %>
                                    <div class="alert alert-success">
                                        <strong>Password reset successful!</strong> Check your email for the new password.
                                    </div>
                                    <% } else { %>
                                    <div class="alert alert-danger">
                                        <strong>Password reset failed!</strong> Please check your email address and try again.
                                    </div>
                                    <% }
                                }%>
                                    <form id="register-form" role="form" autocomplete="off" class="form" method="post" action="forgot">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                                <input id="email" name="email" placeholder="email address" class="form-control"  type="email">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
                                        </div>
                                        <%-- Add a button that allows the user to resend the email after 30 seconds --%>
                                        <div id="resend-container" class="form-group" style="display:none;">
                                            <p>Didn't receive an email? Click the button below to resend the email in 30 seconds.</p>
                                            <button id="resend-button" class="btn btn-default" disabled>Resend email in 30 seconds</button>
                                        </div>
                                        <input type="hidden" class="hide" name="token" id="token" value=""> 
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
