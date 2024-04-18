<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/assets/js/header.js"></script>
<header>
    <!-- 헤더 -->
    <header>
        <div class="header-section">
            <div class="header-container">
                <div class="logo"><img src="/assets/img/moviemateLogotest.png" alt="moviemate로고"></div>
                <div class="header-items">
                    <p><a href="/">HOME</a></p>
                    <p><a href="#" class="category-btn">CATEGORY</a></p>
                    <p><a href="/my">MYPAGE</a></p>
                    <p><a href="/${sessionScope.login.loginPath}/logout">LOGOUT</a></p>
                </div>
                <p class="user">${sessionScope.login.nickName}님 안녕하세요</p>
                <div class="search-section">
                    <form id="search" action="#" method="GET">
                        <input onkeyup="enterkey()" type="text" name="" id="" placeholder="영화 제목을 검색하세요">
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
                <li><a href="">SF</a></li>
                <li><a href="">가족</a></li>
                <li><a href="">공포</a></li>
                <li><a href="">느와르</a></li>
                <li><a href="">동성애</a></li>
                <li><a href="">드라마</a></li>
                <li><a href="">멜로/로맨스</a></li>
                <li><a href="">멜로드라마</a></li>
            </ul>
            <ul>
                <li><a href="">무협</a></li>
                <li><a href="">문화</a></li>
                <li><a href="">뮤지컬</a></li>
                <li><a href="">뮤직</a></li>
                <li><a href="">미스터리</a></li>
                <li><a href="">범죄</a></li>
                <li><a href="">사회</a></li>
                <li><a href="">사회물(경향)</a></li>
            </ul>
            <ul>
                <li><a href="">스릴러</a></li>
                <li><a href="">스포츠</a></li>
                <li><a href="">시대극/사극</a></li>
                <li><a href="">아동</a></li>
                <li><a href="">액션</a></li>
                <li><a href="">어드벤처</a></li>
                <li><a href="">옴니버스</a></li>
                <li><a href="">인권</a></li>
            </ul>
            <ul>
                <li><a href="">인물</a></li>
                <li><a href="">재난</a></li>
                <li><a href="">전기</a></li>
                <li><a href="">전쟁</a></li>
                <li><a href="">종교</a></li>
                <li><a href="">청춘영화</a></li>
                <li><a href="">코메디</a></li>
                <li><a href="">판타지</a></li>
            </ul>
        </div>
    </nav>
</header>