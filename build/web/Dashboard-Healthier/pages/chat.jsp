
<%-- 
    Document   : home
    Created on : May 30, 2023, 10:24:56 PM
    Author     : duy
--%>

<%@page import="Controller.MiBand4Automation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.HashMap" %>
<%@page import="DAO.UserDAO"%>
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
    <% if (session != null && session.getAttribute("email") != null) { %>
    <!-- code to be executed if the session and email attribute exist -->
    <% } else { %>
    <% response.sendRedirect(request.getContextPath() + "/login.jsp"); %>
    <% } %>
    <body class="g-sidenav-show bg-gray-100">
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
                                    .navbar-collapse {
                                        position: relative;
                                    }
                                    .navbar-collapse .navbar-nav {
                                        width: auto !important;
                                    }
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
        <!--<script src="../assets/js/chat.js"></script>-->
        <script>
            const msgPanel = document.querySelector(".msg-panel");
            const input = document.getElementById("inputC");
            const submit = document.getElementById("submit");
            const apiUrl = "http://localhost:3700/v1/chat/completions";
            const apiKey = "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";
            // add content when webpage is loaded

            window.onload = function () {
                const chatbotResponse = "Hello there! How can I assist you today? 😊👋";
                let msgResponse = document.createElement("div");
                msgResponse.textContent = chatbotResponse;
                msgResponse.classList.add("msgResponse");
                msgPanel.appendChild(msgResponse);
                setTimeout(() => {
                    msgResponse.style.marginTop = "7px";
                    msgResponse.style.opacity = 1;
                });
                msgResponse.addEventListener("mousedown", (e) => {
                    e.preventDefault();

                    if (e.which == 2 || e.which == 4) {
                        msgResponse.style.marginRight = "-50px";
                        msgResponse.style.opacity = 0;

                        setTimeout(() => msgResponse.remove(), 200);
                    }
                });
            };
            submit.addEventListener("click", async (e) => {
                e.preventDefault();
                const trimmedInputValue = input.value.trim();
                if (trimmedInputValue == "") {
                    return;
                }

                const date = new Date();

                const msg = document.createElement("div");
                msg.textContent = trimmedInputValue;
                formatMessage(msg);
                const options = {
                    hour: "2-digit",
                    minute: "2-digit",
                    hour12: true,
                };
                const timeString = date.toLocaleString("en-US", options);
                const dateString = `${
            date.getMonth() + 1
                }/${date.getDate()}/${date.getFullYear()}`;
                        msg.title = `${timeString} - ${dateString}`;
                                msg.classList.add("msg");
                                msgPanel.appendChild(msg);

                                setTimeout(() => {
                                    msg.style.marginTop = "7px";
                                    msg.style.opacity = 1;
                                });

                                msg.addEventListener("mousedown", (e) => {
                                    e.preventDefault();

                                    if (e.which == 2 || e.which == 4) {
                                        msg.style.marginRight = "-50px";
                                        msg.style.opacity = 0;

                                        setTimeout(() => msg.remove(), 200);
                                    }
                                });

                                // send request to the api
                                let message = trimmedInputValue;
                                message =
                                        "Now you are called Healthier, Now you are medical assistance, my weight is " +<%=weight%> + " and my height is " +<%=height%> + ", just answer me as short as possible " +
                                        message;
                                const sendRequest = async (model, messages) => {
                                    const url = apiUrl;
                                    const headers = {
                                        "Content-Type": "application/json",
                                        Authorization: `Bearer ${apiKey}`,
                                    };
                                    const data = {
                                        model,
                                        messages,
                                    };

                                    try {
                                        const response = await axios.post(url, data, {headers});
                                        return response.data;
                                    } catch (error) {
                                        console.error(error);
                                    }
                                };

                                // Example usage
                                const model = "davinci";
                                const messages = [
                                    {
                                        role: "user",
                                        content: message,
                                        name: "message-1",
                                    },
                                ];
                                sendRequest(model, messages)
                                        .then((data) => {
                                            const chatbotResponse = data.choices[0].message.content;
                                            console.log(data);
                                            let msgResponse = document.createElement("div");
                                            msgResponse.textContent = chatbotResponse;
                                            msgResponse.classList.add("msgResponse");
                                            msgPanel.appendChild(msgResponse);
                                            setTimeout(() => {
                                                msgResponse.style.marginTop = "7px";
                                                msgResponse.style.opacity = 1;
                                            });

                                            msgResponse.addEventListener("mousedown", (e) => {
                                                e.preventDefault();

                                                if (e.which == 2 || e.which == 4) {
                                                    msgResponse.style.marginRight = "-50px";
                                                    msgResponse.style.opacity = 0;

                                                    setTimeout(() => msgResponse.remove(), 200);
                                                }
                                            });
                                            input.value = "";
                                            msgPanel.scrollTop = msgPanel.scrollHeight;
                                            submit.setAttribute("disabled", "");
                                        })
                                        .catch((error) => console.error(error));

                                input.value = "";
                                msgPanel.scrollTop = msgPanel.scrollHeight;
                                submit.setAttribute("disabled", "");
                            });

                            function escapeHTML(text) {
                                const map = {
                                    "&": "&amp;",
                                    "<": "&lt;",
                                    ">": "&gt;",
                                    '"': "&quot;",
                                    "'": "&#039;",
                                };
                                return text.replace(/[&<>"']/g, (m) => {
                                    return map[m];
                                });
                            }

                            function formatMessage(msg) {
                                const message = msg.textContent;
                                let formattedMessage = escapeHTML(message);

                                // Anchor links
                                formattedMessage = formattedMessage.replace(
                                        /\[(.*?)\]\((.*?)\)/g,
                                        '<a href="$1">$2</a>'
                                        );

                                // Images
                                formattedMessage = formattedMessage.replace(
                                        /\((.*?)\)\[(.*?)\]/g,
                                        '<img src="$1" height="200" alt="$2">'
                                        );

                                // Bold
                                formattedMessage = formattedMessage.replace(
                                        /\*\*(.*?)\*\*/g,
                                        "<strong>$1</strong>"
                                        );

                                // Italic
                                formattedMessage = formattedMessage.replace(/\*(.*?)\*/g, "<em>$1</em>");

                                // Strikethrough
                                formattedMessage = formattedMessage.replace(/~~(.*?)~~/g, "<del>$1</del>");

                                // Underlined
                                formattedMessage = formattedMessage.replace(/~(.*?)~/g, "<u>$1</u>");

                                // Uppercase
                                formattedMessage = formattedMessage.replace(
                                        /\+\+(.*?)\+\+/g,
                                        '<span style="text-transform: uppercase;">$1</span>'
                                        );

                                // Lowercase
                                formattedMessage = formattedMessage.replace(
                                        /\+(.*?)\+/g,
                                        '<span style="text-transform: lowercase;">$1</span>'
                                        );

                                // Highlight
                                formattedMessage = formattedMessage.replace(
                                        /`(.*?)`/g,
                                        '<span style="background-color: #357c38; border-radius: 5px; padding: 3px;">$1</span>'
                                        );

                                // Reverse
                                formattedMessage = formattedMessage.replace(
                                        /--(.*?)--/g,
                                        (match, capturedText) => {
                                    return capturedText.split("").reverse().join("");
                                }
                                );

                                // Line break
                                formattedMessage = formattedMessage.replace(/\\n/g, "<br>");

                                msg.innerHTML = formattedMessage;
                            }

                            input.addEventListener("input", () => {
                                if (input.value != "") {
                                    submit.removeAttribute("disabled");
                                } else {
                                    submit.setAttribute("disabled", "");
                                }
                            });

                            const clear = document.getElementById("clear");

                            function clearChat() {
                                const messages = msgPanel.querySelectorAll("div");
                                let delay = 0;

                                clear.setAttribute("disabled", "");

                                messages.forEach((msg, index) => {
                                    setTimeout(() => {
                                        msg.style.marginRight = "-50px";
                                        msg.style.opacity = 0;
                                    }, delay);
                                    delay += 100;
                                });

                                setTimeout(() => {
                                    msgPanel.innerHTML = "";
                                    clear.removeAttribute("disabled");
                                }, delay);
                            }

                            clear.addEventListener("click", clearChat);

                            input.addEventListener("keydown", (e) => {
                                if (e.ctrlKey) {
                                    const startPos = input.selectionStart;
                                    const endPos = input.selectionEnd;
                                    const currentValue = input.value;

                                    if (e.key == "b") {
                                        // Ctrl+B for bold
                                        e.preventDefault();
                                        if (startPos !== endPos) {
                                            const selectedText = currentValue.substring(startPos, endPos);
                                            const modifiedText = `**${selectedText}**`;
                                            const newValue =
                                                    currentValue.substring(0, startPos) +
                                                    modifiedText +
                                                    currentValue.substring(endPos);
                                            input.value = newValue;
                                            input.selectionStart = startPos + 2;
                                            input.selectionEnd = endPos + 2;
                                        }
                                    } else if (e.key == "i") {
                                        // Ctrl+I for italic
                                        e.preventDefault();
                                        if (startPos !== endPos) {
                                            const selectedText = currentValue.substring(startPos, endPos);
                                            const modifiedText = `*${selectedText}*`;
                                            const newValue =
                                                    currentValue.substring(0, startPos) +
                                                    modifiedText +
                                                    currentValue.substring(endPos);
                                            input.value = newValue;
                                            input.selectionStart = startPos + 1;
                                            input.selectionEnd = endPos + 1;
                                        }
                                    } else if (e.key == "u") {
                                        // Ctrl+U for underline
                                        e.preventDefault();
                                        if (startPos !== endPos) {
                                            const selectedText = currentValue.substring(startPos, endPos);
                                            const modifiedText = `~${selectedText}~`;
                                            const newValue =
                                                    currentValue.substring(0, startPos) +
                                                    modifiedText +
                                                    currentValue.substring(endPos);
                                            input.value = newValue;
                                            input.selectionStart = startPos + 1;
                                            input.selectionEnd = endPos + 1;
                                        }
                                    } else if (e.key == "s") {
                                        // Ctrl+S for strikethrough
                                        e.preventDefault();
                                        if (startPos !== endPos) {
                                            const selectedText = currentValue.substring(startPos, endPos);
                                            const modifiedText = `~~${selectedText}~~`;
                                            const newValue =
                                                    currentValue.substring(0, startPos) +
                                                    modifiedText +
                                                    currentValue.substring(endPos);
                                            input.value = newValue;
                                            input.selectionStart = startPos + 2;
                                            input.selectionEnd = endPos + 2;
                                        }
                                    } else if (e.key == "h") {
                                        // Ctrl+H for highlight
                                        e.preventDefault();
                                        if (startPos !== endPos) {
                                            const selectedText = currentValue.substring(startPos, endPos);
                                            const modifiedText = `\`${selectedText}\``;
                                            const newValue =
                                                    currentValue.substring(0, startPos) +
                                                    modifiedText +
                                                    currentValue.substring(endPos);
                                            input.value = newValue;
                                            input.selectionStart = startPos + 1;
                                            input.selectionEnd = endPos + 1;
                                        }
                                    } else if (e.key == "r") {
                                        // Ctrl+R for reverse
                                        e.preventDefault();
                                        const selectedText = currentValue.substring(startPos, endPos);
                                        const modifiedText = `--${selectedText}--`;
                                        const newValue =
                                                currentValue.substring(0, startPos) +
                                                modifiedText +
                                                currentValue.substring(endPos);
                                        input.value = newValue;
                                        input.selectionStart = startPos + 1;
                                        input.selectionEnd = endPos + 1;
                                    }
                                }

                                if (e.shiftKey && e.key == "Enter") {
                                    const caretStart = input.selectionStart;
                                    const caretEnd = input.selectionEnd;

                                    const currentValue = input.value;
                                    const newValue = `${currentValue.substring(
                                0,
                                caretStart
                                )}\\n${currentValue.substring(caretEnd)}`;

                                            input.value = newValue;

                                            const newCaretPosition = caretStart + 2;
                                            input.setSelectionRange(newCaretPosition, newCaretPosition);
                                        }

                                        if (e.key == "Backspace") {
                                            const currentValue = input.value;
                                            const caretStart = input.selectionStart;
                                            const caretEnd = input.selectionEnd;

                                            if (currentValue.substring(caretStart - 2, caretStart) === "\\n") {
                                                const newValue =
                                                        currentValue.substring(0, caretStart - 1) +
                                                        currentValue.substring(caretEnd);
                                                input.value = newValue;

                                                const newCaretPosition = caretStart - 1;
                                                input.setSelectionRange(newCaretPosition, newCaretPosition);
                                            }
                                        }
                                    });

                                    document.addEventListener("keyup", (e) => {
                                        if (!e.shiftKey && e.key == "Enter") {
                                            submit.click();
                                        }
                                        if (e.altKey && e.key == "c") {
                                            clearChat();
                                        }
                                    });
        </script>

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
