// 메인 배너 슬라이드 스크립트
const mySwiper = new Swiper('.swiper-container', {
    loop: true, //무한반복
    autoplay: {
        delay: 3000 // 3초마다 슬라이드
    },
    loopAdditionalSlides: 1,
    slidesPerView: 4, // 여백화면 미리보기
    centeredSlides: true, // 슬라이드 이미지 가운데 정렬
    effect: 'coverflow', // 이펙트 효과
    coverflowEffect: {
        rotate: 0,
        stretch: 0,
        depth: 100,
        modifier: 3,
        slideShadows: true
    },
    pagination:{
        el: '.swiper-pagination',
        clickable: true,
    }
});

// 장르별 영화 목록 슬라이드 스크립트
const listSwiper = new Swiper('.sf', {
    // loop: true,
    slidesPerView: 5,
    spaceBetween: 5,
    navigation: {
        nextEl: '.sf-next',
        prevEl: '.sf-prev',
    }
});
const listSwiper2 = new Swiper('.family', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.family-next',
        prevEl: '.family-prev',
    }
});
const listSwiper3 = new Swiper('.horror', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.horror-next',
        prevEl: '.horror-prev',
    }
});
const listSwiper4 = new Swiper('.drama', {
    loop: true,
    slidesPerView: 5,
    navigation: {
        nextEl: '.drama-next',
        prevEl: '.drama-prev',
    }
});
const listSwiper5 = new Swiper('.meloromance', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.meloromance-next',
        prevEl: '.meloromance-prev',
    }
});
const listSwiper6 = new Swiper('.mystery', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.mystery-next',
        prevEl: '.mystery-prev',
    }
});
const listSwiper7 = new Swiper('.crime', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.crime-next',
        prevEl: '.crime-prev',
    }
});
const listSwiper8 = new Swiper('.thriller', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.thriller-next',
        prevEl: '.thriller-prev',
    }
});
const listSwiper9 = new Swiper('.action', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.action-next',
        prevEl: '.action-prev',
    }
});
const listSwiper10 = new Swiper('.adventure', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.adventure-next',
        prevEl: '.adventure-prev',
    }
});

// 배경 효과
const $sky = document.querySelector(".sky");

// 브라우저 창 크기에 따른 별 생성
window.onresize = () => {
    makeStars();
}

const makeStars = () => {
    // 브라우저 가장 큰 크기
    const maxSize = Math.max(window.innerWidth, window.innerHeight)

    // 랜덤한 X 위치 값
    const getRandomX = () => Math.random() * maxSize;

    // 랜덤한 Y 위치 값
    const getRandomY = () => Math.random() * maxSize;

    // 랜덤한 크기 (circle는 반지름이 크기)
    const randomRadius = () => Math.random() * 0.7 + 0.6;

    // 임의의 값
    const _size = Math.floor(maxSize / 2);

    const htmlDummy = new Array(_size).fill().map((_, i) => {
        return `<circle class='star'
                cx=${getRandomX()}
                cy=${getRandomY()}
                r=${randomRadius()}
                className="star" />`
    }).join('');

    $sky.innerHTML = htmlDummy;
}

window.onload = () => {
    makeStars();
}

//찜 추천 swiper
const wishSwiper = new Swiper('.wishSwiper', {
    spaceBetween: 5,
    slidesPerView: 5,
    navigation: {
        nextEl: '.wish-next',
        prevEl: '.wish-prev',
    }
});