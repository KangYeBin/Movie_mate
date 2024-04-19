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

   <main>
      <div class="container">
         <div class="description">
            <h1>[${category}]</h1>
         </div>
      </div>
   </main>

   <div>
      <div class="content-list">

         <div class="swiper-container">
            <div class="swiper-wrapper">
               <div class="swiper-slide">
                  <c:forEach var="movie" items="${movie}">
                     <div class="slide-inner">
                        <a href="/detail/${movie.movieCd}"><img src="${movie.imageUrl}" alt="장르별 영화 포스터"></a>
                     </div>
                  </c:forEach>
               </div>
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
         </div>
      </div>
   </div>

   <script>
      new Swiper('.swiper-container', {
         speed: 800, // 슬라이드 속도
         slidesPerView: 1, // 한 번에 보여질 슬라이드 수
         spaceBetween: 10, // 이미지 간격
         loop: false, // 슬라이드 루프 설정 비활성화
         grid: {
            rows: 2,
            fill: 'column'
         },
         navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
         },
      });
   </script>

</body>

</html>