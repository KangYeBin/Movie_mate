package com.ictproject.moviemate.domain.movie.controller;

import com.ictproject.moviemate.domain.movie.service.ActorService;
import com.ictproject.moviemate.domain.movie.service.GenreService;
import com.ictproject.moviemate.domain.movie.service.MovieService;
import com.ictproject.moviemate.domain.user.User;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MovieController {
    private final MovieService movieService;
    private final ActorService actorService;
    private final GenreService genreService;

    @GetMapping("/main")
    public String main(Model model) {

        model.addAttribute("sf", movieService.getGenreData("sf"));
        model.addAttribute("family", movieService.getGenreData("family"));
        model.addAttribute("horror", movieService.getGenreData("horror"));
        model.addAttribute("drama", movieService.getGenreData("drama"));
        model.addAttribute("meloromance", movieService.getGenreData("meloromance"));
        model.addAttribute("mystery", movieService.getGenreData("mystery"));
        model.addAttribute("crime", movieService.getGenreData("crime"));
        model.addAttribute("thriller", movieService.getGenreData("thriller"));
        model.addAttribute("action", movieService.getGenreData("action"));
        model.addAttribute("adventure", movieService.getGenreData("adventure"));
        return "main";
    }


    @GetMapping("/detail/{movieCd}")
    public String detail(@PathVariable("movieCd")String movieCd, Model model) {

        log.info("movie : {}", movieService.getMovieData(movieCd));
        model.addAttribute("movie", movieService.getMovieData(movieCd));
        model.addAttribute("actors", actorService.getActorData(movieCd));
        model.addAttribute("genres", genreService.getGenreData(movieCd));

        return "movieinfo";
    }

    @GetMapping("/category/{genre}")
    public String category(@PathVariable("genre") String genreName, Model model) {


        model.addAttribute("category",movieService.getGenreName(genreName));
        model.addAttribute("movie", movieService.getGenreData(genreName));

        log.info("category : {}", genreName);

        return "searchcategory";
    }
}
