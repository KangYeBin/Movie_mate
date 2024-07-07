package com.ictproject.moviemate.domain.wish;

/*
	CREATE TABLE wish_list (
		user_id INT NOT NULL,
		movie_cd varchar(200) NOT NULL,
		FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
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
public class Wish {

	private String userId;	// 회원 번호
	private String movieCd;	// 영화 코드

}
