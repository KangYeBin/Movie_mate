package com.ictproject.moviemate.domain.wish.controller;


import com.ictproject.moviemate.domain.wish.Wish;
import com.ictproject.moviemate.domain.wish.service.WishService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/wish")
@RequiredArgsConstructor
public class WishController {

    private final WishService wishService;
    @PostMapping("/{userId}/{movieCd}")
    public void wish(@PathVariable String userId, @PathVariable String movieCd) {
        wishService.insertWish(Wish.builder()
                .userId(userId)
                .movieCd(movieCd)
                .build());
    }

    @DeleteMapping("/{userId}/{movieCd}")
    public void unwish(@PathVariable String userId, @PathVariable String movieCd) {
        wishService.deleteWish(Wish.builder()
                .userId(userId)
                .movieCd(movieCd)
                .build());
    }


}
