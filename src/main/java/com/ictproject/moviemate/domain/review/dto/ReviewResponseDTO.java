package com.ictproject.moviemate.domain.review.dto;

import com.ictproject.moviemate.domain.review.Review;
import com.ictproject.moviemate.domain.user.User;
import lombok.*;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class ReviewResponseDTO {

	private int reviewId;
	private int userId;
	private String movieCd;
	private LocalDateTime reviewDate;
	private String text;
	private int sympathyCnt;
	private float grade;
	private String movieName;
	private String email;
	private String profile;

	public ReviewResponseDTO(Review review, User user) {
		this.reviewId = review.getReviewId();
		this.userId = review.getUserId();
		this.movieCd = review.getMovieCd();
		this.reviewDate = review.getReviewDate();
		this.text = review.getText();
		this.sympathyCnt = review.getSympathyCnt();
		this.grade = review.getGrade();
		this.movieName = review.getMovieName();
		this.email = user.getEmail();
		this.profile = user.getProfile();
	}
}
