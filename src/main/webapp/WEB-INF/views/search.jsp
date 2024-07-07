<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Movie Mate</title>
    <%@ include file="include/header-static.jsp"%>
    <link rel="stylesheet" href="/assets/css/search.css">
</head>

<body>
    <%@ include file="include/header.jsp"%>

    <section id="search">

        <h2 class="searchResult">${keyword}(으)로 검색한 결과입니다.</h2>


        <!-- 검색별 영화 목록 섹션 -->
        <div class="genre swiper-container-list">
            <div class="genre-movielist swiper-wrapper">
                <c:forEach var="movie" items="${movie}">
                    <div class="movie-img-box swiper-slide" data-movie-cd="${movie.movieCd}">
                        <a href="/detail/${movie.movieCd}"><img src="${movie.imageUrl}" alt="영화 포스터"></a>
                        <p class="genre-movieNm">${movie.movieName}</p>
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

    <%@ include file="include/footer.jsp"%>

    <script>
        const listSwiper = new Swiper('.swiper-container-list', {
            // loop: true,
            slidesPerView: 5,
            spaceBetween: 5,
            navigation: {
                nextEl: '.list-next',
                prevEl: '.list-prev',
            }
        });

        window.onload = function () {
            var footer = document.querySelector("footer");
            var bodyHeight = document.body.clientHeight;
            var windowHeight = window.innerHeight;

            if (bodyHeight < windowHeight) {
                footer.style.position = "fixed";
                footer.style.left = "0";
                footer.style.bottom = "0";
                footer.style.width = "100%";
            }
        };
    </script>
</body>


</html>