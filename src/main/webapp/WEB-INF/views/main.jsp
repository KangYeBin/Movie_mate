<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>
    <%@ include file="include/header-static.jsp"%>
    <link rel="stylesheet" href="/src/main/resources/static/assets/css/mainpage.css">
</head>
<body>
<%@ include file="include/header.jsp"%>

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
        <div class="btn">
            <button class="swiper-button-prev" role="button">
                <!-- <span class="lnr lnr-chevron-left"></span> -->
            </button>

            <button class="swiper-button-next" role="button">
                <!-- <span class="lnr lnr-chevron-right"></span> -->
            </button>
        </div>
    </div>

    <!-- 장르별 영화 목록 섹션 -->
    <div class="genre swiper-container-list">
        <span class="genre-text">장르입니다</span>
        <ul class="genre-movielist swiper-wrapper">
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
        </ul>

        <!-- 슬라이더 좌우 버튼 -->
        <div class="btn">
            <button class="list-prev swiper-button-prev" role="button"></button>

            <button class="list-next swiper-button-next" role="button"></button>
        </div>
    </div>

    <!-- 장르별 영화 목록 섹션 -->
    <div class="genre swiper-container-list">
        <span class="genre-text">장르입니다</span>
        <ul class="genre-movielist swiper-wrapper">
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
            <li class="movie-img-box swiper-slide">
                <a href=""><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMTFfMjcx%2FMDAxNzEwMTU0OTU2MjM0.fFlRXHacAjCwWbEIUZZYmk_DI77F9QcluLm_NUsz_lUg.OZytDNBUsGRmWWXtRhy-HT7KIJn5Z7q69J7xNhs0Ngog.JPEG%2FScreenshot%25A3%25DF20240311%25A3%25DF200003%25A3%25DFNaver_Blog.jpg&type=sc960_832" alt="장르별 영화 포스터"></a>
            </li>
        </ul>

        <!-- 슬라이더 좌우 버튼 -->
        <div class="btn">
            <button class="list-prev swiper-button-prev" role="button"></button>

            <button class="list-next swiper-button-next" role="button"></button>
        </div>
    </div>
    

</section>

<!-- 화면 상단 이동 버튼 -->
<a href="#">
    <div class="up-btn">▲</div>
</a>


<%@ include file="include/footer.jsp"%>
</body>
</html>