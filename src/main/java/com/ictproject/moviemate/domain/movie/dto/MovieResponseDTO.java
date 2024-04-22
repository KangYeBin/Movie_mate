package com.ictproject.moviemate.domain.movie.dto;

import com.ictproject.moviemate.domain.movie.Movie;
import lombok.*;
import org.springframework.web.bind.annotation.GetMapping;


@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class MovieResponseDTO {
    private String movieCd;
    private String MovieName;
    private String imageUrl;
    private String stillUrl;

    public MovieResponseDTO(Movie movie) {
        this.movieCd = movie.getMovieCd();
        this.MovieName = movie.getMovieName();
        this.imageUrl = cutUrl(movie.getImageUrl());
        this.stillUrl = movie.getStillUrl();
    }
    private String cutUrl(String url){
        String result = "";
        if(url.contains("|")){
            result=url.substring(0,url.indexOf("|"));
        }else{
            result=url;
        }
        return result;
    }
}
