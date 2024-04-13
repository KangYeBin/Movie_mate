package com.ictproject.moviemate;


import com.ictproject.moviemate.domain.movie.service.MovieApiService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class IndexController {
    private final MovieApiService movieService;
    @GetMapping("/")
    public String index() {

        movieService.getKoficData();
        return "index";
    }
}
