/* 리뷰별개수 */
const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
    document.querySelector(`.star-modal span`).style.width = `${target.value * 10}%`;
    let button = document.querySelector('.reple-bt');
    if (target.value > 0) {
        button.style.visibility = "visible";
    } else {
        button.style.visibility = "hidden";
    }
    console.log(target.value);
}


var reviewSwiper = new Swiper('.review-swiper-custom', {
    speed: 800, // 슬라이드 속도
    slidesPerView: 4, // 한 번에 보여질 슬라이드 수
    slidesPerGroup: 4,
    spaceBetween: 25, // 이미지 간격
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



// 모달
var modal = document.getElementById("reviewModal");
var teasermodal = document.getElementById("teaserModal");

// 모달 바깥을 클릭하면 모달이 닫히도록 함
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
window.onclick = function (event) {
    if (event.target == teasermodal) {
        teasermodal.style.display = "none";
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
// 모달 열기 버튼에 클릭 이벤트 리스너 추가
function openTeasermodal() {
    teasermodal.style.display = "block";
}

// 모달 닫기 버튼에 클릭 이벤트 리스너 추가
function closeTeaserModal() {
    teasermodal.style.display = "none";
}

function renderReviews(review, isSympathy) {

    let tag = document.getElementById('reviewData').innerHTML;

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

        tag += `

                    <div class="swiper-slide review-swiper">
                        <div class="review-container" data-bno=${reviewId} data-userid=${userId}>
                            <div class="review-profile">
                                <div class="review-profile-img">
                                    <img src="${profile}" alt="프사">
                                    <p style="margin-left:5px; color:black;">${email}</p>
                                </div>
                                <div class="review-profile-grade">
                                    <img src="/assets/img/3.png">
                                    <p style="margin-left:5px; color:black;">${grade}</p>
                                </div>
                            </div>
                            <hr class="review-hr" />
                            <div class="review-text">
                                <p style="color:black !important;">${text}</p>
                            </div>
                            <hr class="review-hr" />
                            <div class="review-sym">
                                <div class="review-thumb">
                                    <svg
                                        class="thumb ${isSympathy=='true' ? ` active` : ``} "
                                        
                                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                        <path
                                            d="M313.4 32.9c26 5.2 42.9 30.5 37.7 56.5l-2.3 11.4c-5.3 26.7-15.1 52.1-28.8 75.2H464c26.5 0 48 21.5 48 48c0 18.5-10.5 34.6-25.9 42.6C497 275.4 504 288.9 504 304c0 23.4-16.8 42.9-38.9 47.1c4.4 7.3 6.9 15.8 6.9 24.9c0 21.3-13.9 39.4-33.1 45.6c.7 3.3 1.1 6.8 1.1 10.4c0 26.5-21.5 48-48 48H294.5c-19 0-37.5-5.6-53.3-16.1l-38.5-25.7C176 420.4 160 390.4 160 358.3V320 272 247.1c0-29.2 13.3-56.7 36-75l7.4-5.9c26.5-21.2 44.6-51 51.2-84.2l2.3-11.4c5.2-26 30.5-42.9 56.5-37.7zM32 192H96c17.7 0 32 14.3 32 32V448c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32V224c0-17.7 14.3-32 32-32z" />
                                    </svg>
                                    <p class="thumb-cnt">${sympathyCnt}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                `;

    document.getElementById('reviewData').innerHTML = tag;
    reviewSwiper.update();

    

}
