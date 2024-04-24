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
    @PostMapping
    public void wish(@RequestBody Wish wish) {
        wishService.insertWish(wish);
    }

    @DeleteMapping
    public void unwish(@RequestBody Wish wish) {
        wishService.deleteWish(wish);
    }


}
