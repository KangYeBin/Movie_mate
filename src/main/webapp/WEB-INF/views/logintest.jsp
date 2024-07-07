<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>
    <%@ include file="include/header-static.jsp"%>
    <style>

        #section {
            background-color: white;
            color: rgb(45, 4, 207);
            height: 500px;
            text-align: center;
            position: relative;

        }

    </style>
</head>
<body>
<%@ include file="include/header.jsp"%>
<div id="section"><h1 style="position: relative;top: 150px;">로그인</h1>
    <a href="/kakao/login" style="position: relative;top: 150px;border: none;background-color: white; cursor: pointer;">
        <img src="../assets/img/kakaotest.png" height="50" width="50" >
    </a>
    <a href="/naver/login" style="position: relative;top: 150px;border: none;background-color: white; cursor: pointer;">
        <img src="../assets/img/navertest.png"height="50" width="50" >
    </a>
    <button type="button" style="position: relative;top: 150px;border: none;background-color: white; cursor: pointer;">
        <img src="../assets/img/googletest.png"height="50" width="50" onclick="location.href='/google/login'" >
    </button>

</div>


<%@ include file="include/footer.jsp"%>
</body>
</html>













