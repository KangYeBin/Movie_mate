package com.ictproject.moviemate.domain.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieController {
    @GetMapping("/main")
    public String main(Model model) {

        return "main";
    }

}
