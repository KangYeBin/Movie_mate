<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>

    <!-- CSS -->
        <link rel="stylesheet" href="../../resources/static/assets/css/swiper-bundle.css" />
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

    <!-- JS -->
        <script src="../../resources/static/assets/js/swiper-bundle.js"></script>
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <style>
            @import url(../../resources/static/assets/css/reset.css);

            html {
                overflow-x: hidden;
            }

            .section1 #main-banner-slider {
                /* height: 600px; */
            }

            .section1 #btn .swiper-button-prev,
            .section1 #btn .swiper-button-next {
                top: 30%;
                bottom: auto;
            }
            .section1 #btn .swiper-button-prev{
                left: 20%;
            }
            .section1 #btn .swiper-button-next{
                right: 20%;
            }
        </style>

</head>
<body>

    <div class="section1">

            <h1 class="recommend-movie">Movie Mate 추천</h1>
            <!-- 상단 메인 빅 배너 슬라이더 섹션 -->
            <div id="main-banner-slider" class="swiper-container">
                <ul class="banner-title swiper-wrapper">
                    <li class="swiper-slide"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEwMjJfMTM0%2FMDAxNjk3OTUyODQyOTg0.j5oL3ebwT7BSCiKuCrWaIg8RDAG2kxrT-cilUUIQYKAg.Mf00ElvkVHad_2iY0nB0TfN4kuGDAnV4twBhAICYB3kg.JPEG.g_minn%2Fdc6459eb82ab366c06132ed57ab1bda7.jpg&type=sc960_832" alt="영화 큰 배너"></li>
                    <li class="swiper-slide"><img src="https://www.ctimes.co.kr/news/photo/201907/1155_1101_2146.jpg" alt="영화 큰 배너"></li>
                    <li class="swiper-slide"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEwMjJfMTM0%2FMDAxNjk3OTUyODQyOTg0.j5oL3ebwT7BSCiKuCrWaIg8RDAG2kxrT-cilUUIQYKAg.Mf00ElvkVHad_2iY0nB0TfN4kuGDAnV4twBhAICYB3kg.JPEG.g_minn%2Fdc6459eb82ab366c06132ed57ab1bda7.jpg&type=sc960_832" alt="영화 큰 배너"></li>
                    <li class="swiper-slide"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEwMjJfMTM0%2FMDAxNjk3OTUyODQyOTg0.j5oL3ebwT7BSCiKuCrWaIg8RDAG2kxrT-cilUUIQYKAg.Mf00ElvkVHad_2iY0nB0TfN4kuGDAnV4twBhAICYB3kg.JPEG.g_minn%2Fdc6459eb82ab366c06132ed57ab1bda7.jpg&type=sc960_832" alt="영화 큰 배너"></li>
                </ul>

                <!-- 슬라이더 좌우 버튼 -->
                <div id="btn">
                    <button class="banner-prev swiper-button-prev" role="button">
                        <!-- <span class="lnr lnr-chevron-left"></span> -->
                    </button>

                    <button class="banner-next swiper-button-next" role="button">
                        <!-- <span class="lnr lnr-chevron-right"></span> -->
                    </button>
                </div>
            </div>

        </div>


        <script>
            const mySwiper = new Swiper('.swiper-container', {
                loop: true,
                autoplay: {
                delay: 10000
                },
                speed: 500,
                slidesPerView: 1.08,
                centeredSlides: true,
                spaceBetween : 100,
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                pagination: {
                    el: '.swiper-pagination',
                    type: 'fraction',
                },

            });


        </script>

</body>
</html>