package com.ictproject.moviemate.domain.search.controller;

import com.ictproject.moviemate.domain.movie.service.ActorService;
import com.ictproject.moviemate.domain.movie.service.MovieService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
public class SearchController {

    private final MovieService movieService;
    private final ActorService actorService;

    @GetMapping("/search")
    public String searchPage() {
        log.info("search 페이지 들어옴");

        return "search";

    }




}
