package com.ictproject.moviemate.domain.review.dto;


import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewModifyRequestDTO {
    private int reviewId;
    private String text;
    private float grade;
}
