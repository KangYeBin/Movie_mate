package com.ictproject.moviemate.domain.movie.service;

import com.ictproject.moviemate.domain.movie.Actor;
import com.ictproject.moviemate.domain.movie.mapper.ActorMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ActorService {
    private final ActorMapper actorMapper;
    public void insertActors(String actors,String movieCd) {
        if(!actors.isEmpty()){
            String[] actor = actors.split(",");
            for(int i=0;i<actor.length;i++){
                actorMapper.insertActor(actor[i],movieCd);
            }
        }
    }

    public List<Actor> getActorData(String movieCd) {
        return actorMapper.findActors(movieCd);
    }
}
