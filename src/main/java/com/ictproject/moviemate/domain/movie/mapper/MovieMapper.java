package com.ictproject.moviemate.domain.movie.mapper;

import com.ictproject.moviemate.domain.movie.Movie;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieMapper {

    void insertMovie(Movie movie);
    boolean isExist(String movieCd);
}
