<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>
    <%@ include file="include/header-static.jsp"%>
    <link rel="stylesheet" href="/assets/css/search.css">
</head>

<body>
    <%@ include file="include/header.jsp"%>

    <section id="search">

        <h2 class="searchResult">(으)로 검색한 결과입니다.</h2>
            
        <!-- 검색 목록 섹션: 감독 -->
        <div class="genre swiper-container-list">
            <div class="genre-movielist swiper-wrapper">
                
                    <div class="movie-img-box swiper-slide" data-movie-cd="">
                        <a href=""><img src="/assets/img/2.png" alt="검색 영화 포스터"></a>
                        <p>영화이름</p>
                    </div>
                
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
    <script src="/assets/js/mainpage.js"></script>
</body>


</html>