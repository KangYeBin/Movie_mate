package com.ictproject.moviemate.domain.movie.dto;


import com.ictproject.moviemate.domain.movie.Movie;
import jdk.jfr.Timestamp;
import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MovieDetailResponseDTO {
    private String movieCd;			// 영화 코드
    private String movieName;		// 영화명
    private String nation;			// 국가
    private String openDate;		// 개봉일자
    private String rating;			// 관람 등급
    private String director;		// 감독
    private String imageUrl;		// 이미지 링크
    private String plot;			// 줄거리
    private String audiAcc;			// 관객수
    private String vodUrl;			// 티저 영상 링크
    private String runtime;			// 상영시간
    private String stillUrl;		// 스틸 이미지 링크
    private int wishCnt;			// 찜 수

    public MovieDetailResponseDTO(Movie movie) {
        this.movieCd = movie.getMovieCd();
        this.movieName = movie.getMovieName();
        this.imageUrl = cutUrl(movie.getImageUrl());
        this.nation = movie.getNation();
        this.openDate = cutDate(movie.getOpenDate());
        this.rating = movie.getRating();
        this.director = movie.getDirector();
        this.plot = movie.getPlot();
        this.audiAcc = movie.getAudiAcc();
        this.vodUrl = movie.getVodUrl();
        this.runtime = movie.getRuntime();
        this.stillUrl = movie.getStillUrl();
        this.wishCnt = movie.getWishCnt();
    }

    private String cutDate(String openDate) {
        return openDate.split(" ")[0];
    }

    private String cutUrl(String url){
        String result = "";
        if(url.contains("|")){
            result=url.substring(0,url.indexOf("|"));
        }else{
            result=url;
        }
        return result;
    }
}
