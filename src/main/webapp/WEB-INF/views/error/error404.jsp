<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Movie Mate</title>
    <%@ include file="../include/header-static.jsp"%>
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

    <style>
        
        body {
            overflow: hidden;
        }
        .background-image img{
            width: 100vw;
            height: 100vh;
            filter: brightness(50%);
        }
        .error-wrapper {
            box-sizing: border-box;
            position: absolute;
            top: 47%;
            left: 49%;
            transform: translate(-50%,-50%);
            width: 77%;
            min-width: 790px;
            height: 45%;
            /* background-color: white; */
            padding: 60px 40px 20px 60px;
        }

        .warning img {
            width: 100px;
            height: 100px;
        }
        .not-found {
            font-size: 80px;
            display: flex;
            align-items: center;
            font-weight: bold;
            color: blanchedalmond;
            text-shadow: 8px 8px 8px black;
        }
        .top-text {
            display: flex;
            justify-content: center;
        }
        .bottom-text {
            min-height: 100px;
        }
        .bottom-text h1 {
            text-align: center;
            font-size: 24px;
            margin-top: 20px;
            line-height: 40px;
        }
        .go-home {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            margin-top: 20px;
        }
        .go-home a {
            display: flex;
            border: 1px solid black;
            background-color: transparent;
            width: 100px;
            height: 30px;
            border-radius: 30px;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .go-home a:hover {
            background: black;
            color: aliceblue;
            transition: 1s;
        }
        .hidden {
            position: absolute;
            top: 0;
            z-index: -1;
        }
        /* 세로 비율 반응형*/
        @media screen and (max-height: 767px)  {
            .error-wrapper{
                top: 40%;
            }
            .bottom-text h1 {
                font-size: 16px;
                line-height: 20px;
            }
        }
    </style>

</head>
<body>

    <div class="background-image"><img class="not-hidden" src="/assets/img/cinemaBcakground.jpg" alt="배경"></div>
    <div class="background-image hidden"><img src="/assets/img/errorPage.png" alt="배경"></div>


    <div class="error-wrapper">
        <div class="top-text">
            <span class="warning"><img src="/assets/img/free-icon-film-director-9194241.png" alt="경고"></span>
            <h1 class="not-found">404 Not Found</h1>
        </div>
        <div class="bottom-text">
            <h1>죄송합니다. 페이지를 찾을 수 없습니다.<br>
                존재하지 않는 주소를 입력하셨거나<br>
                요청하신 페이지의 주소가 변경,삭제되어 찾을 수 없습니다.</h1>
            <div class="go-home"><a href="/">HOME</a></div>
        </div>

    </div>

    <script>
         // 홈버튼 배경이미지 변경 효과
         const homeBtn = document.querySelector('.go-home a');
        const backImage = document.querySelector('.background-image .not-hidden');

        homeBtn.addEventListener('mouseover', () => {
            backImage.style.transition = "opacity 0.5s ease-in-out";
            backImage.style.opacity = "0"
        });
        homeBtn.addEventListener('mouseout', () => {
            backImage.style.transition = "opacity 0.5s ease-in-out";
            backImage.style.opacity = "1"
        });
    </script>

</body>
</html>

