package com.ictproject.moviemate.domain.movie;

/*
	CREATE TABLE movie (
		movie_cd VARCHAR(200) PRIMARY KEY NOT NULL,
		movie_name VARCHAR(200) NOT NULL,
		nation VARCHAR(100),
		open_date DATETIME,
		rating VARCHAR(100),
		director VARCHAR(100),
		image_url VARCHAR(200),
		plot VARCHAR(400),
		audi_acc VARCHAR(200),
		vod_url VARCHAR(200),
		runtime VARCHAR(100),
		wish_cnt INT DEFAULT 0,
		still_url VARCHAR(2500)
	);
*/

import lombok.*;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Movie {

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

}
