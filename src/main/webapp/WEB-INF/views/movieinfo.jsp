<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
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
        <div class="image" style="background: url(${movie.stillUrl}) center no-repeat; ">
            <div class="content-wrap">
                <div class="zzim-wrap">
                    <label>
                        <input role="switch" type="checkbox" />
                        <p>찜</p>
                    </label>
                </div>
            </div>

        </div>

        <div class="info-wrap">
            <img class="poster" src="${movie.imageUrl}">
            <div class="doc">
                <h1>${movie.movieName}</h1>
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
                    <span class="star">
                        ★★★★★
                        <span>★★★★★</span>
                        <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                    </span>

                    <p class="nickname">닉네임</p>
                    <p class="content">후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.</p>
                    <p class="time">작성시간</p>
                </div>

                <div class="reple">
                    <span class="star">
                        ★★★★★
                        <span>★★★★★</span>
                        <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                    </span>

                    <p class="nickname">닉네임</p>
                    <p class="content">후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.</p>
                    <p class="time">작성시간</p>
                </div>


                <div class="reple">
                    <span class="star">
                        ★★★★★
                        <span>★★★★★</span>
                        <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                    </span>

                    <p class="nickname">닉네임</p>
                    <p class="content">후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.</p>
                    <p class="time">작성시간</p>
                </div>

                <div class="reple">
                    <span class="star">
                        ★★★★★
                        <span>★★★★★</span>
                        <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                    </span>

                    <p class="nickname">닉네임</p>
                    <p class="content">후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.</p>
                    <p class="time">작성시간</p>
                </div>

                <div class="reple">
                    <span class="star">
                        ★★★★★
                        <span>★★★★★</span>
                        <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                    </span>

                    <p class="nickname">닉네임</p>
                    <p class="content">후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.</p>
                    <p class="time">작성시간</p>
                </div>

                <div class="reple">
                    <span class="star">
                        ★★★★★
                        <span>★★★★★</span>
                        <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                    </span>

                    <p class="nickname">닉네임</p>
                    <p class="content">후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.</p>
                    <p class="time">작성시간</p>
                </div>

                <div class="reple">
                    <span class="star">
                        ★★★★★
                        <span>★★★★★</span>
                        <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                    </span>

                    <p class="nickname">닉네임</p>
                    <p class="content">후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.</p>
                    <p class="time">작성시간</p>
                </div>

               

            </div>
        </div>

        <div class="paging">
            <img class="first" src="/assets/img/4.png">
            <div class="line"></div>
            <img class="pre" src="/assets/img/5.png">
            <div class="page-list">
                <p>1</p>
                <p>2</p>
                <p>3</p>
                <p>4</p>
                <p>5</p>
                <p>6</p>
                <p>7</p>
                <p>8</p>
                <p>9</p>
                <p>10</p>
            </div>
            <img class="next" src="/assets/img/5.png">
            <div class="line"></div>
            <img class="last" src="/assets/img/4.png">
        </div>
    </div>

    <script>
        /* 리뷰별개수 */
        const drawStar = (target) => {
            document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
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

</body>

</html>