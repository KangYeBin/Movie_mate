package com.ictproject.moviemate.domain.movie.service;

import com.ictproject.moviemate.domain.movie.mapper.KeywordMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class KeywordService {
    private final KeywordMapper keywordMapper;
    public void insertKeyword(String keyword, String movieCd) {
        if(!keyword.isEmpty()){
            String[] keywords = keyword.split(",");
            for(int i = 0; i < keywords.length; i++){
                keywordMapper.insertKeyword(keywords[i],movieCd);
            }
        }
    }
}
