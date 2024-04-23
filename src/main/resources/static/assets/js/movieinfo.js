/* 리뷰별개수 */
const drawStar = (target) => {
    const starSpan = target.parentElement.querySelector('span');
    starSpan.style.width = `${target.value * 10}%`;
    let button = document.querySelector('.reple-bt');
    if (target.value > 0) {
        button.style.visibility = "visible";
    } else {
        button.style.visibility = "hidden";
    }
    console.log(target.value);
}

/* 스위퍼 */
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

/* 찜 하트 토글 */
var like = document.getElementById("like")

like.addEventListener('click', function () {
    like.classList.toggle('active')
});

/* 따봉 토글 */
var thumb = document.getElementById("thumb")

thumb.addEventListener('click', function () {
    thumb.classList.toggle('active')
});

/* 모달창 */
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
