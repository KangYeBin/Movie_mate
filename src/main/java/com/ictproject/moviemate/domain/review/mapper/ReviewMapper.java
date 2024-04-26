package com.ictproject.moviemate.domain.review.mapper;

import com.ictproject.moviemate.domain.review.Review;
import com.ictproject.moviemate.domain.review.dto.ReviewDetailResponseDTO;
import com.ictproject.moviemate.domain.review.dto.ReviewModifyRequestDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReviewMapper {

	// 후기 등록
	void insertReview(Review review);

	// 후기 수정
	void modifyReview(ReviewModifyRequestDTO reviewModifyRequestDTO);

	// 후기 삭제
	void deleteReview(int reviewId);

	// 단일 후기 조회
	Review findReview(int reviewId);

	// 해당 영화의 모든 후기 조회
	List<ReviewDetailResponseDTO> findReviewsByMovie(String movieCd);

	// 해당 사용자의 모든 후기 조회
	List<ReviewDetailResponseDTO> findReviewsByUser(int userId);

	// 해당 영화의 후기 총 개수 조회
	int countByMovie(String movieCd);

	// 해당 사용자의 후기 총 개수 조회
	int countByUser(int userId);

	// 후기 좋아요 누르기
	void insertThumb(Review review);

	// 후기 좋아요 취소
	void deleteThumb(Review review);

	// 마이페이지에서 후기 좋아요 보이기
	List<Review> findSympathy(int sympathyCnt);


}