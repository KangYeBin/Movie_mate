package com.ictproject.moviemate.domain.movie.mapper;


import com.ictproject.moviemate.domain.movie.Actor;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ActorMapper {
    void insertActor(@Param("actorName") String actorName,@Param("movieCd") String movieCd);

    // 영화 코드로 배우 검색
    List<Actor> findActors(String movieCd);

    List<String> findByUserWish(int userId);

}
