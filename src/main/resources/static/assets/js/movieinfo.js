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
        //팝업 열기

        var open

        function openreview() {
            open = window.open("review.html", "open", "width=440px,height=450px,top=350,left=750")
        };
        // 나중에 확인하여 추가       scrollbars=no,resizable=no





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

        $(window).load(function () {
                     // 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
                    var strWidth;		var strHeight;
                    //innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저
                    if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight )
                    {strWidth = $('#btn').outerWidth() + (window.outerWidth - window.innerWidth);
                    strHeight = $('#btn').outerHeight() + (window.outerHeight - window.innerHeight);}
                    else {var strDocumentWidth = $(document).outerWidth();
                        var strDocumentHeight = $(document).outerHeight();
                        window.resizeTo ( strDocumentWidth, strDocumentHeight );
                        var strMenuWidth = strDocumentWidth - $(window).width();
                        var strMenuHeight = strDocumentHeight - $(window).height();
                        strWidth = $('#btn').outerWidth() + strMenuWidth;
                        strHeight = $('#btn').outerHeight() + strMenuHeight;}	//resize
                        window.resizeTo( strWidth, strHeight );	});