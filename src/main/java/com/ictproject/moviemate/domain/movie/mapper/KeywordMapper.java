package com.ictproject.moviemate.domain.movie.mapper;

import com.ictproject.moviemate.domain.movie.Keyword;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface KeywordMapper {
    void insertKeyword(@Param("keywordName") String keyword,@Param("movieCd") String movieCd);

    // 영화 코드로 키워드 검색
    List<Keyword> findKeywords(String movieCd);

    List<String> findByUserWish(int userId);
}
