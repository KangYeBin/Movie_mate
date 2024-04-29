package com.ictproject.moviemate.domain.sympathy;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Sympathy {

    private int lno;
    private int userId;
    private String movieCd;
    private int reviewId;

}
