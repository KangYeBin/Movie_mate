<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="UTF-8">
   <title>Movie Mate</title>
   <%@ include file="include/header-static.jsp"%>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
      integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />
   <link rel="stylesheet" href="/assets/css/searchcategory.css">
</head>

<body>
   <%@ include file="include/header.jsp"%>

   <main id="main">
      <div class="container">

         <!-- 장르별 영화 목록 섹션 -->
         <div class="genre swiper-container-list">
            <span class="genre-text">[${category}]</span>
            <div class="genre-movielist swiper-wrapper">
               <c:forEach var="movie" items="${movie}">
                  <div class="movie-img-box swiper-slide" data-movie-cd="${movie.movieCd}">
                     <a href="/detail/${movie.movieCd}"><img src="${movie.imageUrl}" alt="장르별 영화 포스터"></a>
                     <p class="genre-movieNm">${movie.movieName}</p>
                  </div>
               </c:forEach>
            </div>

            <!-- 슬라이더 좌우 버튼 -->
            <div class="btn">
               <button class="list-prev swiper-button-prev" role="button"></button>
               <button class="list-next swiper-button-next" role="button"></button>
            </div>
         </div>


      </div>
   </main>


   <script>
      const listSwiper = new Swiper('.swiper-container-list', {
         // loop: true,
         slidesPerView: 5,
         spaceBetween: 5,
         grid: {
            fill: 'row',
            rows: 2,
         },
         navigation: {
            nextEl: '.list-next',
            prevEl: '.list-prev',
         },
         mousewheel: true,
      });
   </script>



</body>

</html>