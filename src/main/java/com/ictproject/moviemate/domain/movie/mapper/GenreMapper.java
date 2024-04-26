package com.ictproject.moviemate.domain.movie.mapper;

import com.ictproject.moviemate.domain.movie.Genre;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface GenreMapper {
    void insertGenre(@Param("genreName") String genre,@Param("movieCd") String movieCd);

    // 영화 코드로 장르 검색
    List<Genre> findGenres(String movieCd);

    List<String> findByUserWish(int userId);
}
