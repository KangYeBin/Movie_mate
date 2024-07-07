package com.ictproject.moviemate.domain.review;

/*
	CREATE TABLE review (
		review_id INT AUTO_INCREMENT PRIMARY KEY,
		user_id INT NOT NULL,
		movie_cd varchar(200) NOT NULL,
		review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
		text VARCHAR(500),
		sympathy_cnt INT DEFAULT 0,
		FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
		FOREIGN KEY (movie_cd) REFERENCES movie(movie_cd) ON DELETE CASCADE
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
public class Review {

	private int reviewId;				// 후기 번호
	private int userId;					// 회원 번호
	private String movieCd;				// 영화 코드
	private LocalDateTime reviewDate;	// 등록일
	private String text;				// 텍스트
	private int sympathyCnt;			// 공감 수
	private float grade;				// 별점
	private String movieName;

}
