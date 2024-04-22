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
    

        // 찜 만들기
        var like = document.getElementById("like")

        like.addEventListener('click', function () {
            like.classList.toggle('active')
        });

        // 공감 만들기
        var thumb = document.getElementById("thumb")

        thumb.addEventListener('click', function () {
            thumb.classList.toggle('active')
        });
        
        
// 모달 열기 버튼
var openModalBtn = document.getElementById("openModal");

// 모달
var modal = document.getElementById("reviewModal");

// 모달 닫기 버튼
var closeModalBtn = document.getElementsByClassName("close")[0];

// 모달 열기 버튼에 클릭 이벤트 리스너 추가
openModalBtn.onclick = function() {
    modal.style.display = "block";
}

// 모달 닫기 버튼에 클릭 이벤트 리스너 추가
closeModalBtn.onclick = function() {
    modal.style.display = "none";
}

// 모달 바깥을 클릭하면 모달이 닫히도록 함
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}