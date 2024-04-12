package com.ictproject.moviemate.domain.movie;

/*
	CREATE TABLE keyword (
		movie_cd VARCHAR(200) NOT NULL,
		keyword_name VARCHAR(200) NOT NULL,
		FOREIGN KEY (movie_cd) REFERENCES movie(movie_cd) ON DELETE CASCADE
	);
*/

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Keyword {

	private String movieCd;		// 영화 코드
	private String keywordName;	// 키워드명

}
