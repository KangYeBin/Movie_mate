package com.ictproject.moviemate.domain.sympathy;

import lombok.*;

@Setter @Getter @ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Sympathy {

    private int reviewId; // 유저 아이디? 게시물 번호?
    private int sympathyCnt; // 공감 수

}
