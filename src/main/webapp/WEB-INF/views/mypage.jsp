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

    <main>
        <div class="container">
            <div class="description">
                <h3>${sessionScope.login.email}</h3>
                <h1>${sessionScope.login.nickName}</h1>
                <p>님의 마이페이지</p>
            </div>
        </div>
    </main>

    <div>
        <div class="content-list">
            <h1>내가 찜한 영화</h1>

            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <c:forEach var="movie" items="${movie}">
                        <div class="swiper-slide">
                            <div class="slide-inner">
                                <a href="/detail/${movie.movieCd}"><img src="${movie.imageUrl}" alt="장르별 영화 포스터"></a>
                            </div>
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

        <hr class="hr1" noshade>
        <br>
        <table>
            <tr>
                <th>영화명</th>
                <th>후기</th>
                <th>유저정보</th>
                <th>일시</th>
                <th>조회수</th>
            </tr>
            <tr>
                <td class="center">영화1</td>
                <td class="title"><a href="detail_page.html">코멘트1</a></td>
                <td class="center">홍XX</td>
                <td class="center">2024-04-16</td>
                <td class="center">0</td>
            </tr>
            <tr>
                <td class="center">영화2</td>
                <td class="title"><a href="detail_page.html">코멘트2</a></td>
                <td class="center">김XX</td>
                <td class="center">2024-04-16</td>
                <td class="center">0</td>
            </tr>
            <tr>
                <td class="center">영화3</td>
                <td class="title"><a href="detail_page.html">코멘트3</a></td>
                <td class="center">라XX</td>
                <td class="center">2024-04-16</td>
                <td class="center">0</td>
            </tr>
        </table>
        <br>

        <div class="page">
            <a href="https://www.naver.com/">◀ 이전</a>
            <a href="https://www.naver.com/">1</a>
            <a href="https://www.naver.com/">2</a>
            <a href="https://www.naver.com/">3</a>
            <a href="https://www.naver.com/">다음 ▶</a>
        </div>
    </div>

    <%@ include file="include/footer.jsp"%>

    <script>
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
    </script>
</body>

</html>