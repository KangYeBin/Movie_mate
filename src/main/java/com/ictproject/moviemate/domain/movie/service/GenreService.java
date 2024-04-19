package com.ictproject.moviemate.domain.movie.service;

import com.ictproject.moviemate.domain.movie.Genre;
import com.ictproject.moviemate.domain.movie.mapper.GenreMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class GenreService {
    private final GenreMapper genreMapper;
    public void insertGenre(String genre, String movieCd) {
        if(!(genre.isEmpty())){
            String[] genres = genre.split(",");
            for(int i = 0; i < genres.length; i++){
                genreMapper.insertGenre(genres[i],movieCd);
            }
        }
    }

    public List<Genre> getGenreData(String movieCd) {
        return genreMapper.findGenres(movieCd);
    }
}
