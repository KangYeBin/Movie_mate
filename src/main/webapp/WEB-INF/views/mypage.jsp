<!doctype html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <title>Movie Mate</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="index.css">


</head>

<body>

    <!-- 중앙 내 정보 -->
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

        <hr class="hr1" noshade>
        <br>
        <table>
            <tr>
                <th>영화명</th>
                <th>내가 쓴 후기</th>
                <th>내가 준 별점</th>
                <th>일시</th>
                <th></th>
            </tr>
            <tr>
                <td class="center">영화 제목</td>
                <td class="title"><a href="detail_page.html">코멘트</a></td>
                <td class="center">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                    </div>
                </td>
                <td class="center">2024-04-16</td>
                <td class="center"><button class="delete-btn" onclick="deleteReview(this)">삭제</button></td>
            </tr>
            <tr>
                <td class="center">영화 제목</td>
                <td class="title"><a href="detail_page.html">코멘트</a></td>
                <td class="center">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                    </div>
                </td>
                <td class="center">2024-04-16</td>
                <td class="center"><button class="delete-btn" onclick="deleteReview(this)">삭제</button></td>

            </tr>
            <tr>
                <td class="center">영화 제목</td>
                <td class="title"><a href="detail_page.html">코멘트</a></td>
                <td class="center">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                    </div>
                </td>
                <td class="center">2024-04-16</td>
                <td class="center"><button class="delete-btn" onclick="deleteReview(this)">삭제</button></td>

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


        <script>
            new Swiper('.swiper-container', {
                speed: 800,
                slidesPerView: 1,
                spaceBetween: 10,
                loop: true,
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                breakpoints: {
                768: {
                    slidesPerView: 2,
                    spaceBetween: 20,
                },
                1200: {
                    slidesPerView: 4,
                    spaceBetween: 30,
                }
            }

        });
    </script>
</body>

</html>