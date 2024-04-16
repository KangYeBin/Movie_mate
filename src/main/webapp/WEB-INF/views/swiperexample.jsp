<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>
    <%@ include file="include/header-static.jsp"%>

</head>
<body>
<%@ include file="include/header.jsp"%>

<section>
<div class="swiper firstswiper">
    <div class="swiper-wrapper">
        <c:forEach var="recent" items="${recentData}">
        <div class="swiper-slide " data-movie-cd="${recent.movieCd}">
                <img src="${recent.imageUrl}" alt="영화포스터">
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


<%@ include file="include/footer.jsp"%>
</body>
<script>
    var swiper = new Swiper('.firstswiper', {
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: 5,
        loop: true,
        autoHeight: true,
        autoWidth:true,
        spaceBetween:10,

        navigation: {
            nextEl: '.firstswiper .swiper-button-next',
            prevEl: '.firstswiper .swiper-button-prev',
        },
    });
</script>
</html>













