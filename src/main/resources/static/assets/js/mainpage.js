
// 메인 배너 슬라이드 스크립트
const mySwiper = new Swiper('.swiper-container', {
    loop:true, //무한반복
    autoplay: {
    delay: 10000 // 10초마다 슬라이드
    },
    speed: 500,
    slidesPerView: 1.85, // 여백화면 미리보기
    centeredSlides: true, // 슬라이드 이미지 가운데 정렬
    spaceBetween : 20,
    navigation: { // 좌우 버튼 설정
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    }
});

// 장르별 영화 목록 슬라이드 스크립트
const listSwiper = new Swiper('.swiper-container-list', {
    loop: true,
    slidesPerView: 5,
    navigation: {
        nextEl: '.list-next',
        prevEl: '.list-prev',
    }
    
});