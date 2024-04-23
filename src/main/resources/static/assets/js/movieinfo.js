

        /* 리뷰별개수 */
        const drawStar = (target) => {
            document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
        }
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
        var reviewSwiper =new Swiper('.review-swiper-custom', {
            speed: 800, // 슬라이드 속도
            slidesPerView: 4, // 한 번에 보여질 슬라이드 수
            slidesPerGroup: 4,
            spaceBetween: 10, // 이미지 간격
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

        // 찜 하트
        var like = document.getElementById("like")

        like.addEventListener('click', function () {
            like.classList.toggle('active')
        });


        // 공감 만들기
        var thumb = document.getElementById("thumb")

        thumb.addEventListener('click', function () {
            thumb.classList.toggle('active')
        });
        
        
