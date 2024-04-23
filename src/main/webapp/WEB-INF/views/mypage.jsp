<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Movie Mate</title>
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
            <img src="${sessionScope.login.profile}" alt="프사" >
            </div>
            <div class="description">
                <h3>${sessionScope.login.email}</h3>
                <h1>${sessionScope.login.nickName}</h1>
                <p>님의 마이페이지</p>
            </div>
           </div>
        </div>
    </main>



    <div>
        <div class="content-list">
            <h1>내가 찜한 영화</h1>

            <div class="swiper-container">
                <div class="swiper-wrapper">

                    <div class="swiper-slide">
                        <a href="detail_page.html">
                            <div class="slide-inner">
                                <img src="https://via.placeholder.com/240x360" alt="Poster 1">
                            </div>
                            <div class="slide-inner">
                                <img src="https://via.placeholder.com/240x360" alt="Poster 2">
                            </div>
                            <div class="slide-inner">
                                <img src="https://via.placeholder.com/240x360" alt="Poster 3">
                            </div>
                            <div class="slide-inner">
                                <img src="https://via.placeholder.com/240x360" alt="Poster 4">
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-inner">
                            <img src="https://via.placeholder.com/240x360" alt="Poster 4">
                        </div>
                        <div class="slide-inner">
                            <img src="https://via.placeholder.com/240x360" alt="Poster 5">
                        </div>
                        <div class="slide-inner">
                            <img src="https://via.placeholder.com/240x360" alt="Poster 6">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-inner">
                            <img src="https://via.placeholder.com/240x360" alt="Poster 7">
                        </div>
                        <div class="slide-inner">
                            <img src="https://via.placeholder.com/240x360" alt="Poster 8">
                        </div>
                        <div class="slide-inner">
                            <img src="https://via.placeholder.com/240x360" alt="Poster 9">
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slide-inner">
                            <img src="https://via.placeholder.com/240x360" alt="Poster 10">
                        </div>
                    </div>
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </div>

    <div class="review-list">
        <h1>내가 쓴 후기</h1>
         <div class="swiper review-swiper-custom">
              <div class="swiper-wrapper">

              <% for(int i=0;i<10;i++)  { %>
                    <div class="swiper-slide review-swiper review-box" data-index="<%= i %>">
                           <div class="review-container">
                                  <div class="review-profile">
                                        <div class="review-profile-img">

                                            <p style="margin-left:5px; color:brown;">영화명</p>
                                        </div>
                                        <div class="review-profile-grade">
                                            <p>★<p>
                                            <p style="margin-left:5px; color:black;">5.0</p>
                                        </div>
                                  </div>
                                  <hr/>
                                  <div class="review-text">
                                        <p style="color: #aaa !important;">리뷰 글입니다. 재밌고 슬프고 신나는 영화이고 어쩌구 저쩌구 어쩌구 저쩌구 ~~어쩌구 저쩌구~ 어쩌구 저쩌구~ 어쩌구 저쩌구~ 어쩌구 저쩌구~<%=i%></p>
                                  </div>
                                  <hr/>
                                  <div class="review-sym">
                                      <div style="display: inline-block;">
                                          <img src="/assets/img/gooood.png" alt="따봉">
                                      </div>
                                      <div style="display: inline-block;">
                                          <p style="color:black !important; font-size: 32px; m">123</p>
                                      </div>
                                  </div>
                           </div>
                     </div>
                   <% } %>
              </div>
              <div class="swiper-button-prev"></div>
              <div class="swiper-button-next"></div>
         </div>
    </div>

    <!-- 리뷰 모달 -->
        <div id="reviewModal" class="modal">
          <div class="modal-content">
              <span class="close" onclick="closeReviewModal()">&times;</span>
              <h2 style="margin-bottom:10px;">리뷰 상세보기</h2>
              <hr/>
              <div id="reviewContent" class="review-content"></div>
          </div>
      </div>



<%@ include file="include/footer.jsp"%>

    <script>

        new Swiper('.swiper-container', {
            speed: 800, // 슬라이드 속도
            slidesPerView: 1, // 한 번에 보여질 슬라이드 수
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

            const swiperSlides = document.querySelectorAll('.swiper-slide');
            swiperSlides.forEach(function(slide) {
                slide.addEventListener('click', function(event) {

                    console.log('클릭된 슬라이드:', event.currentTarget);
                });
            });

                // 닫기
                function closeReviewModal() {
                    var modal = document.getElementById("reviewModal");
                    modal.style.display = "none";
                }

                // 이벤트 리스너 추가
                var reviewBoxes = document.querySelectorAll('.review-box');
                reviewBoxes.forEach(function(box) {
                    box.addEventListener('click', function() {
                        var index = this.getAttribute('data-index');
                        openReviewModal(index);
                    });
                });

                // 모달 열때 내용 보여주기
                function openReviewModal(index) {
                    var reviewContent = document.querySelector('.swiper-slide[data-index="' + index + '"] .review-text').textContent;
                    document.getElementById("reviewContent").innerHTML = reviewContent;
                    var modal = document.getElementById("reviewModal");
                    modal.style.display = "block";
                }











</script>
</body>
</html>