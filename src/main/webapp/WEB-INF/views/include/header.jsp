<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/assets/js/header.js"></script>
<header>
    <!-- 헤더 -->
    <header>
        <div class="header-section">
            <div class="header-container">
                <div class="logo"><img src="/assets/img/logo.png" alt="moviemate로고"></div>
                <div class="header-items">
                    <p><a href="/">HOME</a></p>
                    <p><a href="#" class="category-btn">CATEGORY</a></p>
                    <p><a href="/my">MYPAGE</a></p>
                    <p><a href="/${sessionScope.login.loginPath}/logout">LOGOUT</a></p>
                </div>
                <p class="user">${sessionScope.login.nickName}님 안녕하세요</p>
                <div class="selectBox">
                    <button class="label">검색어 종류 ▽</button>
                    <ul class="searchList">
                         <li class="optionItem">감독</li>
                         <li class="optionItem">배우</li>
                         <li class="optionItem">영화제목</li>
                    </ul>
                </div>     
                <div class="search-section">
                    <form id="search" action="/search" method="GET" class="search-form">
                        <input onkeyup="enterkey()" type="text" name="" id="" placeholder="내용을 검색하세요">
                        <button type="submit">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </header>
    <div class="header-hidden"></div>
    <div class="scroll"></div>

    <!-- 헤더 카테고리 -->
    <nav class="gnb-category">
        <div class="category-list-container">
            <ul>
                <li><a href="/category/sf">SF</a></li>
                <li><a href="/category/family">가족</a></li>
                <li><a href="/category/horror">공포</a></li>
                <li><a href="/category/noir">느와르</a></li>
                <li><a href="/category/homosexual">동성애</a></li>
                <li><a href="/category/drama">드라마</a></li>
                <li><a href="/category/meloromance">멜로/로맨스</a></li>
                <li><a href="/category/melodrama">멜로드라마</a></li>
            </ul>
            <ul>
                <li><a href="/category/wuxia">무협</a></li>
                <li><a href="/category/culture">문화</a></li>
                <li><a href="/category/musical">뮤지컬</a></li>
                <li><a href="/category/music">뮤직</a></li>
                <li><a href="/category/mystery">미스터리</a></li>
                <li><a href="/category/crime">범죄</a></li>
                <li><a href="/category/social">사회</a></li>
                <li><a href="/category/social-tendency">사회물(경향)</a></li>
            </ul>
            <ul>
                <li><a href="/category/thriller">스릴러</a></li>
                <li><a href="/category/sports">스포츠</a></li>
                <li><a href="/category/history">시대극/사극</a></li>
                <li><a href="/category/kids">아동</a></li>
                <li><a href="/category/action">액션</a></li>
                <li><a href="/category/adventure">어드벤처</a></li>
                <li><a href="/category/omnibus">옴니버스</a></li>
                <li><a href="/category/humanrights">인권</a></li>
            </ul>
            <ul>
                <li><a href="/category/human">인물</a></li>
                <li><a href="/category/disaster">재난</a></li>
                <li><a href="/category/biography">전기</a></li>
                <li><a href="/category/war">전쟁</a></li>
                <li><a href="/category/religion">종교</a></li>
                <li><a href="/category/youth">청춘영화</a></li>
                <li><a href="/category/comedy">코메디</a></li>
                <li><a href="/category/fantasy">판타지</a></li>
            </ul>
        </div>
    </nav>
</header>
<body>
    <script>
    const label = document.querySelector('.label');
const options = document.querySelectorAll('.optionItem');

const handleSelect = function(item) {
  label.innerHTML = item.textContent;
  label.parentNode.classList.remove('active');
}
options.forEach(function(option){
  option.addEventListener('click', function(){handleSelect(option)})
})

label.addEventListener('click', function(){
  if(label.parentNode.classList.contains('active')) {
    label.parentNode.classList.remove('active');
  } else {
    label.parentNode.classList.add('active');
  }
});
</script>
</body>
