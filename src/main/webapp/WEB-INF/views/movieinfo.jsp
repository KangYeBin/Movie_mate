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
    <script src="/assets/js/movieinfo.js" defer></script>
    <title>Document</title>
</head>

<body>
<%@ include file="include/header.jsp"%>
<div class="scrollBar"></div>


<div class="movie">
    <div class="info-wrap">
        <img class="poster" src="${movie.imageUrl}">
        <div class="doc">
            <h1>${movie.movieName}</h1>

            <c:if test="${isWish}">
                <svg id="like" data-bon="0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="active">
                    <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path
                            d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z" />
                </svg>
            </c:if>
            <c:if test="${!isWish}">
                <svg id="like" data-bon="0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path
                            d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z" />
                </svg>
            </c:if>

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
                        <div class="reple-star-bt">
                            <button class="reple-bt" onclick="openModal()"> 후기작성 </button>
                        </div>
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
                <div class="swiper-wrapper" id="reviewData">

                    <!--
                        renderReviews에서 태그 추가
                    -->

                </div>
                <div class="swiper-pagination pagination_bullet"></div>
                <div class="swiper-pagination pagination_progress"></div>
            </div>
        </div>
    </div>
</div>

<!-- 모달 -->
<div id="reviewModal" class="modal">
    <div class="modal-content">
        <div class="modalbox">
            <div class="box">
                <!-- <div id="pro"><svg id="user" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"> 프로필</div> -->
                <span class="star-modal">
                        ★★★★★
                        <span>★★★★★</span>
                    </span>
                <span class="close" onclick="closeReviewModal()">&times;</span>

            </div>

            <form id="review-form" class="profile">
                <textarea class="text" type="text" id="text" placeholder="리뷰를 작성해주세요"></textarea>
                <div id="reviewContent"></div>
                <div class="register">
                    <input type="submit" id="register" class="first btn" value="등록">
                </div>
            </form>
        </div>
    </div>

</div>



<%@ include file="include/footer.jsp"%>

<script>
    /* 리뷰별개수 */
    const drawStar = (target) => {
        document.querySelector(`.star span`).style.width = `\${target.value * 10}%`;
        document.querySelector(`.star-modal span`).style.width = `\${target.value * 10}%`;
        let button = document.querySelector('.reple-bt');
        if (target.value > 0) {
            button.style.visibility = "visible";
        } else {
            button.style.visibility = "hidden";
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
    var reviewSwiper = new Swiper('.review-swiper-custom', {
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


    //찜 추가,삭제
    var like = document.getElementById("like");
    like.addEventListener('click', function () {
        like.classList.toggle('active');
        if(like.classList.contains("active")){
            fetch("/wish/${sessionScope.login.userId}/${movie.movieCd}", {
                method: 'post',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
        }else{
            fetch("/wish/${sessionScope.login.userId}/${movie.movieCd}", {
                method: 'delete',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
        }
    });

    // 후기 좋아요 추가,삭제
    var thumb = document.querySelectorAll('.thumb');
    thumb.forEach(e => {
        e.addEventListener('click', function () {
            e.classList.toggle('active')
        });
    })
</script>
<script>
    // 모달 열기 버튼
    var openModalBtn = document.getElementById("reple-bt");

    // 모달
    var modal = document.getElementById("reviewModal");

    // 모달 닫기 버튼
    var closeModalBtn = document.getElementsByClassName("close")[0];

    // 모달 바깥을 클릭하면 모달이 닫히도록 함
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    // 모달 열기 버튼에 클릭 이벤트 리스너 추가
    function openModal() {
        modal.style.display = "block";
    }
    // 모달 닫기 버튼에 클릭 이벤트 리스너 추가
    function closeReviewModal() {
        modal.style.display = "none";
    }
</script>
<script>
    const movieCd = '${movie.movieCd}';
    const URL = '/api/v1/review';

    function renderReviews(reviews) {
        console.log(reviews);

        const {
            movieCd,
            dto
        } = reviews;
        console.log(dto);

        let tag = '';
        if (dto != null && dto.length > 0) {

            for (let review of dto) {
                const {
                    reviewId,
                    userId,
                    movieCd,
                    reviewDate,
                    text,
                    sympathyCnt,
                    grade,
                    movieName,
                    email,
                    profile
                } = review;
                console.log(review);

                tag += `

                            <div class="swiper-slide review-swiper">
                                <div class="review-container">
                                    <div class="review-profile">
                                        <div class="review-profile-img">
                                            <img src="\${profile}" alt="프사">
                                            <p style="margin-left:5px; color:black;">\${email}</p>
                                        </div>
                                        <div class="review-profile-grade">
                                            <img src="/assets/img/3.png">
                                            <p style="margin-left:5px; color:black;">\${grade}</p>
                                        </div>
                                    </div>
                                    <hr class="review-hr" />
                                    <div class="review-text">
                                        <p style="color:black !important;">\${text}</p>
                                    </div>
                                    <hr class="review-hr" />
                                    <div class="review-sym">
                                        <div class="review-thumb">
                                            <svg class="thumb" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                                <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                                <path
                                                    d="M313.4 32.9c26 5.2 42.9 30.5 37.7 56.5l-2.3 11.4c-5.3 26.7-15.1 52.1-28.8 75.2H464c26.5 0 48 21.5 48 48c0 18.5-10.5 34.6-25.9 42.6C497 275.4 504 288.9 504 304c0 23.4-16.8 42.9-38.9 47.1c4.4 7.3 6.9 15.8 6.9 24.9c0 21.3-13.9 39.4-33.1 45.6c.7 3.3 1.1 6.8 1.1 10.4c0 26.5-21.5 48-48 48H294.5c-19 0-37.5-5.6-53.3-16.1l-38.5-25.7C176 420.4 160 390.4 160 358.3V320 272 247.1c0-29.2 13.3-56.7 36-75l7.4-5.9c26.5-21.2 44.6-51 51.2-84.2l2.3-11.4c5.2-26 30.5-42.9 56.5-37.7zM32 192H96c17.7 0 32 14.3 32 32V448c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32V224c0-17.7 14.3-32 32-32z" />
                                            </svg>
                                            <p class="thumb-cnt">\${sympathyCnt}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                    `;


            }
        } else {
            tag += `<div style="color:white;" class="swiper-slide review-swiper">작성된 후기가 없습니다</div>`;
        }

        document.getElementById('reviewData').innerHTML = tag;

    }

    //후기 별찍기
    document.getElementById("review-form").addEventListener("submit", e => {
        e.preventDefault();
        const req = {
            text: document.getElementById("text").value,
            userId: '${sessionScope.login.userId}',
            movieCd: '${movie.movieCd}',
            grade: document.querySelector('input[type="range"]').value / 2,
            profile: '${sessionScope.login.profile}',
            movieName: '${movie.movieName}'
        }

        fetch("/api/v1/review/create", {
            method: 'post',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(req)
        })
            .then(res => {
                console.log(res.status);
                if (res.status == 200) {
                    alert("후기가 등록되었습니다");
                    return res.text();
                }
            })
            .then(data => {
                console.log('응답 성공 : ', data);
                fetchGetReviews();
            })

        closeReviewModal();
    })

    function fetchGetReviews() {
        fetch(`\${URL}/detail/\${movieCd}/reviews`)
            .then(res => res.json())
            .then(reviews => {
                console.log('reviews : ' + reviews);
                renderReviews(reviews);
                reviewSwiper.update();
            })
    }

    (() => {
        fetchGetReviews();
    })();




</script>
</body>

</html>