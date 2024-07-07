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
    const categoryAll = document.querySelector('.gnb-category');

    // 카테고리 이벤트
    categoryBtn.addEventListener('click', (e) => {
        e.preventDefault();
        gnb.classList.toggle('show');
    });
    // 클릭된 요소가 categoryAll인 경우 또는 category-wrapper의 하위 요소인 경우 무시
    document.addEventListener('click', function(event) {
        if (event.target.closest('.categoryAll') || event.target.closest('.category-wrapper')) return;
        gnb.classList.remove('show');
    });


});