<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Movie Mate</title>
    <%@ include file="include/header-static.jsp"%>
    <link rel="stylesheet" href="/assets/css/login.css">
</head>
<body>

    <div class="log-container">
        <div class="bg-video">
            <img src="/assets/img/login.png">
        </div>

        <div class="log-head">
            <img src="/assets/img/logo.png" alt="">
        </div>

        <div class="rolling-box">
            <div class="rolling-box-title">
                <h1>최신 박스오피스</h1>

            </div>

            <div class="swiper loginSwiper">
                <div class="swiper-wrapper">
                    <c:forEach var="recent" items="${recent}">
                        <div class="swiper-slide custom-slide" data-movie-cd="${recent.movieCd}">
                            <img src="${recent.imageUrl}" alt="영화포스터" class="movie-img">
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>


        <div class="log-box">
            <div class ="log-box-contents">
                <div class="title">
                    <h1>서비스 계정 로그인</h1>
                </div>
                <div class="log-path log-path-kakao" onclick="location.href='/kakao/login'">
                    <img src="../assets/img/kakaotest.png" height="50" width="50"  >
                    <h1>카카오로 시작하기</h1>
                </div>
                <div class="log-path log-path-naver" onclick="location.href='/naver/login'">
                    <img src="../assets/img/navertest.png" height="50" width="50" >
                    <h1>네이버로 시작하기</h1>
                </div>
                <div class="log-path log-path-google" onclick="location.href='/google/login'">
                    <img src="../assets/img/googletest.png" height="50" width="50" >
                    <h1>구글로 시작하기</h1>
                </div>

            </div>
        </div>
        <%@ include file="include/footer.jsp"%>
    </div>


</body>

<script>
    var login = new Swiper('.loginSwiper', {
        loop: true,
        slidesPerView : 'auto',
        spaceBetween:10,
        autoplay: {
            delay: 0,
        },
        speed: 6000,

    });
</script>
</html>













