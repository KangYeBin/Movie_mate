package com.ictproject.moviemate.domain.wish.controller;


import com.ictproject.moviemate.domain.movie.service.MovieService;
import com.ictproject.moviemate.domain.wish.Wish;
import com.ictproject.moviemate.domain.wish.service.WishService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/wish")
@RequiredArgsConstructor
public class WishController {

    private final WishService wishService;
    private final MovieService movieService;
    @PostMapping("/{userId}/{movieCd}")
    public ResponseEntity<?> wish(@PathVariable String userId, @PathVariable String movieCd) {
        wishService.insertWish(Wish.builder()
                .userId(userId)
                .movieCd(movieCd)
                .build());
        movieService.plusWishCnt(movieCd);
        return ResponseEntity.ok().body("ok");
    }

    @DeleteMapping("/{userId}/{movieCd}")
    public ResponseEntity<?> unwish(@PathVariable String userId, @PathVariable String movieCd) {
        wishService.deleteWish(Wish.builder()
                .userId(userId)
                .movieCd(movieCd)
                .build());
        movieService.minusWishCnt(movieCd);
        return ResponseEntity.ok().body("ok");
    }


}
