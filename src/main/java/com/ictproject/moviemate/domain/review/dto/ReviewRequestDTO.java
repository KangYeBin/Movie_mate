package com.ictproject.moviemate.domain.review.dto;


import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewRequestDTO {
    private int userId;
    private int movieCd;
    private String text;
    private float grade;
    private String profile;
    private String movieName;
}
