package com.ictproject.moviemate.domain.movie.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface KeywordMapper {
    void insertKeyword(@Param("keywordName") String keyword,@Param("movieCd") String movieCd);
}
