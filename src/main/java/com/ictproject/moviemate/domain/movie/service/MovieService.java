package com.ictproject.moviemate.domain.movie.service;


import com.ictproject.moviemate.domain.movie.Movie;
import com.ictproject.moviemate.domain.movie.dto.MovieDetailResponseDTO;
import com.ictproject.moviemate.domain.movie.dto.MovieResponseDTO;
import com.ictproject.moviemate.domain.movie.mapper.MovieMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class MovieService {
    private final MovieMapper movieMapper;
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
}
