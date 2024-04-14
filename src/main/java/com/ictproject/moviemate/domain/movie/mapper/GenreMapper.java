package com.ictproject.moviemate.domain.movie.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface GenreMapper {
    void insertGenre(@Param("genreName") String genre,@Param("movieCd") String movieCd);
}
