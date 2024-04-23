package com.ictproject.moviemate.domain.review.controller;


import com.ictproject.moviemate.domain.review.dto.ReviewRequestDTO;
import com.ictproject.moviemate.domain.review.service.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/review")
@RequiredArgsConstructor
public class ReviewController {
    private final ReviewService reviewService;
    @PostMapping("/create")
    public void create(@RequestBody ReviewRequestDTO reviewRequestDTO) {
    }
}
