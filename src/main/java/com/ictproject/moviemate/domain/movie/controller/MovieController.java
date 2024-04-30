package com.ictproject.moviemate.domain.movie.controller;

import com.ictproject.moviemate.domain.movie.dto.MovieResponseDTO;
import com.ictproject.moviemate.domain.movie.service.ActorService;
import com.ictproject.moviemate.domain.movie.service.GenreService;
import com.ictproject.moviemate.domain.movie.service.MovieService;
import com.ictproject.moviemate.domain.review.service.ReviewService;
import com.ictproject.moviemate.domain.user.User;
import com.ictproject.moviemate.domain.wish.Wish;
import com.ictproject.moviemate.domain.wish.service.WishService;
import com.ictproject.moviemate.global.common.Search;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MovieController {
    private final MovieService movieService;
    private final ActorService actorService;
    private final GenreService genreService;
    private final WishService wishService;

    @GetMapping("/main")
    public String main(Model model,HttpSession session) {
        model.addAttribute("recommendByWish", movieService.recommendMovieByWish(session));
        model.addAttribute("recommend", movieService.recommendMovie());
        model.addAttribute("sf", movieService.getGenreData("sf").subList(0,20));
        model.addAttribute("family", movieService.getGenreData("family").subList(0,20));
        model.addAttribute("horror", movieService.getGenreData("horror").subList(0,20));
        model.addAttribute("drama", movieService.getGenreData("drama").subList(0,20));
        model.addAttribute("meloromance", movieService.getGenreData("meloromance").subList(0,20));
        model.addAttribute("mystery", movieService.getGenreData("mystery").subList(0,20));
        model.addAttribute("crime", movieService.getGenreData("crime").subList(0,20));
        model.addAttribute("thriller", movieService.getGenreData("thriller").subList(0,20));
        model.addAttribute("action", movieService.getGenreData("action").subList(0,20));
        model.addAttribute("adventure", movieService.getGenreData("adventure").subList(0,20));

        return "main";
    }


    @GetMapping("/detail/{movieCd}")
    public String detail(@PathVariable("movieCd")String movieCd, Model model,HttpSession session) {
        log.info("movie : {}", movieService.getMovieData(movieCd));
        User userinfo= (User)session.getAttribute("login");
        model.addAttribute("isWish", wishService.checkWish(Wish.builder()
                        .userId(Integer.toString(userinfo.getUserId()))
                        .movieCd(movieCd)
                        .build()));
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

    @GetMapping("/search")
    public String searchPage(Model model, @ModelAttribute("s") Search search){
        log.info("Search : {}", search);

        String type = search.getType();

        model.addAttribute("keyword", search.getKeyword());

        switch (type) {
            case "배우" : {
                List<MovieResponseDTO> dto = movieService.getMovieDataByActor(search.getKeyword());
                model.addAttribute("movie", dto);

                break;
            }
            case "감독" : {
                List<MovieResponseDTO> dto = movieService.getMovieDataByDirector(search.getKeyword());
                model.addAttribute("movie", dto);

                break;
            }
            case "영화제목" : {
                List<MovieResponseDTO> dto = movieService.getMovieDataByMovieName(search.getKeyword());
                model.addAttribute("movie", dto);
                log.info("dto : {}", dto);

                break;
            }
        }


        return "search";

    }
}
