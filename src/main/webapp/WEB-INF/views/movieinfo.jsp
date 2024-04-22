<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <%@ include file="include/header-static.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/movieinfo.css">
    <title>Document</title>
</head>

<body>

<div class="scrollBar">

</div>

<div class="backSky">
    <svg class="sky"></svg>
</div>

<div class="movie">


    <div class="info-wrap">
        <img class="poster" src="${movie.imageUrl}">
        <div class="doc">
            <h1>${movie.movieName}</h1>

            <svg id="like" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                <path
                        d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z" />
            </svg>
            <p class="content">${movie.plot}</p>
            <div class="info">
                <div>
                    <h1>누적 관객수 :</h1>
                    <p>${movie.audiAcc}명</p>
                </div>
                <div>
                    <h1>장르 : </h1>
                    <p>
                        <c:forEach var="genre" items="${genres}">
                            ${genre.genreName} &nbsp;
                        </c:forEach>
                    </p>
                </div>
                <div>
                    <h1>출연 :</h1>
                    <p>
                        <c:forEach var="actor" items="${actors}">
                            ${actor.actorName} &nbsp;
                        </c:forEach>
                    </p>
                </div>
                <div>
                    <h1>감독 :</h1>
                    <p>${movie.director}</p>
                </div>
                <div>
                    <h1>국가 :</h1>
                    <p>${movie.nation}</p>
                </div>
                <div>
                    <h1>등급 :</h1>
                    <p>${movie.rating}</p>
                </div>
                <div>
                    <h1>개봉일 :</h1>
                    <p>${movie.openDate}</p>
                </div>
                <div>
                    <h1>러닝타임 :</h1>
                    <p>${movie.runtime}분</p>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="review-wrap">
    <div class="review-box">
        <div class="review">
            <!-- 리뷰별개수 창입니다 -->
            <div class="reple">
                <div class="reple-box">
                    <div class="reple-star">
                            <span class="star">
                            ★★★★★
                             <span>★★★★★</span>
                            <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                             </span>

                        <button class="reple-bt"> 코멘트 남기기 </button>
                    </div>
                    <div class="reple-item">
                        <select>
                            <option>공감순</option>
                            <option>최신순</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="swiper review-swiper-custom">
                <div class="swiper-wrapper">
                    <% for(int i=0;i<10;i++)  { %>
                    <div class="swiper-slide review-swiper">
                        <div class="review-container">
                            <div class="review-profile">
                                <div class="review-profile-img">
                                    <img src="" alt="프사">
                                    <p style="margin-left:5px; color:black;">이름</p>
                                </div>
                                <div class="review-profile-grade">
                                    <img src="/assets/img/3.png">
                                    <p style="margin-left:5px; color:black;">5.0</p>
                                </div>
                            </div>
                            <hr class="review-hr" />
                            <div class="review-text">
                                <p style="color:black !important;">리뷰 글</p>
                            </div>
                            <hr class="review-hr" />
                            <div class="review-sym">
                                <div class="review-thumb">
                                    <svg id="thumb" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M323.8 34.8c-38.2-10.9-78.1 11.2-89 49.4l-5.7 20c-3.7 13-10.4 25-19.5 35l-51.3 56.4c-8.9 9.8-8.2 25 1.6 33.9s25 8.2 33.9-1.6l51.3-56.4c14.1-15.5 24.4-34 30.1-54.1l5.7-20c3.6-12.7 16.9-20.1 29.7-16.5s20.1 16.9 16.5 29.7l-5.7 20c-5.7 19.9-14.7 38.7-26.6 55.5c-5.2 7.3-5.8 16.9-1.7 24.9s12.3 13 21.3 13L448 224c8.8 0 16 7.2 16 16c0 6.8-4.3 12.7-10.4 15c-7.4 2.8-13 9-14.9 16.7s.1 15.8 5.3 21.7c2.5 2.8 4 6.5 4 10.6c0 7.8-5.6 14.3-13 15.7c-8.2 1.6-15.1 7.3-18 15.2s-1.6 16.7 3.6 23.3c2.1 2.7 3.4 6.1 3.4 9.9c0 6.7-4.2 12.6-10.2 14.9c-11.5 4.5-17.7 16.9-14.4 28.8c.4 1.3 .6 2.8 .6 4.3c0 8.8-7.2 16-16 16H286.5c-12.6 0-25-3.7-35.5-10.7l-61.7-41.1c-11-7.4-25.9-4.4-33.3 6.7s-4.4 25.9 6.7 33.3l61.7 41.1c18.4 12.3 40 18.8 62.1 18.8H384c34.7 0 62.9-27.6 64-62c14.6-11.7 24-29.7 24-50c0-4.5-.5-8.8-1.3-13c15.4-11.7 25.3-30.2 25.3-51c0-6.5-1-12.8-2.8-18.7C504.8 273.7 512 257.7 512 240c0-35.3-28.6-64-64-64l-92.3 0c4.7-10.4 8.7-21.2 11.8-32.2l5.7-20c10.9-38.2-11.2-78.1-49.4-89zM32 192c-17.7 0-32 14.3-32 32V448c0 17.7 14.3 32 32 32H96c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H32z"/></svg>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
                <div class="swiper-pagination pagination_bullet"></div>
                <div class="swiper-pagination pagination_progress"></div>
            </div>



        </div>
    </div>
</div>
<%@ include file="include/footer.jsp"%>

<script>
    /* 리뷰별개수 */
    const drawStar = (target) => {
        document.querySelector(`.star span`).style.width = `\${target.value * 10}%`;
        let button = document.querySelector('.reple-bt');
        if(target.value>0){
            button.style.visibility = "visible";
        }else{
            button.style.visibility="hidden";
        }
        console.log(target.value);
    }


    const $sky = document.querySelector(".sky");

    // 브라우저 창 크기에 따른 별 생성
    window.onresize = () => {
        makeStars();
    }

    const makeStars = () => {
        // 브라우저 가장 큰 크기
        const maxSize = Math.max(window.innerWidth, window.innerHeight)

        // 랜덤한 X 위치 값
        const getRandomX = () => Math.random() * maxSize;

        // 랜덤한 Y 위치 값
        const getRandomY = () => Math.random() * maxSize;

        // 랜덤한 크기 (circle는 반지름이 크기)
        const randomRadius = () => Math.random() * 0.7 + 0.6;

        // 임의의 값
        const _size = Math.floor(maxSize / 2);

        const htmlDummy = new Array(_size).fill().map((_, i) => {
            return `<circle class='star'
        cx=\${getRandomX()}
        cy=\${getRandomY()}
        r=\${randomRadius()}
        className="star" />`
        }).join('');

        $sky.innerHTML = htmlDummy;
    }

    window.onload = () => {
        makeStars();
    }
</script>
<script>
    var reviewSwiper =new Swiper('.review-swiper-custom', {
        speed: 800, // 슬라이드 속도
        slidesPerView: 4, // 한 번에 보여질 슬라이드 수
        slidesPerGroup: 4,
        spaceBetween: 10, // 이미지 간격
        loop: false, // 슬라이드 루프 설정 비활성화
        pagination: {
            el: ".pagination_bullet",
            clickable: true,
            type: 'bullets',
            renderBullet: function (index, className) {
                return '<span class="' + className + '">' + (index + 1) + "</span>";
            },
        },
    })

    var like = document.getElementById("like")

    like.addEventListener('click', function () {
        like.classList.toggle('active')
    });

    var thumb = document.getElementById("thumb")

    thumb.addEventListener('click', function () {
        thumb.classList.toggle('active')
    });

</script>
</body>

</html>