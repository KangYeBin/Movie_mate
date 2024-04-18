//  엔터키로 검색 활성화 
function enterkey(event) {
    if (event.keyCode == 13) {
        document.getElementById("search").submit();
    }
};

document.addEventListener('DOMContentLoaded', function() {
    // 카테고리 요소 취득
    const categoryBtn = document.querySelector('.category-btn');
    const gnb = document.querySelector('.category-list-container');

    // 카테고리 이벤트
    categoryBtn.addEventListener('click', (e) => {
        e.preventDefault();
        gnb.classList.toggle('show');
    });
});