package com.ictproject.moviemate.domain.review.controller;


import com.ictproject.moviemate.domain.review.Review;
import com.ictproject.moviemate.domain.review.dto.ReviewDetailResponseDTO;
import com.ictproject.moviemate.domain.review.dto.ReviewModifyRequestDTO;
import com.ictproject.moviemate.domain.review.dto.ReviewRequestDTO;
import com.ictproject.moviemate.domain.review.dto.ReviewResponseDTO;
import com.ictproject.moviemate.domain.review.service.ReviewService;
import com.ictproject.moviemate.domain.sympathy.service.SympathyService;
import com.ictproject.moviemate.domain.user.User;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/review")
@RequiredArgsConstructor
@Slf4j
public class ReviewController {
	private final ReviewService reviewService;
	private final SympathyService sympathyService;

	@PostMapping("/create")
	public ResponseEntity<?> create(@RequestBody ReviewRequestDTO dto, HttpSession session, BindingResult result) {
		log.info("/api/v1/review/" + dto + " POST!");

		if (result.hasErrors()) {
			return ResponseEntity
					.badRequest()
					.body(result.toString());
		}

		Review review = Review.builder()
				.userId(dto.getUserId())
				.movieCd(String.valueOf(dto.getMovieCd()))
				.text(dto.getText())
				.grade(dto.getGrade())
				.movieName(dto.getMovieName())
				.build();
		log.info("ReviewRequestDTO : {}", dto);

		reviewService.insertReview(review);
		return ResponseEntity.ok().body("success");
	}

	@GetMapping("/detail/{movieCd}/reviews/{sort}")
	public ResponseEntity<?> list(@PathVariable("movieCd") String movieCd, @PathVariable("sort") String sort, HttpSession session) {
		log.info("/api/v1/review/" + movieCd + " " + sort +" GET!");


		List<ReviewDetailResponseDTO> reviews = reviewService.getReview(movieCd);
		log.info("reviews : {}", reviews);

		switch (sort) {
			case "sympathyCnt":
				reviews.sort(new ReviewDetailResponseDTO.ReviewSympathyComparator().reversed());
				break;
			case "grade":
				reviews.sort(new ReviewDetailResponseDTO.ReviewGradeComparator().reversed());
				break;
		}

		ReviewResponseDTO dto = new ReviewResponseDTO(movieCd, reviews);

		return ResponseEntity.ok().body(dto);
	}

	@DeleteMapping("/del/{reviewId}")
	public void delReview(@PathVariable int reviewId) {
		System.out.println(reviewId);
		reviewService.deleteReview(reviewId);
	}

	@PutMapping("/mod/{reviewId}")
	public ResponseEntity<?> modifyReview(@PathVariable int reviewId, @RequestBody ReviewModifyRequestDTO reviewModifyRequestDTO) {
		reviewModifyRequestDTO.setReviewId(reviewId);
		reviewService.modifyReview(reviewModifyRequestDTO);
		return ResponseEntity.ok().body("ok");
	}


	@GetMapping("/{reviewId}")
	public ResponseEntity<?> getSympathy(@PathVariable int reviewId, HttpSession session) {
		log.info("/api/v1/review/" + reviewId + " GET!");

		User loginUser = (User) session.getAttribute("login");
		boolean isSympathy = sympathyService.isSympathy(reviewId, loginUser.getUserId());

		return ResponseEntity.ok().body(isSympathy);
	}
}
