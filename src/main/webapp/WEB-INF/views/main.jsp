<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>

        <style>
            /* reset css */
            @import url('https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css');

            /* font style */
            @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

            /* 메인페이지 스타일 */
            html {
                font-family: "Do Hyeon", sans-serif;
                font-weight: 400;
                font-style: normal;
                overflow-x: hidden;
                background: linear-gradient(to top, rgb(153,153,153), rgb(9,2,2));
            }

            /* 상단 추전 텍스트 스타일 */
            h1.recommend-movie{
                text-align: center;
                font-size: 40px;
                color: #fff;
            }


            /* 상단 메인 빅 배너 슬라이더 스타일 */
            ul.banner-title {
                /* display: flex; */
                /* overflow: hidden; */
                margin-bottom: 100px;
            }
            ul.banner-title li {
                /* margin: 0 20px; */
                text-align: center;
            }
            .swiper-slide img {
                width: 1000px;
                height: 400px;
                border-radius: 5px;
            }


            /* 버튼 스타일 */
            #btn button{
                border: 0;
                background-color: transparent;
            }
            #btn button span:hover {
                cursor: pointer;
                opacity: 1;
            }

            #main #btn .swiper-button-prev,
            #main #btn .swiper-button-next {
                top: 30%;
                bottom: auto;
                color: white;
                opacity: 0.5;
            }
            #main #btn .swiper-button-prev{
                left: 20%;
            }
            #main #btn .swiper-button-next{
                right: 20%;
            }
            #main #btn .swiper-button-prev:hover,
            #main #btn .swiper-button-next:hover {
                opacity: 1;
            }

            /* 장르 영화 목록 스타일 */
            span.genre-text{
                display: block;
                width: 60%;
                margin: 10px auto;
                color: #fff;
                font-weight: 700;
                font-size: 30px;
            }

            .genre-movielist{
                width: 60%;
                height: 350px;
                background-color: aqua;
                margin: 0 auto;
                display: flex;
                justify-content: space-between;
            }

            .movie-img-box{
                width: 19%;
            }

            .movie-img-box img {
                width: 100%;
                height: 80%;
                border-radius: 7px;
            }




        </style>

</head>
<body>

 <section id="main">

        <h1 class="recommend-movie">Movie Mate 추천</h1>
        <!-- 상단 메인 빅 배너 슬라이더 섹션 -->
        <div id="main-banner-slider" class="swiper-container">
            <ul class="banner-title swiper-wrapper">
                <li class="swiper-slide"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEwMjJfMTM0%2FMDAxNjk3OTUyODQyOTg0.j5oL3ebwT7BSCiKuCrWaIg8RDAG2kxrT-cilUUIQYKAg.Mf00ElvkVHad_2iY0nB0TfN4kuGDAnV4twBhAICYB3kg.JPEG.g_minn%2Fdc6459eb82ab366c06132ed57ab1bda7.jpg&type=sc960_832" alt="영화 큰 배너"></li>
                <li class="swiper-slide"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEwMjJfMTM0%2FMDAxNjk3OTUyODQyOTg0.j5oL3ebwT7BSCiKuCrWaIg8RDAG2kxrT-cilUUIQYKAg.Mf00ElvkVHad_2iY0nB0TfN4kuGDAnV4twBhAICYB3kg.JPEG.g_minn%2Fdc6459eb82ab366c06132ed57ab1bda7.jpg&type=sc960_832" alt="영화 큰 배너"></li>
                <li class="swiper-slide"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEwMjJfMTM0%2FMDAxNjk3OTUyODQyOTg0.j5oL3ebwT7BSCiKuCrWaIg8RDAG2kxrT-cilUUIQYKAg.Mf00ElvkVHad_2iY0nB0TfN4kuGDAnV4twBhAICYB3kg.JPEG.g_minn%2Fdc6459eb82ab366c06132ed57ab1bda7.jpg&type=sc960_832" alt="영화 큰 배너"></li>
                <li class="swiper-slide"><img src="https://img.khan.co.kr/news/2023/11/25/news-p.v1.20231125.87430166a2c4429084de090dee453d9a_P1.webp" alt="영화 큰 배너"></li>
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

        <div class="genre swiper-container-list">
            <span class="genre-text">장르입니다</span>
            <div class="genre-movielist swiper-wrapper">
                <ul class="movie-img-box swiper-slide">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
            </div>
        </div>

        <div class="genre">
            <span class="genre-text">장르입니다</span>
            <div class="genre-movielist">
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
            </div>
        </div>

        <div class="genre">
            <span class="genre-text">장르입니다</span>
            <div class="genre-movielist">
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
                <ul class="movie-img-box">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터">
                </ul>
            </div>
        </div>


    </section>

    <script>
        const mySwiper = new Swiper('.swiper-container', {
            loop:true,
            autoplay: {
            delay: 10000
            },
            speed: 500,
            slidesPerView: 1.85,
            centeredSlides: true,
            spaceBetween : 0,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            centeredSlides: true,  // 양쪽 미리보기
            pagination: {
                el: '.swiper-pagination',
                type: 'fraction',
            },
            centeredSlides: true
        });

        const listSwiper = new Swiper('.swiper-container-list', {
            loop: true

        });


    </script>


</body>
</html>