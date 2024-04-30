<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Movie Mate | MY</title>
    <%@ include file="include/header-static.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/assets/css/mypage.css">
</head>

<body>
    <%@ include file="include/header.jsp"%>

    <!-- 중앙 내 정보 -->
    <main>
        <div class="container">
            <div class="profile-contents">
                <div class="profile-box">
                    <img src="${sessionScope.login.profile}" alt="프사">
                </div>
                <div class="description">
                    <h3>${sessionScope.login.email}</h3>
                    <h1>${sessionScope.login.nickName}</h1>
                    <p>님의 마이페이지</p>
                    <button class="withdraw-button">회원 탈퇴</button>
                </div>
            </div>
        </div>
    </main>



    <div>
        <div class="content-list">
            <h1>내가 찜한 영화</h1>

            <c:if test="${empty movie}">
                <div style="color:white; font-size: 20px; margin-left: 80px; " class="swiper-wrapper">찜한 영화가 없습니다</div>
            </c:if>

            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <c:forEach var="movie" items="${movie}">
                        <div class="swiper-slide" data-movie-cd="${movie.movieCd}">
                            <a href="/detail/${movie.movieCd}"><img src="${movie.imageUrl}" alt="영화 포스터"></a>

                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </div>

    <div class="review-list">
        <h1>내가 쓴 후기</h1>

        <c:if test="${empty review}">
            <div style="color:white; font-size: 20px;" class="swiper-wrapper">작성한 후기가 없습니다</div>
        </c:if>

        <div class="swiper review-swiper-custom">
            <div class="swiper-wrapper">

                <c:forEach var="review" items="${review}">
                    <div class="swiper-slide review-swiper review-box" data-index="${review.reviewId}" data-grade="${review.grade}">
                        <div class="review-container">
                                <div class="review-profile">
                                    <div class="review-profile-img">
                                        <p style="margin-left:5px; color:black;" onclick="location.href='/detail/${review.movieCd}'">${review.movieName}</p>
                                    </div>
                                    <div class="review-profile-grade">
                                        <p>★<p>
                                                <p style="margin-left:5px; color:black;" >${review.grade}</p>
                                    </div>
                                </div>
                                <hr />
                                <div class="review-text">
                                    <p style="color:#aaa !important;" class="review-contents">${review.text}</p>
                                </div>
                                <hr />
                                <div class="review-sym">
                                    <div class="sym-box">
                                        <svg class="thumb" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                            <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                            <path
                                                d="M313.4 32.9c26 5.2 42.9 30.5 37.7 56.5l-2.3 11.4c-5.3 26.7-15.1 52.1-28.8 75.2H464c26.5 0 48 21.5 48 48c0 18.5-10.5 34.6-25.9 42.6C497 275.4 504 288.9 504 304c0 23.4-16.8 42.9-38.9 47.1c4.4 7.3 6.9 15.8 6.9 24.9c0 21.3-13.9 39.4-33.1 45.6c.7 3.3 1.1 6.8 1.1 10.4c0 26.5-21.5 48-48 48H294.5c-19 0-37.5-5.6-53.3-16.1l-38.5-25.7C176 420.4 160 390.4 160 358.3V320 272 247.1c0-29.2 13.3-56.7 36-75l7.4-5.9c26.5-21.2 44.6-51 51.2-84.2l2.3-11.4c5.2-26 30.5-42.9 56.5-37.7zM32 192H96c17.7 0 32 14.3 32 32V448c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32V224c0-17.7 14.3-32 32-32z" />
                                            </svg>
                                        <p class="thumb-cnt">${review.sympathyCnt}</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </div>

    <!-- 리뷰 모달 -->
    <div id="reviewModal" class="modal" data-reviewNum="" data-grade="">
        <div class="modal-content">
            <span class="close" onclick="closeReviewModal()">&times;</span>
            <h2 style="margin-bottom:10px;">리뷰 상세보기</h2>
            <hr />
            <span class="star">
                                            ★★★★★
                                            <span>★★★★★</span>
                                            <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                                        </span>
            <div id="reviewContent" class="review-content"></div>

            <div class="button-group">

                <button class="delete-button" onclick="deleteReview(event)">삭제</button>
                <button class="edit-button" onclick="editReview()">수정</button>
            </div>
        </div>
    </div>



    <%@ include file="include/footer.jsp"%>




    <script>

       // 회원탈퇴
               document.querySelector('.withdraw-button').addEventListener('click', function () {
                   var result = confirm("정말로 회원을 탈퇴하시겠습니까?");
                   if (result) {
                       console.log("사용자가 회원 탈퇴 확인을 선택했습니다.");
                       location.href = '/${sessionScope.login.loginPath}/delete';

                       alert("회원 탈퇴가 완료되었습니다."); // 예시로 경고창을 표시

                   } else {
                       console.log("사용자가 회원 탈퇴를 취소했습니다.");
                       // 취소를 선택한 경우: 동작x
                       return;
                   }
               });





        // 스위퍼
        new Swiper('.swiper-container', {
            speed: 800, // 슬라이드 속도
            slidesPerView: 5, // 한 번에 보여질 슬라이드 수
            spaceBetween: 10, // 이미지 간격
            loop: false, // 슬라이드 루프 설정 비활성화
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });

      new Swiper('.review-swiper-custom', {
            speed: 800, // 슬라이드 속도
            slidesPerView: 5, // 한 번에 보여질 슬라이드 수
            spaceBetween: 10, // 이미지 간격
            loop: false, // 슬라이드 루프 설정 비활성화
            navigation: {
                nextEl: '.review-swiper-custom .swiper-button-next',
                prevEl: '.review-swiper-custom .swiper-button-prev',
            },
        });




        // 닫기
        function closeReviewModal() {
            var modal = document.getElementById("reviewModal");
            modal.style.display = "none";
        }

        // 리뷰 박스 클릭 이벤트 등록
        var reviewBoxes = document.querySelectorAll('.review-box');
        reviewBoxes.forEach(function (box) {
            // 리뷰 텍스트 요소만 이벤트를 등록하도록 변경
            var reviewText = box.querySelector('.review-text');
            reviewText.addEventListener('click', function (event) {
                var index = box.getAttribute('data-index');
                var grade = box.getAttribute('data-grade');
                openReviewModal(index,grade);
                event.stopPropagation(); // 부모 요소의 클릭 이벤트 막기
            });
        });


        // 모달 열때 내용 보여주기
        function openReviewModal(index,grade) {
            var reviewContent = document.querySelector('.swiper-slide[data-index="' + index + '"] .review-text')
                .textContent;
            document.getElementById("reviewContent").innerHTML = reviewContent;
            var modal = document.getElementById("reviewModal");
            modal.dataset.reviewnum = index;
            modal.dataset.grade = grade;
            modal.style.display = "block";
        }


        // 삭제 버튼 클릭 이벤트 핸들러
        function deleteReview(event) {
            var reviewId = document.getElementById("reviewModal").dataset.reviewnum;
            var result = confirm("정말로 삭제하시겠습니까?");
            // 확인 버튼을 눌렀을 때
            if (result) {
                fetch("/api/v1/review/del/" + reviewId,{
                    method: 'delete',
                    headers: {
                                 'Content-Type': 'application/json'
                              },
                }).then(res => {
                        if (res.ok) {
                            console.log('삭제 성공');
                        } else {
                            throw new Error('삭제 요청에 실패했습니다.');
                        }
                    })
                    .then(data => {
                        window.location.reload();
                    })
                    .catch(error => {
                        console.error('오류 발생:', error);
                    })
            } else {
                console.log("삭제가 취소되었습니다.");
            }
        }
        var value;
        const drawStar = (target) => {
                                        document.querySelector(`.star span`).style.width = `\${target.value * 10}%`;
                                        value=target.value;
                                    }


        // 수정 버튼 클릭 시 폼창 만들기
        function editReview() {
            var reviewText = document.querySelector('.review-content');
            var reviewTextContent = reviewText.textContent.trim();
            var reviewId = document.getElementById("reviewModal").dataset.reviewnum;
            var grade = document.getElementById("reviewModal").dataset.grade;
            document.querySelector('.star').style.visibility='visible';
            document.querySelector('.star span').style.width = `\${grade*2*10}%`;
            value = grade*2;

            var form = document.createElement('form');
            form.setAttribute('id', 'editForm');

            // 텍스트 입력 창
            var textarea = document.createElement('textarea');
            textarea.setAttribute('id', 'editTextArea');
            textarea.textContent = reviewTextContent;

            // 저장 버튼 생성
            var saveButton = document.createElement('button');
            saveButton.textContent = '저장';
            saveButton.setAttribute('type', 'button');
            saveButton.classList.add('save-button'); //
            saveButton.addEventListener('click', function () {
                const modify = {
                    text : textarea.value,
                    grade : value/2,
                }

                if (confirm("저장 하시겠습니까?")) {
                    fetch("/api/v1/review/mod/" + reviewId, {
                            method: 'put',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(modify)
                        })
                        .then(res => {
                            if (res.ok) {
                                console.log('수정 성공');
                            } else {
                                throw new Error('수정 요청에 실패했습니다.');
                            }
                        })
                        .then(data => {
                            window.location.reload();
                        })
                        .catch(error => {
                            console.error('오류 발생:', error);
                        });
                } else {

                    closeReviewModal();
                }
            });


            // 모달 창 내용 교체
            reviewText.innerHTML = '';
            reviewText.appendChild(form);
            form.appendChild(textarea);
            form.appendChild(saveButton);

            // 수정 버튼 및 삭제 버튼 숨기기
            var editButton = document.querySelector('.edit-button');
            var deleteButton = document.querySelector('.delete-button');
            editButton.classList.add('hidden');
            deleteButton.classList.add('hidden');
        }

        // 닫기
        function closeReviewModal() {
            var modal = document.getElementById("reviewModal");
            modal.style.display = "none";
            document.querySelector('.star').style.visibility = 'hidden';
            // 삭제 및 수정 버튼 보이기
            var editButton = document.querySelector('.edit-button');
            var deleteButton = document.querySelector('.delete-button');
            editButton.classList.remove('hidden');
            deleteButton.classList.remove('hidden');
        }



    </script>
</body>

</html>