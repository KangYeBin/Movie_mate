package com.ictproject.moviemate.domain.movie.mapper;

import com.ictproject.moviemate.domain.movie.Movie;
import com.ictproject.moviemate.domain.movie.dto.MovieResponseDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MovieMapper {

    void insertMovie(Movie movie);
    boolean isExist(String movieCd);

    List<Movie> getRecentData();
}
