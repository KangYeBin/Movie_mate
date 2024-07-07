package com.ictproject.moviemate.domain.sympathy.dto;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SympathyDto {

    private int reviewId;
    private String movieCd;
    private int userId;

}
