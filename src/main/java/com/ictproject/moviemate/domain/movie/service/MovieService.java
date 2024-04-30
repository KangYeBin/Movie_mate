package com.ictproject.moviemate.domain.movie.service;


import com.ictproject.moviemate.domain.movie.Movie;
import com.ictproject.moviemate.domain.movie.dto.MovieDetailResponseDTO;
import com.ictproject.moviemate.domain.movie.dto.MovieResponseDTO;
import com.ictproject.moviemate.domain.movie.mapper.ActorMapper;
import com.ictproject.moviemate.domain.movie.mapper.GenreMapper;
import com.ictproject.moviemate.domain.movie.mapper.KeywordMapper;
import com.ictproject.moviemate.domain.movie.mapper.MovieMapper;
import com.ictproject.moviemate.domain.user.User;
import com.ictproject.moviemate.domain.wish.service.WishService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class MovieService {
    private final MovieMapper movieMapper;
    private final KeywordMapper keywordMapper;
    private final GenreMapper genreMapper;
    private final ActorMapper actorMapper;

    public List<MovieResponseDTO> getRecentData() {
        return movieMapper.getRecentData().stream().map(MovieResponseDTO::new).collect(Collectors.toList());
    }

    public List<MovieResponseDTO> getNationData(String nation) {
        return movieMapper.getNationData(nation).stream().map(MovieResponseDTO::new).collect(Collectors.toList());
    }

    public List<MovieResponseDTO> getGenreData(String genre) {
        return movieMapper.findMoviesByGenre(getGenreName(genre)).stream().map(MovieResponseDTO::new).collect(Collectors.toList());
    }

    public MovieDetailResponseDTO getMovieData(String movieCd) {
        return new MovieDetailResponseDTO(movieMapper.findMovie(movieCd));
    }

    public String getGenreName(String genre) {
        Map<String, String> map = new HashMap<>();
        map.put("sf", "SF");
        map.put("family", "가족");
        map.put("horror", "공포");
        map.put("noir", "느와르");
        map.put("homosexual", "동성애");
        map.put("drama", "드라마");
        map.put("meloromance", "멜로/로맨스");
        map.put("melodrama", "멜로드라마");

        map.put("wuxia", "무협");
        map.put("culture", "문화");
        map.put("musical", "뮤지컬");
        map.put("music", "뮤직");
        map.put("mystery", "미스터리");
        map.put("crime", "범죄");
        map.put("social", "사회");
        map.put("social-tendency", "사회물(경향");

        map.put("thriller", "스릴러");
        map.put("sports", "스포츠");
        map.put("history", "시대극/사극");
        map.put("kids", "아동");
        map.put("action", "액션");
        map.put("adventure", "어드벤처");
        map.put("omnibus", "옴니버스");
        map.put("humanrights", "인권");

        map.put("human", "인물");
        map.put("disaster", "재난");
        map.put("biography", "전기");
        map.put("war", "전쟁");
        map.put("religion", "종교");
        map.put("youth", "청춘영화");
        map.put("comedy", "코메디");
        map.put("fantasy", "판타지");

        return map.get(genre);
    }

    public List<MovieResponseDTO> getMovieDataByActor(String actorName) {
        return movieMapper.findMoviesByActor(actorName).stream().map(MovieResponseDTO::new).collect(Collectors.toList());
    }

    public List<MovieResponseDTO> getMovieDataByDirector(String directorName) {
        return movieMapper.findMoviesByDirector(directorName).stream().map(MovieResponseDTO::new).collect(Collectors.toList());
    }

    public List<MovieResponseDTO> getMovieDataByMovieName(String movieName) {
        log.info("movieName : {}", movieName);
        return movieMapper.findMoviesByMovieName(movieName).stream().map(MovieResponseDTO::new).collect(Collectors.toList());
    }

    public List<MovieResponseDTO> recommendMovie(){
        return movieMapper.findMovieByRecommend().stream().map(MovieResponseDTO::new).collect(Collectors.toList());
    }
    public List<MovieResponseDTO> recommendMovieByWish(HttpSession session){
        User userinfo= (User)session.getAttribute("login");
        int userId = userinfo.getUserId();
        List<MovieResponseDTO> recommendMovie = new ArrayList<>();
        //찜한 영화에 포함된 키워드 중 집계 값이 많은 키워드 2개를 가져와 각 키워드마다 같은 키워드를 가지면서 찜 수가 제일 많은 영화 3개만 가져옴
        List<String> wishKeyword = keywordMapper.findByUserWish(userId);
        for(String keyword : wishKeyword){
            List<MovieResponseDTO> collect =
                    movieMapper
                    .findMovieByWishKeyword(keyword, userId)
                    .stream().map(MovieResponseDTO::new)
                    .collect(Collectors.toList());
            recommendMovie.addAll(collect);
        }
        //찜한 영화에 포함된 장르 중 집계 값이 많은 장르 2개를 가져와 각 장르마다 같은 장르를 가지면서 찜 수가 제일 많은 영화 3개만 가져옴
        List<String> wishGenre = genreMapper.findByUserWish(userId);
        for(String genre : wishGenre){
            List<MovieResponseDTO> collect = movieMapper.findMovieByWishGenre(genre, userId).stream().map(MovieResponseDTO::new).collect(Collectors.toList());
            recommendMovie.addAll(collect);
        }
        //찜한 영화에 포함된 배우 중 집계 값이 많은 배우 2개를 가져와 각 배우마다 같은 배우를 가지면서 찜 수가 제일 많은 영화 를 3개만 가져옴
        List<String> wishActor = actorMapper.findByUserWish(userId);
        for(String actor : wishActor){
            List<MovieResponseDTO> collect = movieMapper.findMovieByWishActor(actor, userId).stream().map(MovieResponseDTO::new).collect(Collectors.toList());
            recommendMovie.addAll(collect);
        }

        return recommendMovie.stream().distinct().collect(Collectors.toList());
    }

    public void plusWishCnt(String movieCd){
        movieMapper.plusWishCnt(movieCd);
    }

    public void minusWishCnt(String movieCd){
        movieMapper.minusWishCnt(movieCd);
    }

}
