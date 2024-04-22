
// 메인 배너 슬라이드 스크립트
const mySwiper = new Swiper('.swiper-container', {
    loop:true, //무한반복
    autoplay: {
    delay: 10000 // 10초마다 슬라이드
    },
    // speed: 500,
    slidesPerView: 3, // 여백화면 미리보기
    centeredSlides: true, // 슬라이드 이미지 가운데 정렬
    // spaceBetween : 20,
    effect:'coverflow', // 이펙트 효과
    coverflowEffect: {
        slideShadows:false // 그림자 효과 제거
    },
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

