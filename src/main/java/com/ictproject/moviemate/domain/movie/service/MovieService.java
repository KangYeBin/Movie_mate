package com.ictproject.moviemate.domain.movie.service;


import com.ictproject.moviemate.domain.movie.Movie;
import com.ictproject.moviemate.domain.movie.dto.MovieResponseDTO;
import com.ictproject.moviemate.domain.movie.mapper.MovieMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MovieService {
    private final MovieMapper movieMapper;
    public List<MovieResponseDTO> getRecentData() {
        return movieMapper.getRecentData().stream().map(MovieResponseDTO::new).collect(Collectors.toList());
    }

    public List<MovieResponseDTO> getNationData(String nation) {
        return movieMapper.getNationData(nation).stream().map(MovieResponseDTO::new).collect(Collectors.toList());
    }

    public List<MovieResponseDTO> getGenreData(String genre) {
        return movieMapper.findMoviesByGenre(genre).stream().map(MovieResponseDTO::new).collect(Collectors.toList());
    }

    public Movie getMovieData(String movieCd) {
        return movieMapper.findMovie(movieCd);
    }
}
