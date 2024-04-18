<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/src/main/resources/static/assets/css/reset.css">
    <link rel="stylesheet" href="/src/main/resources/static/assets/css/movieinfo.css">
    <script src="../../../resources/static/assets/js/movieinfo.js" defer></script>
    <title>Document</title>
</head>

<body>

    <div class="scrollBar">

    </div>

    <div class="backSky">
        <svg class="sky"></svg>
    </div>

    <div class="movie">
        <div class="image">
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
            <img class="poster" src="/build/resources/main/static/assets/img/2.png">
            <div class="doc">
                <h1>모가디슈</h1>
                <p class="content">내전으로 고립된 낯선 도시, 모가디슈. 지금부터 우리의 목표는 오로지 생존이다! 대한민국이 UN가입을 위해 동분서주하던 시기. 1991년 소말리아의 수도
                    모가디슈에서는 일촉즉발의 내전이 일어난다. 통신마저 끊긴 그 곳에 고립된 대한민국 대사관의 직원과 가족들은 총알과 포탄이 빗발치는 가운데, 살아남기 위해 하루하루를 버텨낸다.
                    그러던 어느 날 밤, 북한 대사관의 일행들이 도움을 요청하며 문을 두드리는데... 목표는 하나, 모가디슈에서 탈출해야 한다!</p>
                <div class="info">
                    <div>
                        <h1>개요 :</h1>
                        <p>개요 내용</p>
                    </div>
                    <div>
                        <h1>장르 :</h1>
                        <p>장르 내용</p>
                    </div>
                    <div>
                        <h1>출연 :</h1>
                        <p>출연진 내용</p>
                    </div>
                    <div>
                        <h1>감독 :</h1>
                        <p>감독 내용</p>
                    </div>
                    <div>
                        <h1>국가 :</h1>
                        <p>국가 내용</p>
                    </div>
                    <div>
                        <h1>등급 :</h1>
                        <p>등급 내용</p>
                    </div>
                    <div>
                        <h1>개봉일 :</h1>
                        <p>개봉일 내용</p>
                    </div>
                    <div>
                        <h1>러닝타임 :</h1>
                        <p>러닝타임 내용</p>
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
            <img class="first" src="/build/resources/main/static/assets/img/4.png">
            <div class="line"></div>
            <img class="pre" src="/build/resources/main/static/assets/img/5.png">
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
            <img class="next" src="/build/resources/main/static/assets/img/5.png">
            <div class="line"></div>
            <img class="last" src="/build/resources/main/static/assets/img/4.png">
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
        cx=${getRandomX()}
        cy=${getRandomY()}
        r=${randomRadius()}
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