//  엔터키로 검색 활성화 
function enterkey() {
    if (window.keyCode == 13) {
        document.getElementById("search").submit();
    }
};

// 카테고리 버튼 요소 취득
const categoryBtn = document.querySelector('.category-btn');
const gnb = document.querySelector('.category-list-container');

// 클릭 이벤트 생성
categoryBtn.addEventListener('click', (e) => {
    e.preventDefault;
    gnb.classList.toggle('show');
});