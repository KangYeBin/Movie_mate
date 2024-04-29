<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/review.css">
    <script src="/assets/js/movieinfo.js" defer></script>
    <title>Movie Mate</title>
</head>

<body>
    <div class="reviewbox">
        <div class="box">
            <div id="pro"><svg id="user" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/></svg>
                프로필</div>
            <span class="star">
                ★★★★★
                <span>★★★★★</span>
                <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
            </span>
        </div>

        <form class="profile">
                <textarea class="text" type="text" id="text" value=""  placeholder="성민아 돼지"></textarea>
            
                <div class="register">
                <input type="button" id="register" value="등록"></input>
               <input type="button" onclick="window.close()" id="cancel" value="취소">
            </div>
        </form>

    </div>

    
</body>

</html>