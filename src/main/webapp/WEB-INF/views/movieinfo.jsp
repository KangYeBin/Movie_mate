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
    <title>Movie Mate | Detail</title>
</head>

<body>
<%@ include file="include/header.jsp"%>


<div class="movie">
    <div class="info-wrap">
        <img class="poster" src="${movie.imageUrl}">
        <button class="teaser" onclick="openTeasermodal()" >영화티저</button>
        <div class="doc">
            <h1>${movie.movieName}</h1>
        <div class="symnum" id="symcnt">${movie.wishCnt}</div>
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
                        <select id="selectbox" onchange="selectChanged()">
                            <option value="sympathyCnt">공감순</option>
                            <option value="grade">별점순</option>
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
                <div id="changetext"></div>
                <div class="register">
                    <input type="submit" id="register" class="first btn" value="등록">
                </div>
            </form>
        </div>
    </div>

</div>

<!-- 티저모달 -->
<div id="teaserModal" class="modal-teaser">
    <!-- Modal content -->
    <div class="modal-content-teaser">
        <div class="teasermovie">
            <c:if test="${!empty movie.vodUrl}">
            <iframe src="${movie.vodUrl}" title="teaser" width="900px" height="100%">
            </iframe>
            </c:if>
            <c:if test="${empty movie.vodUrl}">
            <video src="/assets/img/teasermovie.mp4" width="900px" height="100%" autoplay>
            </video>
            </c:if>
        </div>
    </div>
</div>
<%@ include file="include/footer.jsp"%>

</body>
<script>
    const movieCd = '${movie.movieCd}';
    const URL = '/api/v1/review';
    var sort = 'sympathyCnt'

    //후기 작성
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
                if (res.status == 200) {
                    alert("후기가 등록되었습니다");
                    document.querySelector('input[type="range"]').value = 1;
                    document.querySelector(`.star span`).style.width = `0%`;
                    document.querySelector(`.star-modal span`).style.width = `0%`;
                    return res.text();
                }
            })
            .then(data => {
                console.log('응답 성공 : ', data);
                document.getElementById('reviewData').innerHTML = '';
                fetchGetReviews();

            })

        closeReviewModal();
    })

    function fetchGetReviews() {
        fetch(URL+"/detail/"+movieCd+"/reviews/"+sort)
            .then(res => res.json())
            .then(reviews => {
                console.log('reviews : ' + reviews);

                const {
                    movieCd,
                    dto
                } = reviews; 

                if (dto.length == 0) {
                    document.getElementById('reviewData').innerHTML = 
                    `<div style="color:white; font-size: 20px;" class="swiper-wrapper">작성한 후기가 없습니다</div>`;
                }

                (async function() {
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

                        console.log("reviewId", reviewId);

                        await fetch(URL+"/"+reviewId)
                            .then(res => res.text())
                            .then(isSympathy => {
                            console.log(isSympathy);

                            renderReviews(review, isSympathy);
                        })

                    }
        
                })();
    
            })
    }

    (() => {
        fetchGetReviews();
    })();

    //찜
    var like = document.getElementById("like")
    var likeCnt = ${movie.wishCnt};
    like.addEventListener('click', function () {
        like.classList.toggle('active')
        if (like.classList.contains('active')) {
            fetch("/wish/${sessionScope.login.userId}/"+movieCd,{
                method: 'post'
            }).then(res=>{
                if(res.ok){
                    console.log("찜");
                    likeCnt += 1;
                    document.getElementById('symcnt').textContent = likeCnt;
                }else{
                    console.log(err);
                }
            })

        }else{
            fetch("/wish/${sessionScope.login.userId}/"+movieCd,{
                method: 'delete'
            }).then(res=>{
                if(res.ok){
                    console.log("찜 취소");
                    likeCnt -= 1;
                    document.getElementById('symcnt').textContent = likeCnt;
                }else{
                    console.log(err);
                }
            })
        }
    });


    // 정렬
    function selectChanged() {
        var selectedItem = document.getElementById('selectbox');
        var selectValue = selectedItem.options[selectedItem.selectedIndex].value;
        sort = selectValue;
        document.getElementById('reviewData').innerHTML = '';
        fetchGetReviews();
    }
    document.getElementById('')



    // 좋아요 버튼 클릭 이벤트 핸들러
    document.getElementById('reviewData').addEventListener('click', e => {
        console.log('reviewData 이벤트 발생!');
        console.log('이벤트 타겟: ', e.target);
        if (!e.target.matches('.review-container .review-sym svg.thumb path')) {
            return;
        }        
        console.log('따봉 이벤트 발생!');

        const reviewId = e.target.closest('div.review-container').dataset.bno;
        console.log('리뷰글 번호: ', reviewId);

        const currentLoginId = '${login.userId}';
        console.log('현재 로그인 사용자 아이디: ', currentLoginId);

        const userId = e.target.closest('div.review-container').dataset.userid;
        console.log('리뷰 작성자 아이디: ', userId);

        if (userId == currentLoginId) {
            return;
        }

        const $thumb = e.target.parentNode;
        const $thumbCnt = e.target.parentNode.nextElementSibling;
        console.log('thumb요소: ', $thumb);
        console.log('thumbCnt: ', $thumbCnt);

        if (e.target.closest('.thumb.active')) {
            console.log('좋아요를 이미 누름!');

            fetch('/sympathy', {
                method: 'DELETE',
                headers: {
                'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    reviewId,
                    movieCd,
                    'userId': currentLoginId
                })
            })
            .then(res => {
                if (res.status === 200) {
                    console.log('비동기 요청 성공');
                    $thumb.classList.remove('active');
                    $thumbCnt.textContent = (+$thumbCnt.textContent) - 1;
                }
            });

        } else {
            console.log('좋아요를 처음 누름!');
            fetch('/sympathy', {
                method: 'POST',
                headers: {
                'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    reviewId,
                    movieCd,
                    'userId': currentLoginId
                })
            })
            .then(res => {
                if (res.status === 200) {
                    console.log('비동기 요청 성공');
                    $thumb.classList.add('active');
                    $thumbCnt.textContent = (+$thumbCnt.textContent) + 1;
                }
            });
        }

    })

</script>

</html>