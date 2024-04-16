<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>
    <%@ include file="include/header-static.jsp"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <style>

            * {
              box-sizing: border-box;
            }

            body {
              padding: 65px 240px;
              margin: 0;
              background: linear-gradient(180deg, #090202 0%, #211B1B 18%, #8C8C8C 100%);
              width: 100vw;
              min-height: 100vh;

              display: flex;
              flex-direction: column;
              gap: 45px;
            }

            p,
            h1 {
              margin: 0;
            }

            .movie {
              display: flex;
              flex-direction: column;
              gap: 54px;
            }

            .movie .image {
              width: 100%;
              padding-bottom: 50%;
              position: relative;
              background: url(/src/main/resources/static/assets/1.png) center no-repeat;
              background-size: cover;
              border-radius: 24px;
            }

            .movie .image .content-wrap {
              position: absolute;
              width: 100%;
              height: 100%;
              display: flex;
              flex-direction: column;
              justify-content: space-between;
              align-items: end;
              padding: 7px 0 24px 24px;
            }

            .movie .image .content-wrap .zzim-wrap {
              width: 100px;
              height: 100px;
              background: url(/src/main/resources/static/assets/3.svg) no-repeat center;
              background-size: cover;
              display: flex;
              align-items: center;
              justify-content: center;
            }

            .movie .image .content-wrap .zzim-wrap p {
              font-family: Inter;
              font-size: 30px;
              line-height: 100px;
            }

            .movie .image .content-wrap h1 {
              color: #FDFDFD;
              font-family: "Londrina Shadow";
              font-size: 52px;
              width: 100%;
            }

            .movie .info-wrap {
              display: flex;
              align-items: center;
              gap: 15px;

            }

            .movie .info-wrap .poster {
              width: 230px;
              height: 317px;
            }

            .movie .info-wrap .doc {
              display: flex;
              flex-direction: column;
              gap: 10px;
            }

            .movie .info-wrap .doc .content {
              color: #FFF;

              font-family: Inter;
              font-size: 20px;
            }

            .movie .info-wrap .doc .info {
              display: flex;
              flex-direction: column;
              gap: 28px;
            }

            .movie .info-wrap .doc .info>div {
              display: flex;
              gap: 20px;
            }

            .movie .info-wrap .doc .info>div h1 {
              color: #FFF;

              font-family: Inter;
              font-size: 35px;
              font-weight: 400;
            }

            .movie .info-wrap .doc .info>div p {
              color: #FFF;

              font-family: Inter;
              font-size: 35px;
              font-weight: 400;
            }

            .review-wrap {
              display: flex;
              flex-direction: column;
              gap: 10px;
              align-items: center;
            }

            .review-wrap .review-box {
              background: rgba(0, 0, 0, 0.40);

              width: 100%;
              border-radius: 24px;
              backdrop-filter: blur(10px);
              padding: 23px 24px;
              height: 528px;

              overflow: auto;
            }

            .review-wrap .review-box .review {
              border-radius: 10px;
              background: #555;
              padding: 7px 51px 7px 27px;
              display: flex;
              gap: 60px;
              align-items: center;
            }

            .review-wrap .review-box .review .score {
              display: flex;
              flex-shrink: 0;

            }

            .review-wrap .review-box .review .score>img {
              flex-shrink: 0;
              width: 30px;
              height: 30px;
            }

            .review-wrap .review-box .review .nickname {
              color: #FFF;
              font-family: "DM Sans";
              font-size: 18px;
              font-weight: 700;
              flex-shrink: 0;
            }

            .review-wrap .review-box .review .content {
              color: #FFF;
              text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
              -webkit-text-stroke-width: 1;
              -webkit-text-stroke-color: #000;
              font-family: "DM Sans";
              font-size: 18px;
              font-weight: 700;

              text-overflow: ellipsis;
              -webkit-line-clamp: 1;
              /*원하는 라인수*/
              -webkit-box-orient: vertical;

              display: -webkit-box;
              white-space: normal;
              overflow: hidden;


              line-height: 23px;
              height: 23px;

              flex-grow: 1;

            }

            .review-wrap .review-box .review .time {
              color: #FFF;

              font-family: "DM Sans";
              font-size: 18px;
              font-weight: 700;
              flex-shrink: 0;
            }


            .review-wrap .paging {
              display: flex;
              align-items: center;
              gap: 15px;
            }

            .review-wrap .paging img{
              cursor: pointer;
            }
            .review-wrap .paging .first {
              width: 36px;
              background: url('/src/main/resources/static/assets/img/4.png') no-repeat;
              height: 34.5px;
            }

            .review-wrap .paging .line {
              content: '';
              width: 2px;
              height: 50px;
              background: #D9D9D9;
              display: block;

            }

            .review-wrap .paging .page-list {
              display: flex;
              align-items: center;
              gap: 5px;

            }

            .review-wrap .paging .page-list p{
              color: #FFF;

              font-family: "DM Sans";
              font-size: 18px;
              font-weight: 700;

              cursor: pointer;
            }

            .review-wrap .paging .page-list p::after{
              content: ' | ';
            }

            .review-wrap .paging .page-list p:last-child::after{
              content: '';
            }

            .review-wrap .paging .last {
              transform: scaleX(-100%);
            }

            .review-wrap .paging .next {
              transform: scaleX(-100%);
            }

        </style>

</head>
<body>

    <div class="movie">
            <div class="image">
                <div class="content-wrap">
                    <div class="zzim-wrap">
                        <p>찜</p>
                   </div>
                   <h1>제목</h1>
                </div>

            </div>

            <div class="info-wrap">
                <img class="poster" src="/src/main/resources/static/assets/img/2.png">
                <div class="doc">
                    <p class="content">내전으로 고립된 낯선 도시, 모가디슈. 지금부터 우리의 목표는 오로지 생존이다! 대한민국이 UN가입을 위해 동분서주하던 시기. 1991년 소말리아의 수도 모가디슈에서는 일촉즉발의 내전이 일어난다. 통신마저 끊긴 그 곳에 고립된 대한민국 대사관의 직원과 가족들은 총알과 포탄이 빗발치는 가운데, 살아남기 위해 하루하루를 버텨낸다. 그러던 어느 날 밤, 북한 대사관의 일행들이 도움을 요청하며 문을 두드리는데... 목표는 하나, 모가디슈에서 탈출해야 한다!</p>
                    <div class="info">
                        <div>
                            <h1>개요 :</h1>
                            <p>개요 내용</p>
                        </div>
                        <div>
                            <h1>장르 :</h1>
                            <p>장르 내용</p>
                        </div>
                        <div>
                            <h1>출현 :</h1>
                            <p>출연진 내용</p>
                        </div>
                        <div>
                            <h1>감독 :</h1>
                            <p>감독 내용</p>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="review-wrap">
            <div class="review-box">
                <div class="review">
                    <div class="score">
                        <img class="star" src="/src/main/resources/static/assets/img/3.png">
                        <img class="star" src="/src/main/resources/static/assets/img/3.png">
                        <img class="star" src="/src/main/resources/static/assets/img/3.png">
                        <img class="star" src="/src/main/resources/static/assets/img/3.png">
                        <img class="star" src="/src/main/resources/static/assets/img/3.png">
                    </div>

                    <p class="nickname">닉네임</p>
                    <p class="content">후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.후기들이 들어갈 부분입니다.</p>
                    <p class="time">작성시간</p>
                </div>
            </div>

            <div class="paging">
                <img class="first" src="/src/main/resources/static/assets/img/4.png">
                <div class="line"></div>
                <img class="pre" src="/src/main/resources/static/assets/img/5.png">
                <div class="page-list">
                    <p>1</p>
                    <p>2</p>
                    <p>3</p>
                    <p>4</p>
                    <p>5</p>
                    <p>6</p>
                    <p>7</p>
                    <p>8</p>
                    <p>9</p>
                    <p>10</p>
                </div>
                <img class="next" src="/src/main/resources/static/assets/img/5.png">
                <div class="line"></div>
                <img class="last" src="/src/main/resources/static/assets/img/4.png">
            </div>
        </div>


</body>
</html>