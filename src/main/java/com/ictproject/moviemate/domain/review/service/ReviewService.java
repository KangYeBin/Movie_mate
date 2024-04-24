package com.ictproject.moviemate.domain.review.service;

import com.ictproject.moviemate.domain.movie.dto.MovieResponseDTO;
import com.ictproject.moviemate.domain.review.dto.ReviewResponseDTO;
import com.ictproject.moviemate.domain.review.mapper.ReviewMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class ReviewService {

	private final ReviewMapper reviewMapper;

	public List<ReviewResponseDTO> getReview(String movieCd) {
		return reviewMapper.findReviewsByMovie(movieCd);
	}

	public List<ReviewResponseDTO> getReview(int userId) {
		return reviewMapper.findReviewsByUser(userId);
	}

}
