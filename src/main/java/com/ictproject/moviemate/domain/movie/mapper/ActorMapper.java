package com.ictproject.moviemate.domain.movie.mapper;


import com.ictproject.moviemate.domain.movie.Actor;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ActorMapper {
    void insertActor(@Param("actorName") String actorName,@Param("movieCd") String movieCd);
}
