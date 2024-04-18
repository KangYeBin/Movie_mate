package com.ictproject.moviemate.domain.movie.controller;

import com.ictproject.moviemate.domain.movie.service.MovieService;
import com.ictproject.moviemate.domain.user.User;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MovieController {

    private final MovieService movieService;

    @GetMapping("/main")
    public String main(Model model) {

        model.addAttribute("sf", movieService.getGenreData("SF"));
        model.addAttribute("family", movieService.getGenreData("가족"));
        model.addAttribute("horror", movieService.getGenreData("공포"));
        model.addAttribute("drama", movieService.getGenreData("드라마"));
        model.addAttribute("melodrama", movieService.getGenreData("멜로/로맨스"));
        model.addAttribute("mystery", movieService.getGenreData("미스터리"));
        model.addAttribute("crime", movieService.getGenreData("범죄"));
        model.addAttribute("thriller", movieService.getGenreData("스릴러"));
        model.addAttribute("action", movieService.getGenreData("액션"));
        model.addAttribute("adventure", movieService.getGenreData("어드벤처"));
        return "main";
    }


    @GetMapping("/detail")
    public String detail(Model model) {
        return "movieinfo";
    }
}
