<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <%@ include file="include/header-static.jsp"%>
    <title>Movie Mate | Main</title>
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/mainpage.css">
</head>

<body>
<%@ include file="include/header.jsp"%>
    <!-- 배경효과 -->
    <div class="backSky">
        <svg class="sky"></svg>
    </div>

    <section id="main">

        <h1 class="recommend-movie"></h1>
        <!-- 상단 메인 빅 배너 슬라이더 섹션 -->
        <div id="main-banner-slider" class="swiper-container">
            <ul class="banner-title swiper-wrapper">
                <c:forEach var="re" items="${recommend}">
                    <div class="banner-contents swiper-slide" data-movie-cd="${re.movieCd}">
                        <a href="/detail/${re.movieCd}"><img src="${re.imageUrl}" alt="장르별 영화 포스터"></a>
                    </div>
                </c:forEach>
            </ul>
            <div class="swiper-pagination"></div>
        </div>


        <!-- 찜 추천 -->
        <c:if test="${!empty recommendByWish}">
        <div class="test-container">
            <div class="genre swiper-container-list wishSwiper">
                <span class="genre-text">추천 픽</span>
                <div class="genre-movielist swiper-wrapper">
                    <c:forEach var="wish" items="${recommendByWish}">
                        <div class="movie-img-box swiper-slide" data-movie-cd="${wish.movieCd}">
                            <a href="/detail/${wish.movieCd}"><img src="${wish.imageUrl}" alt="장르별 영화 포스터"></a>
                            <p>${wish.movieName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev wish-prev" role="button"></button>

                <button class="list-next swiper-button-next wish-next" role="button"></button>
            </div>
        </div>
        </c:if>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="test-container">
            <div class="genre swiper-container-list sf">
                <span class="genre-text">SF</span>
                <a class="more-button" href="/category/sf">더보기&gt;</a>
                <div class="genre-movielist swiper-wrapper">
                    <c:forEach var="sf" items="${sf}">
                        <div class="movie-img-box swiper-slide" data-movie-cd="${sf.movieCd}">
                            <a href="/detail/${sf.movieCd}"><img src="${sf.imageUrl}" alt="장르별 영화 포스터"></a>
                            <p>${sf.movieName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev sf-prev" role="button"></button>

                <button class="list-next swiper-button-next sf-next" role="button"></button>
            </div>
        </div>

        <!-- 장르별 영화 목록 섹션 -->
        <div class="test-container">
            <div class="genre swiper-container-list family">
                <span class="genre-text">가족</span>
                <a class="more-button" href="/category/family">더보기&gt;</a>
                <div class="genre-movielist swiper-wrapper">
                    <c:forEach var="family" items="${family}">
                        <div class="movie-img-box swiper-slide" data-movie-cd="${family.movieCd}">
                            <a href="/detail/${family.movieCd}"><img src="${family.imageUrl}" alt="장르별 영화 포스터"></a>
                            <p>${family.movieName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
             <!-- 슬라이더 좌우 버튼 -->
             <div class="btn">
                <button class="list-prev swiper-button-prev family-prev" role="button"></button>
                <button class="list-next swiper-button-next family-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="test-container">
            <div class="genre swiper-container-list horror">
                <span class="genre-text">공포</span>
                <a class="more-button" href="/category/horror">더보기&gt;</a>
                <div class="genre-movielist swiper-wrapper">
                    <c:forEach var="horror" items="${horror}">
                        <div class="movie-img-box swiper-slide" data-movie-cd="${horror.movieCd}">
                            <a href="/detail/${horror.movieCd}"><img src="${horror.imageUrl}" alt="장르별 영화 포스터"></a>
                            <p>${horror.movieName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev" role="button"></button>

                <button class="list-next swiper-button-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="test-container">
            <div class="genre swiper-container-list drama">
                <span class="genre-text">드라마</span>
                <a class="more-button" href="/category/drama">더보기&gt;</a>
                <div class="genre-movielist swiper-wrapper">
                    <c:forEach var="drama" items="${drama}">
                        <div class="movie-img-box swiper-slide" data-movie-cd="${drama.movieCd}">
                            <a href="/detail/${drama.movieCd}"><img src="${drama.imageUrl}" alt="장르별 영화 포스터"></a>
                            <p>${drama.movieName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev drama-prev" role="button"></button>
                <button class="list-next swiper-button-next drama-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="test-container">
            <div class="genre swiper-container-list meloromance">
                <span class="genre-text">멜로/로맨스</span>
                <a class="more-button" href="/category/meloromance">더보기&gt;</a>
                <div class="genre-movielist swiper-wrapper">
                    <c:forEach var="meloromance" items="${meloromance}">
                        <div class="movie-img-box swiper-slide" data-movie-cd="${meloromance.movieCd}">
                            <a href="/detail/${meloromance.movieCd}"><img src="${meloromance.imageUrl}"
                                    alt="장르별 영화 포스터"></a>
                            <p>${meloromance.movieName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev meloromance-prev" role="button"></button>
                <button class="list-next swiper-button-next meloromance-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="test-container">
            <div class="genre swiper-container-list mystery">
                <span class="genre-text">미스터리</span>
                <a class="more-button" href="/category/mystery">더보기&gt;</a>
                <div class="genre-movielist swiper-wrapper">
                    <c:forEach var="mystery" items="${mystery}">
                        <div class="movie-img-box swiper-slide" data-movie-cd="${mystery.movieCd}">
                            <a href="/detail/${mystery.movieCd}"><img src="${mystery.imageUrl}" alt="장르별 영화 포스터"></a>
                            <p>${mystery.movieName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev mystery-prev" role="button"></button>
                <button class="list-next swiper-button-next mystery-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="test-container">
            <div class="genre swiper-container-list crime">
                <span class="genre-text">범죄</span>
                <a class="more-button" href="/category/crime">더보기&gt;</a>
                <div class="genre-movielist swiper-wrapper">
                    <c:forEach var="crime" items="${crime}">
                        <div class="movie-img-box swiper-slide" data-movie-cd="${crime.movieCd}">
                            <a href="/detail/${crime.movieCd}"><img src="${crime.imageUrl}" alt="장르별 영화 포스터"></a>
                            <p>${crime.movieName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev crime-prev" role="button"></button>
                <button class="list-next swiper-button-next crime-next" role="button"></button>
            </div>
        </div>


        <div class="test-container">
            <!-- 장르별 영화 목록 섹션 -->
            <div class="genre swiper-container-list thriller">
                <span class="genre-text">스릴러</span>
                <a class="more-button" href="/category/thriller">더보기&gt;</a>
                <div class="genre-movielist swiper-wrapper">
                    <c:forEach var="thriller" items="${thriller}">
                        <div class="movie-img-box swiper-slide" data-movie-cd="${thriller.movieCd}">
                            <a href="/detail/${thriller.movieCd}"><img src="${thriller.imageUrl}" alt="장르별 영화 포스터"></a>
                            <p>${thriller.movieName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev thriller-prev" role="button"></button>
                <button class="list-next swiper-button-next thriller-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="test-container">
            <div class="genre swiper-container-list action">
                <span class="genre-text">액션</span>
                <a class="more-button" href="/category/action">더보기&gt;</a>
                <div class="genre-movielist swiper-wrapper">
                    <c:forEach var="action" items="${action}">
                        <div class="movie-img-box swiper-slide" data-movie-cd="${action.movieCd}">
                            <a href="/detail/${action.movieCd}"><img src="${action.imageUrl}" alt="장르별 영화 포스터"></a>
                            <p>${action.movieName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev action-prev" role="button"></button>
                <button class="list-next swiper-button-next action-next" role="button"></button>
            </div>
        </div>


        <!-- 장르별 영화 목록 섹션 -->
        <div class="test-container">
            <div class="genre swiper-container-list adventure">
                <span class="genre-text">어드벤처</span>
                <a class="more-button" href="/category/adventure">더보기&gt;</a>
                <div class="genre-movielist swiper-wrapper">
                    <c:forEach var="adventure" items="${adventure}">
                        <div class="movie-img-box swiper-slide" data-movie-cd="${adventure.movieCd}">
                            <a href="/detail/${adventure.movieCd}"><img src="${adventure.imageUrl}" alt="장르별 영화 포스터"></a>
                            <p>${adventure.movieName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
                <button class="list-prev swiper-button-prev adventure-prev" role="button"></button>
                <button class="list-next swiper-button-next adventure-next" role="button"></button>
            </div>
        </div>


    </section>

    <!-- 화면 상단 이동 버튼 -->
    <a href="#">
        <div class="up-btn">▲</div>
    </a>


    <%@ include file="include/footer.jsp"%>
</body>
<script src="/assets/js/mainpage.js" defer></script>
</html>