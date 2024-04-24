package com.ictproject.moviemate.domain.user.controller;

import com.ictproject.moviemate.domain.movie.dto.MovieResponseDTO;
import com.ictproject.moviemate.domain.review.dto.ReviewDetailResponseDTO;
import com.ictproject.moviemate.domain.review.service.ReviewService;
import com.ictproject.moviemate.domain.user.User;
import com.ictproject.moviemate.domain.wish.service.WishService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class UserController {

    private final WishService wishService;
    private final ReviewService reviewService;

    @GetMapping("/my")
    public String myPage(Model model, HttpSession session){

        User loginUser = (User) session.getAttribute("login");
        List<MovieResponseDTO> movieDTO = wishService.findWish(loginUser.getUserId());
        List<ReviewDetailResponseDTO> reviewDTO = reviewService.getReview(loginUser.getUserId());

        model.addAttribute("movie", movieDTO);
        model.addAttribute("review", reviewDTO);
        log.info("movie : {}", movieDTO);
        log.info("review : {}", reviewDTO);

        return "mypage";
    }

}
