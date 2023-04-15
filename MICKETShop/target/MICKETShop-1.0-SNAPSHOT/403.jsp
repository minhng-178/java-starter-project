<%-- 
    Document   : 403
    Created on : Mar 22, 2023, 7:12:21 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>403 Forbidden</title>
        <style>
            @import url("https://fonts.googleapis.com/css?family=Press+Start+2P");

            html,
            body {
                width: 100%;
                height: 100%;
                margin: 0;
            }

            * {
                font-family: 'Press Start 2P', cursive;
                box-sizing: border-box;
            }
            .home {
                background: black;
            }

            .home a {
                text-decoration: none;
                font-size: 1.5rem;
            }
            #app {
                padding: 1rem;
                background: black;
                display: flex;
                height: 100%;
                justify-content: center;
                align-items: center;
                color: #54FE55;
                text-shadow: 0px 0px 10px;
                font-size: 6rem;
                flex-direction: column;
            }

            #app .txt {
                font-size: 1.8rem;
            }

            @keyframes blink {
                0% {
                    opacity: 0;
                }

                49% {
                    opacity: 0;
                }

                50% {
                    opacity: 1;
                }

                100% {
                    opacity: 1;
                }
            }

            .blink {
                animation-name: blink;
                animation-duration: 1s;
                animation-iteration-count: infinite;
            }
        </style>
    </head>

    <body>
        <div class="home">
            <a href="logout">HOME</a>
        </div>
        <div id="app">
            <div>403</div>
            <div class="txt">Access Denial<span class="blink">_</span></div
        </div>
    </body>

</html>