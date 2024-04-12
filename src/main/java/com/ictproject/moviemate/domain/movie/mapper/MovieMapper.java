package com.ictproject.moviemate.domain.movie.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieMapper {

    void insertMovie();
}
