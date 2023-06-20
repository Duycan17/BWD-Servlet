document.addEventListener("DOMContentLoaded", function () {
    pushInStart();
    new WOW().init();
});
$(document).ready(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 2000) {
            $("#back-to-top").css("display", "block");
            $('.navbar').css('backdrop-filter', 'blur(16px)');
        } else {
            $("#back-to-top").css("display", "none");
            $('.navbar').css('backdrop-filter', 'blur(0px)');

        }

    });

    $("#back-to-top").click(function () {
        $("body,html").animate(
                {
                    scrollTop: 0,
                },
                400
                );
        return false;
    });
    $(document).scrollTop("30");
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // Parse the JSON response and display the user data
            var userData = JSON.parse(xhr.responseText);
            document.getElementById("userData").innerHTML = "Your email address is: " + userData.email;
        }
    };
    xhr.open("GET", "UserDataServlet");
    xhr.send();
});
