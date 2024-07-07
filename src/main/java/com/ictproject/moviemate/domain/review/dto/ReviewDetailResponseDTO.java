package com.ictproject.moviemate.domain.review.dto;

import com.ictproject.moviemate.domain.review.Review;
import com.ictproject.moviemate.domain.sympathy.dto.SympathyDto;
import com.ictproject.moviemate.domain.user.User;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDetailResponseDTO {

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

	public ReviewDetailResponseDTO(Review review, User user) {
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

	public static class ReviewSympathyComparator implements Comparator<ReviewDetailResponseDTO> {
		@Override
		public int compare(ReviewDetailResponseDTO dto1, ReviewDetailResponseDTO dto2) {
			if (dto1.sympathyCnt > dto2.sympathyCnt) {
				return 1;
			} else if (dto1.sympathyCnt < dto2.sympathyCnt) {
				return -1;
			}
			return 0;
		}
	}

	public static class ReviewGradeComparator implements Comparator<ReviewDetailResponseDTO> {
		@Override
		public int compare(ReviewDetailResponseDTO dto1, ReviewDetailResponseDTO dto2) {
			if (dto1.grade > dto2.grade) {
				return 1;
			} else if (dto1.grade < dto2.grade) {
				return -1;
			}
			return 0;
		}
	}

	public static class ReviewDateComparator implements Comparator<ReviewDetailResponseDTO> {
		@Override
		public int compare(ReviewDetailResponseDTO dto1, ReviewDetailResponseDTO dto2) {
			return dto1.getReviewDate().compareTo(dto2.getReviewDate());
		}
	}

}
