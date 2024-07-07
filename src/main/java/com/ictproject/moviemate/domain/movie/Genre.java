package com.ictproject.moviemate.domain.movie;

/*
	CREATE TABLE genre (
		movie_cd VARCHAR(200) NOT NULL,
		genre_name VARCHAR(200) NOT NULL,
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
public class Genre {

	private String movieCd;		// 영화 코드
	private String genreName;	// 장르명

}
