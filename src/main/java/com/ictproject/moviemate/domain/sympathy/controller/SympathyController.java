package com.ictproject.moviemate.domain.sympathy.controller;


import com.ictproject.moviemate.domain.movie.Like;
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
    @PostMapping
    public ResponseEntity<?> wish(@RequestBody SympathyDto dto) {
        log.info("dto: {}", dto);

        sympathyService.insertThumb(Like.builder()
                        .userId(dto.getUserId())
                        .movieCd(dto.getMovieCd())
                        .reviewNo(dto.getReviewNo())
                        .build());

        return ResponseEntity.ok().body("success");
    }

    @DeleteMapping
    public ResponseEntity<?> unwish(@RequestBody SympathyDto dto) {
        log.info("dto: {}", dto);

        sympathyService.deleteThumb(Like.builder()
                .userId(dto.getUserId())
                .movieCd(dto.getMovieCd())
                .reviewNo(dto.getReviewNo())
                .build());

        return ResponseEntity.ok().body("success");
    }


}




















