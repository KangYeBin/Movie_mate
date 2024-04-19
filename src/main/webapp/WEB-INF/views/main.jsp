<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>
    <%@ include file="include/header-static.jsp"%>
    <link rel="stylesheet" href="/assets/css/mainpage.css">
</head>

<body>
    <%@ include file="include/header.jsp"%>

    <section id="main">

        <h1 class="recommend-movie">Movie Mate 추천</h1>
        <!-- 상단 메인 빅 배너 슬라이더 섹션 -->
        <div id="main-banner-slider" class="swiper-container">
            <ul class="banner-title swiper-wrapper">
                <li class="swiper-slide"><img
                        src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEwMjJfMTM0%2FMDAxNjk3OTUyODQyOTg0.j5oL3ebwT7BSCiKuCrWaIg8RDAG2kxrT-cilUUIQYKAg.Mf00ElvkVHad_2iY0nB0TfN4kuGDAnV4twBhAICYB3kg.JPEG.g_minn%2Fdc6459eb82ab366c06132ed57ab1bda7.jpg&type=sc960_832"
                        alt="영화 큰 배너"></li>
                <li class="swiper-slide"><img
                        src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEwMjJfMTM0%2FMDAxNjk3OTUyODQyOTg0.j5oL3ebwT7BSCiKuCrWaIg8RDAG2kxrT-cilUUIQYKAg.Mf00ElvkVHad_2iY0nB0TfN4kuGDAnV4twBhAICYB3kg.JPEG.g_minn%2Fdc6459eb82ab366c06132ed57ab1bda7.jpg&type=sc960_832"
                        alt="영화 큰 배너"></li>
                <li class="swiper-slide"><img
                        src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEwMjJfMTM0%2FMDAxNjk3OTUyODQyOTg0.j5oL3ebwT7BSCiKuCrWaIg8RDAG2kxrT-cilUUIQYKAg.Mf00ElvkVHad_2iY0nB0TfN4kuGDAnV4twBhAICYB3kg.JPEG.g_minn%2Fdc6459eb82ab366c06132ed57ab1bda7.jpg&type=sc960_832"
                        alt="영화 큰 배너"></li>
                <li class="swiper-slide"><img
                        src="https://img.khan.co.kr/news/2023/11/25/news-p.v1.20231125.87430166a2c4429084de090dee453d9a_P1.webp"
                        alt="영화 큰 배너"></li>
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
            <span class="genre-text">SF</span>
            <div class="genre-movielist swiper-wrapper">
                <c:forEach var="sf" items="${sf}">
                    <div class="movie-img-box swiper-slide" data-movie-cd="${sf.movieCd}">
                        <a href="/detail/${sf.movieCd}"><img src="${sf.imageUrl}" alt="장르별 영화 포스터"></a>
                        <p>${sf.movieName}</p>
                    </div>
                </c:forEach>
            </div>

            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev" role="button"></button>

                <button class="list-next swiper-button-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="genre swiper-container-list">
            <span class="genre-text">가족</span>
            <div class="genre-movielist swiper-wrapper">
                <c:forEach var="family" items="${family}">
                    <div class="movie-img-box swiper-slide" data-movie-cd="${family.movieCd}">
                        <a href="/detail/${family.movieCd}"><img src="${family.imageUrl}" alt="장르별 영화 포스터"></a>
                        <p>${family.movieName}</p>
                    </div>
                </c:forEach>
            </div>

            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev" role="button"></button>

                <button class="list-next swiper-button-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="genre swiper-container-list">
            <span class="genre-text">공포</span>
            <div class="genre-movielist swiper-wrapper">
                <c:forEach var="horror" items="${horror}">
                    <div class="movie-img-box swiper-slide" data-movie-cd="${horror.movieCd}">
                        <a href="/detail/${horror.movieCd}"><img src="${horror.imageUrl}" alt="장르별 영화 포스터"></a>
                        <p>${horror.movieName}</p>
                    </div>
                </c:forEach>
            </div>

            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev" role="button"></button>

                <button class="list-next swiper-button-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="genre swiper-container-list">
            <span class="genre-text">드라마</span>
            <div class="genre-movielist swiper-wrapper">
                <c:forEach var="drama" items="${drama}">
                    <div class="movie-img-box swiper-slide" data-movie-cd="${drama.movieCd}">
                        <a href="/detail/${drama.movieCd}"><img src="${drama.imageUrl}" alt="장르별 영화 포스터"></a>
                        <p>${drama.movieName}</p>
                    </div>
                </c:forEach>
            </div>

            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev" role="button"></button>

                <button class="list-next swiper-button-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="genre swiper-container-list">
            <span class="genre-text">멜로/로맨스</span>
            <div class="genre-movielist swiper-wrapper">
                <c:forEach var="meloromance" items="${meloromance}">
                    <div class="movie-img-box swiper-slide" data-movie-cd="${meloromance.movieCd}">
                        <a href="/detail/${meloromance.movieCd}"><img src="${meloromance.imageUrl}" alt="장르별 영화 포스터"></a>
                        <p>${meloromance.movieName}</p>
                    </div>
                </c:forEach>
            </div>

            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev" role="button"></button>

                <button class="list-next swiper-button-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="genre swiper-container-list">
            <span class="genre-text">미스터리</span>
            <div class="genre-movielist swiper-wrapper">
                <c:forEach var="mystery" items="${mystery}">
                    <div class="movie-img-box swiper-slide" data-movie-cd="${mystery.movieCd}">
                        <a href="/detail/${mystery.movieCd}"><img src="${mystery.imageUrl}" alt="장르별 영화 포스터"></a>
                        <p>${mystery.movieName}</p>
                    </div>
                </c:forEach>
            </div>

            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev" role="button"></button>

                <button class="list-next swiper-button-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="genre swiper-container-list">
            <span class="genre-text">범죄</span>
            <div class="genre-movielist swiper-wrapper">
                <c:forEach var="crime" items="${crime}">
                    <div class="movie-img-box swiper-slide" data-movie-cd="${crime.movieCd}">
                        <a href="/detail/${crime.movieCd}"><img src="${crime.imageUrl}" alt="장르별 영화 포스터"></a>
                        <p>${crime.movieName}</p>
                    </div>
                </c:forEach>
            </div>

            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev" role="button"></button>

                <button class="list-next swiper-button-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="genre swiper-container-list">
            <span class="genre-text">스릴러</span>
            <div class="genre-movielist swiper-wrapper">
                <c:forEach var="thriller" items="${thriller}">
                    <div class="movie-img-box swiper-slide" data-movie-cd="${thriller.movieCd}">
                        <a href="/detail/${thriller.movieCd}"><img src="${thriller.imageUrl}" alt="장르별 영화 포스터"></a>
                        <p>${thriller.movieName}</p>
                    </div>
                </c:forEach>
            </div>

            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev" role="button"></button>

                <button class="list-next swiper-button-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="genre swiper-container-list">
            <span class="genre-text">액션</span>
            <div class="genre-movielist swiper-wrapper">
                <c:forEach var="action" items="${action}">
                    <div class="movie-img-box swiper-slide" data-movie-cd="${action.movieCd}">
                        <a href="/detail/${action.movieCd}"><img src="${action.imageUrl}" alt="장르별 영화 포스터"></a>
                        <p>${action.movieName}</p>
                    </div>
                </c:forEach>
            </div>

            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev" role="button"></button>

                <button class="list-next swiper-button-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="genre swiper-container-list">
            <span class="genre-text">어드벤처</span>
            <div class="genre-movielist swiper-wrapper">
                <c:forEach var="adventure" items="${adventure}">
                    <div class="movie-img-box swiper-slide" data-movie-cd="${adventure.movieCd}">
                        <a href="/detail/${adventure.movieCd}"><img src="${adventure.imageUrl}" alt="장르별 영화 포스터"></a>
                        <p>${adventure.movieName}</p>
                    </div>
                </c:forEach>
            </div>

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
<script src="/assets/js/mainpage.js"></script>

</html>