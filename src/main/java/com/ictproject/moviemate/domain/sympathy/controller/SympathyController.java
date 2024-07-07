package com.ictproject.moviemate.domain.sympathy.controller;


import com.ictproject.moviemate.domain.review.service.ReviewService;
import com.ictproject.moviemate.domain.sympathy.Sympathy;
import com.ictproject.moviemate.domain.sympathy.dto.SympathyDto;
import com.ictproject.moviemate.domain.sympathy.service.SympathyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/sympathy")
@RequiredArgsConstructor
@Slf4j
public class SympathyController {

    private final SympathyService sympathyService;
    private final ReviewService reviewService;

    @PostMapping
    public ResponseEntity<?> wish(@RequestBody SympathyDto dto) {
        log.info("dto: {}", dto);

        sympathyService.insertThumb(Sympathy.builder()
                        .userId(dto.getUserId())
                        .movieCd(dto.getMovieCd())
                        .reviewId(dto.getReviewId())
                        .build());
        reviewService.insertSympathy(dto.getReviewId());

        return ResponseEntity.ok().body("success");
    }

    @DeleteMapping
    public ResponseEntity<?> unwish(@RequestBody SympathyDto dto) {
        log.info("dto: {}", dto);

        sympathyService.deleteThumb(Sympathy.builder()
                .userId(dto.getUserId())
                .movieCd(dto.getMovieCd())
                .reviewId(dto.getReviewId())
                .build());
        reviewService.deleteSympathy(dto.getReviewId());

        return ResponseEntity.ok().body("success");
    }


}




















