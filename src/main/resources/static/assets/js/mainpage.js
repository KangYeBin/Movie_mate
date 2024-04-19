
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
    // loop: true,
    slidesPerView: 5,
    spaceBetween: 5,
    navigation: {
        nextEl: '.list-next',
        prevEl: '.list-prev',
    }
});
const listSwiper2 = new Swiper('.swiper-container-list2', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.list-next',
        prevEl: '.list-prev',
    }
});
const listSwiper3 = new Swiper('.swiper-container-list3', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.list-next',
        prevEl: '.list-prev',
    }
});
const listSwiper4 = new Swiper('.swiper-container-list4', {
    loop: true,
    slidesPerView: 5,
    navigation: {
        nextEl: '.list-next',
        prevEl: '.list-prev',
    }
});
const listSwiper5 = new Swiper('.swiper-container-list5', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.list-next',
        prevEl: '.list-prev',
    }
});
const listSwiper6 = new Swiper('.swiper-container-list6', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.list-next',
        prevEl: '.list-prev',
    }
});
const listSwiper7 = new Swiper('.swiper-container-list7', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.list-next',
        prevEl: '.list-prev',
    }
});
const listSwiper8 = new Swiper('.swiper-container-list8', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.list-next',
        prevEl: '.list-prev',
    }
});
const listSwiper9 = new Swiper('.swiper-container-list9', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.list-next',
        prevEl: '.list-prev',
    }
});
const listSwiper10 = new Swiper('.swiper-container-list10', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.list-next',
        prevEl: '.list-prev',
    }
});

