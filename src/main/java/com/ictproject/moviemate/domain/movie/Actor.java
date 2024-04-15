package com.ictproject.moviemate.domain.movie;

/*
	CREATE TABLE actor (
		movie_cd VARCHAR(200) NOT NULL,
		actor_name VARCHAR(200) NOT NULL,
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
public class Actor {

	private String movieCd;		// 영화 코드
	private String actorName;	// 배우명

}
