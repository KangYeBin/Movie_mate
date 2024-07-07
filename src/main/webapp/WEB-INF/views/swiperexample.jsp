<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>
    <%@ include file="include/header-static.jsp"%>
    <style>
        .swiper-wrapper{
            transition-timing-function: linear;
        }
    </style>
</head>
<body>
<%@ include file="include/header.jsp"%>

<section>

<div class="swiper recentMovieSwiper">
    <div class="swiper-wrapper">
        <c:forEach var="recent" items="${recentData}">
        <div class="swiper-slide " data-movie-cd="${recent.movieCd}">
                <img src="${recent.stillUrl}" alt="영화포스터">
                <p>${recent.movieName}</p>
        </div>
        </c:forEach>
    </div>

    <!-- If we need pagination -->
    <div class="swiper-pagination"></div>

    <!-- If we need navigation buttons -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>

    <!-- If we need scrollbar -->
    <div class="swiper-scrollbar"></div>

</div>
</section>

<section>
<div class="swiper koreaMovieSwiper">
    <div class="swiper-wrapper">
        <c:forEach var="korea" items="${korea}">
            <div class="swiper-slide " data-movie-cd="${korea.movieCd}">
                <img src="${korea.imageUrl}" alt="영화포스터">
                <p>${korea.movieName}</p>
            </div>
        </c:forEach>
    </div>

    <!-- If we need pagination -->
    <div class="swiper-pagination"></div>

    <!-- If we need navigation buttons -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>

    <!-- If we need scrollbar -->
    <div class="swiper-scrollbar"></div>

</div>
</section>

<%@ include file="include/footer.jsp"%>
</body>
<script>
    var recentSwiper = new Swiper('.recentMovieSwiper', {
        slidesPerView: 10,
        loop: true,
        spaceBetween:10,
        autoplay: {
            delay: 0,
            disableOnInteraction:false,

        },
        speed: 1000,

        navigation: {
            nextEl: '.recentMovieSwiper .swiper-button-next',
            prevEl: '.recentMovieSwiper .swiper-button-prev',
        },
    });


    var koreaSwiper = new Swiper('.koreaMovieSwiper', {

        grabCursor: true,
        centeredSlides: true,
        slidesPerView: 5,
        loop: true,
        spaceBetween:10,

        navigation: {
            nextEl: '.koreaMovieSwiper .swiper-button-next',
            prevEl: '.koreaMovieSwiper .swiper-button-prev',
        },
    });
</script>
</html>













