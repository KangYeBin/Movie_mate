<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <!-- 헤더 -->
    <header>
        <div class="header-section">
            <div class="header-container">
                <div class="logo"><img src="/src/main/resources/static/assets/img/moviemateLogotest.png" alt="moviemate로고"></div>
                <div class="header-items">
                    <p><a href="#">HOME</a></p>
                    <p><a href="#" class="category-btn">CATEGORY</a></p>
                    <p><a href="#">MYPAGE</a></p>
                    <p><a href="#">LOGOUT</a></p>
                </div>
                <p class="user">{###}님 안녕하세요</p>
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
                <li><a href="">장르</a></li>
                <li><a href="">장르2</a></li>
                <li><a href="">장르3</a></li>
                <li><a href="">장르4</a></li>
                <li><a href="">장르5</a></li>
                <li><a href="">장르6</a></li>
                <li><a href="">장르7</a></li>
                <li><a href="">장르8</a></li>
            </ul>
            <ul>
                <li><a href="">장르1</a></li>
                <li><a href="">장르2</a></li>
                <li><a href="">장르3</a></li>
                <li><a href="">장르4</a></li>
                <li><a href="">장르5</a></li>
                <li><a href="">장르6</a></li>
                <li><a href="">장르7</a></li>
                <li><a href="">장르8</a></li>
            </ul>
            <ul>
                <li><a href="">장르1</a></li>
                <li><a href="">장르2</a></li>
                <li><a href="">장르3</a></li>
                <li><a href="">장르4</a></li>
                <li><a href="">장르5</a></li>
                <li><a href="">장르6</a></li>
                <li><a href="">장르7</a></li>
                <li><a href="">장르8</a></li>
            </ul>
            <ul>
                <li><a href="">장르1</a></li>
                <li><a href="">장르2</a></li>
                <li><a href="">장르3</a></li>
                <li><a href="">장르4</a></li>
                <li><a href="">장르5</a></li>
                <li><a href="">장르6</a></li>
                <li><a href="">장르7</a></li>
                <li><a href="">장르8</a></li>
            </ul>
        </div>
    </nav>
</header>