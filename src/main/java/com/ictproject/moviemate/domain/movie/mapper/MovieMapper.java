package com.ictproject.moviemate.domain.movie.mapper;

import com.ictproject.moviemate.domain.movie.Movie;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MovieMapper {

    void insertMovie(Movie movie);
    boolean isExist(String movieCd);

    // 영화 코드로 영화 검색
    Movie findMovie(String movieCd);

    // 배우 이름으로 영화 검색
    List<Movie> findMoviesByActor(String actorName);

    // 장르로 영화 검색
    List<Movie> findMoviesByGenre(String genreName);

    // 키워드로 영화 검색
    List<Movie> findMoviesByKeyword(String keywordName);

}
