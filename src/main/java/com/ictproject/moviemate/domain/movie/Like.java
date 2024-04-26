package com.ictproject.moviemate.domain.movie;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Like {

    private int lno;
    private int userId;
    private String movieCd;
    private int reviewNo;

}
